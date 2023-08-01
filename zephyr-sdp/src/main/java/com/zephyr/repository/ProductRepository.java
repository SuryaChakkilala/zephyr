package com.zephyr.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zephyr.entity.Category;
import com.zephyr.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
	public List<Product> findByCategory(Category c);
	public List<Product> findByNameContainingIgnoreCase(String name);
}
