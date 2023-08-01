package com.zephyr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zephyr.entity.Order;
import com.zephyr.entity.User;
import com.zephyr.service.OrderService;
import com.zephyr.service.ProductService;
import com.zephyr.service.UserService;

@Controller
@RequestMapping("/buy")
public class BuyController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/{id}")
	public String showPurchasePage(@PathVariable("id") long productId, Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = null;
		if (principal instanceof UserDetails) {
			String username = ((UserDetails)principal).getUsername();
			user = userService.findByUsername(username);
		} else {
			String username = principal.toString();
			System.out.println(username);
		}
		if(user == null) {
			return "redirect:/login";
		}
		model.addAttribute("order", new Order());
		model.addAttribute("product", productService.getById(productId));
		return "order-page";
	}
	
	@PostMapping("/{id}")
	public String processPurchasePage(@PathVariable("id") long productId, @ModelAttribute("order") Order order) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = null;
		if (principal instanceof UserDetails) {
			String username = ((UserDetails)principal).getUsername();
			user = userService.findByUsername(username);
		} else {
			String username = principal.toString();
			System.out.println(username);
		}
		order.setUser(user);
		order.setProduct(productService.getById(productId));
		orderService.save(order);
		return "redirect:/orderplaced";
	}
}
