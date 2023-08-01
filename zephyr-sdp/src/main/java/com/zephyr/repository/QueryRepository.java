package com.zephyr.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.zephyr.entity.Query;

@Repository
public interface QueryRepository extends JpaRepository<Query, Long> {

}
