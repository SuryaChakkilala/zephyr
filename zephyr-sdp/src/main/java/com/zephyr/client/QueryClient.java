package com.zephyr.client;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.zephyr.entity.Query;

@FeignClient("QUERY-SERVICE")
public interface QueryClient {

	@GetMapping("/query")
	public List<Query> get();
	
	@GetMapping("/query/{id}")
	public Query getById(@PathVariable("id") long id);
	
	@PostMapping("/query")
	public Query save(@RequestBody Query q);
	
	@DeleteMapping("/query/{id}")
	public void deleteById(@PathVariable("id") long id);
	
}
