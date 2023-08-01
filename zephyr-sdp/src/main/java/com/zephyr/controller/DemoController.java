package com.zephyr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.zephyr.dto.CrmUser;
import com.zephyr.entity.Order;
import com.zephyr.entity.Query;
import com.zephyr.entity.User;
import com.zephyr.service.OrderService;
import com.zephyr.service.QueryService;
import com.zephyr.service.UserService;

@Controller
public class DemoController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private QueryService queryService;

	@GetMapping
	public String showHome() {
		return "home";
	}
	
	@GetMapping("/profile")
	public String showProfile(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			String username = ((UserDetails)principal).getUsername();
			User user = userService.findByUsername(username);
			model.addAttribute("user", user);
		} else {
			String username = principal.toString();
			System.out.println(username);
		}
		return "profile";
	}
	
	@GetMapping("/profile/edit")
	public String editProfile(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = null;
		if (principal instanceof UserDetails) {
			String username = ((UserDetails)principal).getUsername();
			user = userService.findByUsername(username);
		} else {
			String username = principal.toString();
			System.out.println(username);
		}
		CrmUser crm = new CrmUser();
		crm.setFirstName(user.getFirstName());
		crm.setLastName(user.getLastName());
		crm.setEmail(user.getEmail());
		crm.setGender(user.getGender());
		crm.setUsername(user.getUsername());
		model.addAttribute("user", crm);
		return "user-edit-profile";
	}
	
	@PostMapping("/profile/edit")
	public String editProfile(@ModelAttribute("user") CrmUser user) {
		userService.update(user, user.getUsername());
		return "redirect:/profile";
	}
	
	@GetMapping("/orders")
	public String orders(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = null;
		if (principal instanceof UserDetails) {
			String username = ((UserDetails)principal).getUsername();
			user = userService.findByUsername(username);
		} else {
			String username = principal.toString();
			System.out.println(username);
		}
		List<Order> orders = orderService.get(user);
		model.addAttribute("orders", orders);
		return "orders";
	}
	
	@GetMapping("/orderplaced")
	public String orderPlaced() {
		return "order-placed";
	}
	
	@GetMapping("/queryform")
	public String showQueriesPage(Model model) {
		model.addAttribute("query", new Query());
		return "query-form";
	}
	
	@PostMapping("/queryform")
	public String processQueryPage(@ModelAttribute("query") Query q) {
		queryService.save(q);
		return "redirect:/";
	}
	
	@GetMapping("/access-denied")
	public String showAccessDenied() {
		return "access-denied";
	}
	
}
