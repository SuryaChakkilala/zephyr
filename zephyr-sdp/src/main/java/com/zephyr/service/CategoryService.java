package com.zephyr.service;

import java.util.List;

import com.zephyr.entity.Category;

public interface CategoryService {
	public List<Category> get();
	public Category get(long id);
	public Category save(Category c);
	public void delete(long id);
}
