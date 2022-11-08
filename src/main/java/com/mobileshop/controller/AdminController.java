package com.mobileshop.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mobileshop.dto.ListTaskDTO;
import com.mobileshop.entities.User;
import com.mobileshop.entities.Role;
import com.mobileshop.service.CategoryService;
import com.mobileshop.service.OrderService;
import com.mobileshop.service.ManufacturerService;
import com.mobileshop.service.ContactService;
import com.mobileshop.service.UserService;
import com.mobileshop.service.RoleService;

@Controller
@RequestMapping("/admin")
@SessionAttributes("loggedInUser")
public class AdminController {

	@Autowired
	private CategoryService danhMucService;

	@Autowired
	private ManufacturerService hangSXService;

	@Autowired
	private UserService nguoiDungService;

	@Autowired
	private RoleService vaiTroService;
	
	@Autowired
	private ContactService lienHeService;

	@Autowired
	private OrderService donHangService;

	@ModelAttribute("loggedInUser")
	public User loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return nguoiDungService.findByEmail(auth.getName());
	}

	@GetMapping
	public String adminPage(Model model) {
		ListTaskDTO listCongViec = new ListTaskDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ giao"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Chờ duyệt"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		return "admin/index";
	}

	@GetMapping("/category")
	public String quanLyDanhMucPage() {
		return "admin/category";
	}

	@GetMapping("/manufacturer")
	public String quanLyNhanHieuPage() {
		return "admin/manufacturer";
	}

	@GetMapping("/contact")
	public String quanLyLienHePage() {
		return "admin/contact";
	}
	
	@GetMapping("/product")
	public String quanLySanPhamPage(Model model) {
		model.addAttribute("listNhanHieu", hangSXService.getALlHangSX());
		model.addAttribute("listDanhMuc", danhMucService.getAllDanhMuc());
		return "admin/product";
	}

	@GetMapping("/profile")
	public String profilePage(Model model, HttpServletRequest request) {
		model.addAttribute("user", getSessionUser(request));
		return "admin/profile";
	}

	@PostMapping("/profile/update")
	public String updateNguoiDung(@ModelAttribute User nd, HttpServletRequest request) {
		User currentUser = getSessionUser(request);
		currentUser.setDiaChi(nd.getDiaChi());
		currentUser.setHoTen(nd.getHoTen());
		currentUser.setSoDienThoai(nd.getSoDienThoai());
		nguoiDungService.updateUser(currentUser);
		return "redirect:/admin/profile";
	}

	@GetMapping("/order")
	public String quanLyDonHangPage(Model model) {
		Set<Role> vaiTro = new HashSet<>();
		// lấy danh sách shipper
		vaiTro.add(vaiTroService.findByTenVaiTro("ROLE_SHIPPER"));
		List<User> shippers = nguoiDungService.getNguoiDungByVaiTro(vaiTro);
		for (User shipper : shippers) {
			shipper.setListDonHang(donHangService.findByTrangThaiDonHangAndShipper("Đang giao", shipper));
		}
		model.addAttribute("allShipper", shippers);
		return "admin/order";
	}

	@GetMapping("/account")
	public String quanLyTaiKhoanPage(Model model) {
	    model.addAttribute("listVaiTro", vaiTroService.findAllVaiTro());
		return "admin/account";
	}
	
	@GetMapping("/report")
	public String thongKePage(Model model) {
		return "admin/report";
	}
	
	public User getSessionUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute("loggedInUser");
	}
	
	

}
