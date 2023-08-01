package com.zephyr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zephyr.entity.Query;
import com.zephyr.repository.QueryRepository;
import com.zephyr.service.QueryService;

@Service
public class QueryServiceImpl implements QueryService {

	@Autowired
	private QueryRepository repo;
	
	@Override
	public Query save(Query q) {
		return repo.save(q);
	}

	@Override
	public List<Query> get() {
		return repo.findAll();
	}

	@Override
	public Query getById(long id) {
		return repo.findById(id).get();
	}

	@Override
	public void deleteById(long id) {
		repo.deleteById(id);
	}

}
