package com.zephyr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zephyr.client.ProductClient;
import com.zephyr.entity.Product;
import com.zephyr.service.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController {

	@Autowired
	private ProductService productService;
	
//	@Autowired
//	private ProductClient productClient;
	
	@GetMapping
	public String showProducts(Model model) {
		List<Product> products = productService.get();
		model.addAttribute("products", products);
		return "products";
	}
	
	@GetMapping("/search")
	public String searchProducts(@RequestParam("search") String queryString, Model model) {
		List<Product> products = productService.findByNameContainingIgnoreCase(queryString);
		model.addAttribute("products", products);
		return "products";
	}
	
}
