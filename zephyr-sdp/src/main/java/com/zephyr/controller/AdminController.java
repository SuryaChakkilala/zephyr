package com.zephyr.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zephyr.client.CategoryClient;
import com.zephyr.client.OrderClient;
import com.zephyr.client.ProductClient;
import com.zephyr.client.QueryClient;
import com.zephyr.dto.CrmUser;
import com.zephyr.dto.ProductDto;
import com.zephyr.entity.Category;
import com.zephyr.entity.Order;
import com.zephyr.entity.Product;
import com.zephyr.entity.Query;
import com.zephyr.entity.User;
import com.zephyr.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryClient categoryService;
	
	@Autowired
	private ProductClient productService;
	
	@Autowired
	private OrderClient orderService;
	
	@Autowired
	private QueryClient queryClient;
	
	@GetMapping
	public String showAdminHome() {
		return "admin-home";
	}
	
	@GetMapping("/users")
	public String showUsers(Model model) {
		List<User> users = userService.get();
		model.addAttribute("users", users);
		return "admin-users";
	}
	
	@GetMapping("/users/delete/{id}")
	public String deleteUser(@PathVariable("id") long id) {
		userService.delete(id);
		return "redirect:/admin/users";
	}
	
	@GetMapping("/users/edit/{id}")
	public String editUser(@PathVariable("id") long id, Model model) {
		User user = userService.findById(id);
		if(user == null) {
			return "redirect:/admin/users";
		}
		CrmUser crm = new CrmUser();
		crm.setFirstName(user.getFirstName());
		crm.setLastName(user.getLastName());
		crm.setEmail(user.getEmail());
		crm.setGender(user.getGender());
		crm.setUsername(user.getUsername());
		model.addAttribute("user", crm);
		model.addAttribute("id", id);
		return "admin-user-edit";
	}
	
	@PostMapping("/users/edit/{id}")
	public String processEdit(@PathVariable("id") long id, @ModelAttribute("user") CrmUser user) {
		userService.update(user, id);
		return "redirect:/admin/users";
	}
	
	@GetMapping("/categories")
	public String showAdminCategories(Model model) {
		List<Category> categories = categoryService.get();
		model.addAttribute("categories", categories);
		return "admin-categories";
	}
	
	@GetMapping("/categories/add")
	public String addCategory(Model model) {
		model.addAttribute("category", new Category());
		return "admin-category-add";
	}
	
	@PostMapping("/categories/add")
	public String processAddCategory(@ModelAttribute("category") Category c) {
		categoryService.save(c);
		return "redirect:/admin/categories";
	}
	
	@GetMapping("/categories/edit/{id}")
	public String editCategory(@PathVariable("id") long id, Model model) {
		Category category = categoryService.get(id);
		if(category == null) {
			category = new Category();
		}
		category.setCreatedDate(new Date());
		model.addAttribute("category", category);
		return "admin-category-edit";
	}
	
	@PostMapping("/categories/edit/{id}")
	public String editCategory(@ModelAttribute("category") Category c) {
		categoryService.save(c);
		return "redirect:/admin/categories";
	}
	
	@GetMapping("/categories/delete/{id}")
	public String deleteCategory(@PathVariable("id") long id) {
		categoryService.delete(id);
		return "redirect:/admin/categories";
	}
	
	@GetMapping("/products")
	public String showAdminProducts(Model model) {
		List<Product> products = productService.get();
		model.addAttribute("products", products);
		return "admin-products";
	}
	
	@GetMapping("/products/add")
	public String addProduct(Model model) {
		ProductDto dto = new ProductDto();
		List<Category> categories = categoryService.get();
		model.addAttribute("product", dto);
		model.addAttribute("categories", categories);
		return "admin-product-add";
	}
	
	@PostMapping("/products/add")
	public String processAddProduct(@ModelAttribute("product") ProductDto dto) {
//		Product product = new Product();
//		Category c = categoryService.get(dto.getCategoryId());
//		product.setName(dto.getName());
//		product.setCategory(c);
//		product.setDescription(dto.getDescription());
//		product.setPrice(dto.getPrice());
		productService.save(dto);
		return "redirect:/admin/products";
	}
	
	@GetMapping("/products/edit/{id}")
	public String editProduct(@PathVariable("id") long id, Model model) {
		ProductDto dto = new ProductDto();
		List<Category> categories = categoryService.get();
		Product product = productService.getById(id);
		dto.setName(product.getName());
		dto.setPrice(product.getPrice());
		dto.setDescription(product.getDescription());
		dto.setCategoryId(product.getCategory().getCategoryId());
		model.addAttribute("product", dto);
		model.addAttribute("categories", categories);
		return "admin-product-edit";
 	}
	
	@PostMapping("/products/edit/{id}")
	public String editProduct(@ModelAttribute("product") ProductDto dto, @PathVariable("id") long id) {
		dto.setProductId(id);
		productService.save(dto);
		return "redirect:/admin/products";
	}
	
	@GetMapping("/products/delete/{id}")
	public String deleteProduct(@PathVariable("id") long id) {
		productService.delete(id);
		return "redirect:/admin/products";
	}
	
	@GetMapping("/orders")
	public String showAdminOrders(Model model) {
		List<Order> orders = orderService.get();
		model.addAttribute("orders", orders);
		return "admin-orders";
	}
	
	@GetMapping("/orders/delete/{id}")
	public String deleteOrder(@PathVariable("id") long id) {
		orderService.delete(id);
		return "redirect:/admin/orders";
	}
	
	@GetMapping("/queries")
	public String showAdminQueries(Model model) {
		model.addAttribute("queries", queryClient.get());
		return "admin-queries";
	}
	
	@GetMapping("/queries/edit/{id}")
	public String editQuery(Model model, @PathVariable("id") long id) {
		model.addAttribute("query", queryClient.getById(id));
		return "admin-query-edit";
	}
	
	@PostMapping("/queries/edit/{id}")
	public String editQueryProcess(@ModelAttribute("query") Query q) {
		queryClient.save(q);
		return "redirect:/admin/queries";
	}
	
	@GetMapping("/queries/delete/{id}")
	public String deleteQuery(@PathVariable("id") long id) {
		queryClient.deleteById(id);
		return "redirect:/admin/queries";
	}
	
}
