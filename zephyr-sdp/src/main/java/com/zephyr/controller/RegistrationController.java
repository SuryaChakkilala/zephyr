package com.zephyr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zephyr.dto.CrmUser;
import com.zephyr.entity.User;
import com.zephyr.service.UserService;

@Controller
@RequestMapping("/register")
public class RegistrationController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping
	public String showRegisterPage(Model model) {
		model.addAttribute("user", new CrmUser());
		return "register";
	}
	
	@PostMapping
	public String processRegisterPage(@ModelAttribute("user") CrmUser crm, Model model) {
		String username = crm.getUsername();
		User existing = userService.findByUsername(username);
		if(existing != null) {
			model.addAttribute("user", new CrmUser());
			model.addAttribute("registrationError", "User already registered");
			return "register";
		}
		userService.save(crm);
		return "redirect:/login";
	}
	
}
