package com.zephyr.client;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.zephyr.entity.Category;

@FeignClient("CATEGORY-SERVICE")
public interface CategoryClient {

	@GetMapping("/category")
	public List<Category> get();
	
	@GetMapping("/category/{id}")
	public Category get(@PathVariable("id") long id);
	
	@PostMapping("/category")
	public Category save(@RequestBody Category c);
	
	@DeleteMapping("/category/{id}")
	public void delete(@PathVariable("id") long id);
	
}
