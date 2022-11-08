package com.mobileshop.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mobileshop.entities.CartDetails;
import com.mobileshop.entities.OrderDetails;
import com.mobileshop.entities.Order;
import com.mobileshop.entities.Cart;
import com.mobileshop.entities.User;
import com.mobileshop.entities.Product;
import com.mobileshop.service.CartDetailsService;
import com.mobileshop.service.OrderDetailsService;
import com.mobileshop.service.OrderService;
import com.mobileshop.service.CartService;
import com.mobileshop.service.UserService;
import com.mobileshop.service.ProductService;

@Controller
@SessionAttributes("loggedInUser")
public class CheckOutController {
	
	@Autowired
	private ProductService sanPhamService;
	@Autowired
	private UserService nguoiDungService;
	@Autowired
	private CartService gioHangService;
	@Autowired
	private CartDetailsService chiMucGioHangService;
	@Autowired
	private OrderService donHangService;
	@Autowired
	private OrderDetailsService chiTietDonHangService;

	@ModelAttribute("loggedInUser")
	public User loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return nguoiDungService.findByEmail(auth.getName());
	}
	
	public User getSessionUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute("loggedInUser");
	}
	
	@GetMapping("/checkout")
	public String checkoutPage(HttpServletRequest res,Model model) {
		User currentUser = getSessionUser(res);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Map<Long,String> quanity = new HashMap<Long,String>();
		List<Product> listsp = new ArrayList<Product>();
				
		if(auth == null || auth.getPrincipal() == "anonymousUser")     //Lay tu cookie
		{
			Cookie cl[] = res.getCookies();		
			Set<Long> idList = new HashSet<Long>();
			for(int i=0; i< cl.length; i++)
			{
				if(cl[i].getName().matches("[0-9]+"))
				{
					idList.add(Long.parseLong(cl[i].getName()));
					quanity.put(Long.parseLong(cl[i].getName()), cl[i].getValue());  
				}
				
			}
			listsp = sanPhamService.getAllSanPhamByList(idList);
		}else     //Lay tu database
		{
			Cart g = gioHangService.getGioHangByNguoiDung(currentUser);
			if(g != null)
			{
				List<CartDetails> listchimuc = chiMucGioHangService.getChiMucGioHangByGioHang(g);
				
				for(CartDetails c: listchimuc)
				{
					
					listsp.add(c.getSanPham());
					quanity.put(c.getSanPham().getId(), Integer.toString(c.getSo_luong()));
									
				}
			}
		}
		
		model.addAttribute("cart",listsp);
		model.addAttribute("quanity",quanity);
		model.addAttribute("user", currentUser);
		model.addAttribute("donhang", new Order());
		
		return "client/checkout";
	}
	
	@PostMapping(value="/thankyou")
	public String thankyouPage(@ModelAttribute("donhang") Order donhang ,HttpServletRequest req,HttpServletResponse response ,Model model){
		donhang.setNgayDatHang(new Date());
		donhang.setTrangThaiDonHang("Đang chờ giao");

		User currentUser = getSessionUser(req);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Map<Long,String> quanity = new HashMap<Long,String>();
		List<Product> listsp = new ArrayList<Product>();
		List<OrderDetails> listDetailDH = new ArrayList<OrderDetails>();
	
		if(auth == null || auth.getPrincipal() == "anonymousUser")     //Lay tu cookie
		{
			Order d = donHangService.save(donhang);
			Cookie cl[] = req.getCookies();		
			Set<Long> idList = new HashSet<Long>();
			for(int i=0; i< cl.length; i++)
			{
				if(cl[i].getName().matches("[0-9]+"))
				{
					idList.add(Long.parseLong(cl[i].getName()));					
					quanity.put(Long.parseLong(cl[i].getName()), cl[i].getValue());  
				}	
			}
			listsp = sanPhamService.getAllSanPhamByList(idList);
			for(Product sp: listsp)
			{
				OrderDetails detailDH = new OrderDetails();
				detailDH.setSanPham(sp);
				detailDH.setSoLuongDat(Integer.parseInt(quanity.get(sp.getId())));
				detailDH.setDonGia(Integer.parseInt(quanity.get(sp.getId()))*sp.getDonGia());
				detailDH.setDonHang(d);
				listDetailDH.add(detailDH);
			}
		}else     //Lay tu database
		{
			donhang.setNguoiDat(currentUser);
			Order d = donHangService.save(donhang);
			Cart g = gioHangService.getGioHangByNguoiDung(currentUser);
			List<CartDetails> listchimuc = chiMucGioHangService.getChiMucGioHangByGioHang(g);
			for(CartDetails c: listchimuc)
			{			
				OrderDetails detailDH = new OrderDetails();
				detailDH.setSanPham(c.getSanPham());
				detailDH.setDonGia(c.getSo_luong()*c.getSanPham().getDonGia());	
				detailDH.setSoLuongDat(c.getSo_luong());
				detailDH.setDonHang(d);
				listDetailDH.add(detailDH);		
				
				listsp.add(c.getSanPham());
				quanity.put(c.getSanPham().getId(), Integer.toString(c.getSo_luong()));
			}
			
		}					
			
		chiTietDonHangService.save(listDetailDH);
		
		cleanUpAfterCheckOut(req,response);
		model.addAttribute("donhang",donhang);
		model.addAttribute("cart",listsp);
		model.addAttribute("quanity",quanity);
		return "client/thankYou";
	}
	
	public void cleanUpAfterCheckOut(HttpServletRequest request, HttpServletResponse response)
	{
		User currentUser = getSessionUser(request);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(auth == null || auth.getPrincipal() == "anonymousUser")    //Su dung cookie de luu
		{
			Cookie clientCookies[] = request.getCookies();
			for(int i=0;i<clientCookies.length;i++)
			{
				if(clientCookies[i].getName().matches("[0-9]+"))
				{						
					clientCookies[i].setMaxAge(0);
					clientCookies[i].setPath("/laptopshop");
					response.addCookie(clientCookies[i]);
				}
			}
		}else //Su dung database de luu
		{
			Cart g = gioHangService.getGioHangByNguoiDung(currentUser);
			List<CartDetails> c = chiMucGioHangService.getChiMucGioHangByGioHang(g);
			chiMucGioHangService.deleteAllChiMucGiohang(c);
		}
	}
	
	
	
}
