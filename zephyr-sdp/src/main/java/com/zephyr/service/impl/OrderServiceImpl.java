package com.zephyr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zephyr.entity.Order;
import com.zephyr.entity.User;
import com.zephyr.repository.OrderRepository;
import com.zephyr.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Override
	public List<Order> get() {
		return orderRepository.findAll();
	}

	@Override
	public List<Order> get(User user) {
		return orderRepository.findByUser(user);
	}

	@Override
	public Order get(long id) {
		return orderRepository.findById(id).get();
	}

	@Override
	public Order save(Order order) {
		return orderRepository.save(order);
	}

	@Override
	public void delete(long id) {
		orderRepository.deleteById(id);
		
	}

}
