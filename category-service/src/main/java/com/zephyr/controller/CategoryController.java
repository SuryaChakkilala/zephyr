package com.zephyr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zephyr.entity.Category;
import com.zephyr.repositoy.CategoryRepository;

@RestController
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	private CategoryRepository repo;
	
	@GetMapping
	public List<Category> getAll() {
		return repo.findAll();
	}
	
	@GetMapping("/{id}")
	public Category get(@PathVariable("id") long id) {
		return repo.findById(id).get();
	}
	
	@PostMapping
	public Category save(@RequestBody Category c) {
		return repo.save(c);
	}
	
	@DeleteMapping("/{id}")
	public void delete(@PathVariable("id") long id) {
		repo.deleteById(id);
	}
}
