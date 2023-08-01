package com.zephyr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zephyr.entity.Category;
import com.zephyr.entity.Product;
import com.zephyr.repository.ProductRepository;
import com.zephyr.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public List<Product> get() {
		return productRepository.findAll();
	}

	@Override
	public List<Product> getByCategory(Category c) {
		return productRepository.findByCategory(c);
	}

	@Override
	public Product getById(long id) {
		return productRepository.findById(id).get();
	}

	@Override
	public Product save(Product p) {
		return productRepository.save(p);
	}

	@Override
	public void delete(long id) {
		productRepository.deleteById(id);
	}

	@Override
	public List<Product> findByNameContainingIgnoreCase(String name) {
		return productRepository.findByNameContainingIgnoreCase(name);
	}
	
}
