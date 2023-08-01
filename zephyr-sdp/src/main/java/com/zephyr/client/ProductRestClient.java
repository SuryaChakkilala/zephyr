package com.zephyr.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.zephyr.entity.Category;
import com.zephyr.entity.Product;

@Service
public class ProductRestClient {
	
	@Autowired
	private RestTemplate rest;
	
	private String baseUrl = "http://localhost:9020/product";
	
	public List<Product> get() {
		List<Product> products = rest.getForObject(baseUrl, List.class);
		return products;
	}
	
	public Product getById(long id) {
		Product product = rest.getForObject(baseUrl + "/" + id, Product.class);
		return product;
	}
	
	public Product save(Product product) {
		return rest.postForObject(baseUrl, product, Product.class);
	}
	
	public List<Product> getByCategory(Category c) {
		return rest.getForObject(baseUrl + "/category/" + c.getCategoryId(), List.class);
	}
	
	public void delete(long id) {
		rest.delete(baseUrl + "/" + id);
	}
	
}
