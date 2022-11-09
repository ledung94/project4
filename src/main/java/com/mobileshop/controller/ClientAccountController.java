package com.mobileshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.common.collect.Lists;
import com.mobileshop.dto.PasswordDTO;
import com.mobileshop.entities.Orders;
import com.mobileshop.entities.User;
import com.mobileshop.entities.ResponseObject;
import com.mobileshop.service.OrderService;
import com.mobileshop.service.UserService;

@Controller
@SessionAttributes("loggedInUser")
@RequestMapping("/")

public class ClientAccountController {

	@Autowired
	private UserService nguoiDungService;
	
	@Autowired
	private OrderService donHangService;
	
	
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@ModelAttribute("loggedInUser")
	public User loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return nguoiDungService.findByEmail(auth.getName());
	}

	public User getSessionUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute("loggedInUser");
	}
	
	@GetMapping("/account")
	public String accountPage(HttpServletRequest res, Model model) {
		User currentUser = getSessionUser(res);
		model.addAttribute("user", currentUser);
		List<Orders> list = Lists.reverse(donHangService.getDonHangByNguoiDung(currentUser));
		model.addAttribute("list",list);
		return "client/account";
	}
	
	@GetMapping("/changeInformation")
	public String clientChangeInformationPage(HttpServletRequest res,Model model) {
		User currentUser = getSessionUser(res);
		model.addAttribute("user", currentUser);
		return "client/information";
	}

	@GetMapping("/changePassword")
	public String clientChangePasswordPage() {
		return "client/passwordChange";
	}
	
	@PostMapping("/updateInfo")
	@ResponseBody
	public ResponseObject commitChange(HttpServletRequest res,@RequestBody User ng) {
		User currentUser = getSessionUser(res);
		currentUser.setHoTen(ng.getHoTen());
		currentUser.setSoDienThoai(ng.getSoDienThoai());
		currentUser.setDiaChi(ng.getDiaChi());
		nguoiDungService.updateUser(currentUser);
		return new ResponseObject();
	}
	
	@PostMapping("/updatePassword")
	@ResponseBody
	public ResponseObject passwordChange(HttpServletRequest res,@RequestBody PasswordDTO dto) {
		User currentUser = getSessionUser(res);
		if (!passwordEncoder.matches( dto.getOldPassword(), currentUser.getPassword())) {
			ResponseObject re = new ResponseObject();
			re.setStatus("old");
			return re;
		}
		nguoiDungService.changePass(currentUser, dto.getNewPassword());
		return new ResponseObject();
	}

}
