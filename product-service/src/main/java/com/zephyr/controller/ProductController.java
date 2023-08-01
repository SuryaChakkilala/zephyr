package com.zephyr.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.zephyr.client.CategoryClient;
import com.zephyr.dto.ProductDto;
import com.zephyr.entity.Category;
import com.zephyr.entity.Product;
import com.zephyr.repository.ProductRepository;

@RestController
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductRepository repo;
	
	@Autowired
	private CategoryClient categoryClient;
	
	@GetMapping
	public List<Product> get() {
		return repo.findAll();
	}
	
	@GetMapping("/search")
	public List<Product> get(@RequestParam("search") String queryString) {
		List<Product> products = repo.findByNameContainingIgnoreCase(queryString);
		if(products.isEmpty()) {
			return new ArrayList<Product>();
		}
		return products;
	}
	
	@GetMapping("/{id}")
	public Product getById(@PathVariable("id") long id) {
		return repo.findById(id).get();
	}
	
	@PostMapping
	public Product save(@RequestBody ProductDto dto) {
		Product p = new Product();
		p.setProductId(dto.getProductId());
		p.setName(dto.getName());
		p.setDescription(dto.getDescription());
		p.setPrice(dto.getPrice());
		Category c = categoryClient.get(dto.getCategoryId());
		p.setCategory(c);
		return repo.save(p);
	}
	
	@GetMapping("/category/{categoryId}")
	public List<Product> getByCategory(@PathVariable("categoryId") long categoryId) {
		Category c = categoryClient.get(categoryId);
		return repo.findByCategory(c);
	}
	
	@DeleteMapping("/{id}")
	public void delete(@PathVariable("id") long id) {
		repo.deleteById(id);
	}
	
}
