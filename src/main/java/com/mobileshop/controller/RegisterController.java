package com.mobileshop.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.mobileshop.entities.User;
import com.mobileshop.service.UserService;
import com.mobileshop.service.SecurityService;
import com.mobileshop.validator.UserValidator;

@Controller
public class RegisterController {

    @Autowired
    private UserService nguoiDungService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator nguoiDungValidator;
	
	
	@GetMapping("/register")
	public String registerPage(Model model) {
		model.addAttribute("newUser", new User());
		return "client/register";
	}
	
	@PostMapping("/register")
	public String registerProcess(@ModelAttribute("newUser") @Valid User nguoiDung, BindingResult bindingResult, Model model) {
	    
		nguoiDungValidator.validate(nguoiDung, bindingResult);
		
        if (bindingResult.hasErrors()) {
            return "client/register";
        }
        
        nguoiDungService.saveUserForMember(nguoiDung);

        securityService.autologin(nguoiDung.getEmail(), nguoiDung.getConfirmPassword());

        return "redirect:/";
	}
}
