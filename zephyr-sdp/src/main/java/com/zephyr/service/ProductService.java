package com.zephyr.service;

import java.util.List;

import com.zephyr.entity.Category;
import com.zephyr.entity.Product;

public interface ProductService {
	public List<Product> get();
	public List<Product> getByCategory(Category c);
	public List<Product> findByNameContainingIgnoreCase(String name);
	public Product getById(long id);
	public Product save(Product p);
	public void delete(long id);
}
