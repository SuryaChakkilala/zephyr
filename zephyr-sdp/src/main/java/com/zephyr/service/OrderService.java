package com.zephyr.service;

import java.util.List;

import com.zephyr.entity.Order;
import com.zephyr.entity.User;

public interface OrderService {
	public List<Order> get();
	public List<Order> get(User user);
	public Order get(long id);
	public Order save(Order order);
	public void delete(long id);
}
