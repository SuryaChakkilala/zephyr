package com.zephyr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zephyr.entity.Category;
import com.zephyr.repository.CategoryRepository;
import com.zephyr.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Override
	public List<Category> get() {
		return categoryRepository.findAll();
	}

	@Override
	public Category get(long id) {
		return categoryRepository.findById(id).get();
	}

	@Override
	public Category save(Category c) {
		return categoryRepository.save(c);
	}

	@Override
	public void delete(long id) {
		categoryRepository.deleteById(id);
	}

}
