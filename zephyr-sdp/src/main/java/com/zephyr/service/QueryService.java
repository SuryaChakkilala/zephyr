package com.zephyr.service;

import java.util.List;

import com.zephyr.entity.Query;

public interface QueryService {
	public Query save(Query q);
	public List<Query> get();
	public Query getById(long id);
	public void deleteById(long id);
}
