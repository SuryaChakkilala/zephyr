package com.zephyr.client;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zephyr.dto.ProductDto;
import com.zephyr.entity.Product;

@FeignClient("PRODUCT-SERVICE")
public interface ProductClient {

	@GetMapping("/product")
	public List<Product> get();
	
	@GetMapping("/product/category/{categoryId}")
	public List<Product> getByCategory(@PathVariable("categoryId") long id);
	
	@GetMapping("/product/search")
	public List<Product> getByCategorySearch(@RequestParam("search") String queryString);
	
	@GetMapping("/product/{id}")
	public Product getById(@PathVariable("id") long id);
	
	@PostMapping("/product")
	public Product save(ProductDto dto);
	
	@DeleteMapping("/product/{id}")
	public void delete(@PathVariable("id") long id);
	
}
