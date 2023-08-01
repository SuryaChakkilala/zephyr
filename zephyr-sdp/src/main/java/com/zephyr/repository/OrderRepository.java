package com.zephyr.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.zephyr.entity.Order;
import com.zephyr.entity.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
	public List<Order> findByUser(User user);
}
