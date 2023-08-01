package com.zephyr.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.zephyr.dto.CrmUser;
import com.zephyr.entity.User;

public interface UserService extends UserDetailsService {
	public User findByUsername(String username);
	public void save(CrmUser user);
	public List<User> get();
	public void delete(long id);
	public User findById(long id);
	public User update(CrmUser crm, long id);
	public User update(CrmUser crm, String username);
}
