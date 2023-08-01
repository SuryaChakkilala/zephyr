package com.zephyr.client;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.zephyr.entity.Order;
import com.zephyr.entity.User;

@FeignClient("ORDER-SERVICE")
public interface OrderClient {

	@GetMapping("/order")
	public List<Order> get();
	
	@GetMapping("/order/user")
	public List<Order> get(User user);
	
	@GetMapping("/order/{id}")
	public Order get(@PathVariable("id") long id);
	
	@PostMapping("/order")
	public Order save(@RequestBody Order order);
	
	@DeleteMapping("/order/{id}")
	public void delete(@PathVariable("id") long id);
	
}
