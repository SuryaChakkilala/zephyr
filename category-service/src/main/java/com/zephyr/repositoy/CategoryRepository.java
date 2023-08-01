package com.zephyr.repositoy;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zephyr.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {

}
