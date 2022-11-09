package com.mobileshop.api.admin;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mobileshop.entities.CartDetails;
import com.mobileshop.entities.Cart;
import com.mobileshop.entities.User;
import com.mobileshop.entities.ResponseObject;
import com.mobileshop.entities.Product;
import com.mobileshop.service.CartDetailsService;
import com.mobileshop.service.CartService;
import com.mobileshop.service.UserService;
import com.mobileshop.service.ProductService;

@RestController
@RequestMapping("api/cart")
@SessionAttributes("loggedInUser")
public class CartApi  {
	
	@Autowired
	private UserService nguoiDungService;
	@Autowired
	private CartService gioHangService;
	@Autowired
	private ProductService sanPhamService;
	@Autowired
	private CartDetailsService chiMucGioHangService;
	
	@ModelAttribute("loggedInUser")
	public User loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return nguoiDungService.findByEmail(auth.getName());
	}
	
	public User getSessionUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute("loggedInUser");
	}
	
	@GetMapping("/addSanPham")
	public ResponseObject addToCart(@RequestParam String id,HttpServletRequest request,HttpServletResponse response) {
		ResponseObject ro = new ResponseObject();
		Product sp = sanPhamService.getSanPhamById(Long.parseLong(id));
		if(sp.getDonViKho() == 0)
		{
			ro.setStatus("false");
			return ro;
		}
		User currentUser = getSessionUser(request);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();	
		if(auth == null || auth.getPrincipal() == "anonymousUser" )    //Su dung cookie de luu
		{
			Cookie clientCookies[] = request.getCookies();
			boolean found = false;
			for(int i=0;i<clientCookies.length;i++)
			{
				if(clientCookies[i].getName().equals(id))     //Neu san pham da co trong cookie tang so luong them 1
				{				
					clientCookies[i].setValue(Integer.toString(Integer.parseInt(clientCookies[i].getValue())+1));
					clientCookies[i].setPath("/mobileshop");
					clientCookies[i].setMaxAge(60*60*24*7);
					response.addCookie(clientCookies[i]);
					found = true;
					break;
				}
			}
			if(!found)   //Neu san pham ko co trong cookie,them vao cookie
			{
				Cookie c = new Cookie(id,"1");
				c.setPath("/mobileshop");
				c.setMaxAge(60*60*24*7);
				response.addCookie(c);
			}
		}else {     //Su dung database de luu
			Cart g = gioHangService.getGioHangByNguoiDung(currentUser);
			if(g==null)
			{
				g = new Cart();
				g.setNguoiDung(currentUser);
				g = gioHangService.save(g);			
			}
			
			CartDetails c = chiMucGioHangService.getChiMucGioHangBySanPhamAndGioHang(sp,g);
			if(c== null)     //Neu khong tim chi muc gio hang, tao moi
			{
				System.out.println(g.getNguoiDung().getEmail());
				System.out.println(g.getId());
				c = new CartDetails();
				c.setGioHang(g);
				c.setSanPham(sp);
				c.setSo_luong(1);
			}else       //Neu san pham da co trong database tang so luong them 1
			{
				c.setSo_luong(c.getSo_luong()+1);
			}
			c = chiMucGioHangService.saveChiMucGiohang(c);
		}
		ro.setStatus("success");
		return ro;
	}
	
	@GetMapping("/changSanPhamQuanity")
	public ResponseObject changeQuanity(@RequestParam String id,@RequestParam String value,HttpServletRequest request,HttpServletResponse response) {
		User currentUser = getSessionUser(request);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		ResponseObject ro = new ResponseObject();
		if(auth == null || auth.getPrincipal() == "anonymousUser" )    //Su dung cookie de luu
		{
			Cookie clientCookies[] = request.getCookies();
			for(int i=0;i<clientCookies.length;i++)
			{
				if(clientCookies[i].getName().equals(id))
				{						
					clientCookies[i].setValue(value);
					clientCookies[i].setPath("/mobileshop");
					clientCookies[i].setMaxAge(60*60*24*7);
					response.addCookie(clientCookies[i]);
					break;
				}
			}
		}else //Su dung database de luu
		{
			Cart g = gioHangService.getGioHangByNguoiDung(currentUser);
			Product sp = sanPhamService.getSanPhamById(Long.parseLong(id));
			CartDetails c = chiMucGioHangService.getChiMucGioHangBySanPhamAndGioHang(sp,g);
			c.setSo_luong(Integer.parseInt(value));
			c = chiMucGioHangService.saveChiMucGiohang(c);
		}
		ro.setStatus("success");
		return ro;
	}
	
	@GetMapping("/deleteFromCart")
	public ResponseObject deleteSanPham(@RequestParam String id,HttpServletRequest request,HttpServletResponse response) {
		User currentUser = getSessionUser(request);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();	
		ResponseObject ro = new ResponseObject();
		if(auth == null || auth.getPrincipal() == "anonymousUser")    //Su dung cookie de luu
		{
			Cookie clientCookies[] = request.getCookies();
			for(int i=0;i<clientCookies.length;i++)
			{
				if(clientCookies[i].getName().equals(id))
				{						
					clientCookies[i].setMaxAge(0);
					clientCookies[i].setPath("/mobileshop");
					System.out.println(clientCookies[i].getMaxAge());
					response.addCookie(clientCookies[i]);
					break;
				}
			}
		}else //Su dung database de luu
		{
			Cart g = gioHangService.getGioHangByNguoiDung(currentUser);
			Product sp = sanPhamService.getSanPhamById(Long.parseLong(id));
			CartDetails c = chiMucGioHangService.getChiMucGioHangBySanPhamAndGioHang(sp,g);
			chiMucGioHangService.deleteChiMucGiohang(c);
		}
		
		ro.setStatus("success");
		return ro;
	}
}
