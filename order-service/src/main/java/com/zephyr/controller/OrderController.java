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

import com.zephyr.entity.Order;
import com.zephyr.entity.User;
import com.zephyr.repository.OrderRepository;

@RestController
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderRepository repo;
	
	@GetMapping
	public List<Order> get() {
		return repo.findAll();
	}
	
	@GetMapping("/{id}")
	public Order get(@PathVariable("id") long id) {
		return repo.findById(id).get();
	}
	
	@GetMapping("/user")
	public List<Order> getOrdersByUser(@RequestBody User u) {
		return repo.findByUser(u);
	}
	
	@PostMapping
	public Order order(@RequestBody Order o) {
		return repo.save(o);
	}
	
	@DeleteMapping("/{id}")
	public void delete(@PathVariable("id") long id) {
		repo.deleteById(id);
	}
	
}
