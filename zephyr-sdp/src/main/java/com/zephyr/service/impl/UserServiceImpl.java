package com.zephyr.service.impl;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zephyr.dto.CrmUser;
import com.zephyr.entity.Role;
import com.zephyr.entity.User;
import com.zephyr.repository.RoleRepository;
import com.zephyr.repository.UserRepository;
import com.zephyr.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private RoleRepository roleRepo;
	
	@Autowired
	@Lazy
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public User findByUsername(String username) {
		return userRepo.findByUsername(username);
	}

	@Override
	public void save(CrmUser crm) {
		User user = new User();
		user.setUsername(crm.getUsername());
		user.setPassword(passwordEncoder.encode(crm.getPassword()));
		user.setFirstName(crm.getFirstName());
		user.setLastName(crm.getLastName());
		user.setEmail(crm.getEmail());
		user.setGender(crm.getGender());
		
		user.setRoles(Arrays.asList(roleRepo.findByName("ROLE_USER")));
		
		userRepo.save(user);
	}
	
	@Override
	@Transactional
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepo.findByUsername(username);
		if (user == null) {
			throw new UsernameNotFoundException("Invalid username or password.");
		}
		return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(),
				mapRolesToAuthorities(user.getRoles()));
	}

	private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Role> roles) {
		return roles.stream().map(role -> new SimpleGrantedAuthority(role.getName())).collect(Collectors.toList());
	}

	@Override
	public List<User> get() {
		return userRepo.findAll();
	}

	@Override
	public void delete(long id) {
		userRepo.deleteById(id);
	}

	@Override
	public User findById(long id) {
		return userRepo.findById(id).get();
	}

	@Override
	public User update(CrmUser crm, long id) {
		User user = findById(id);
		user.setFirstName(crm.getFirstName());
		user.setLastName(crm.getLastName());
		user.setEmail(crm.getEmail());
		user.setGender(crm.getGender());
		user.setUsername(crm.getUsername());
		user.setPassword(passwordEncoder.encode(crm.getPassword()));
		userRepo.save(user);
		return user;
	}

	@Override
	public User update(CrmUser crm, String username) {
		User user = findByUsername(username);
		user.setFirstName(crm.getFirstName());
		user.setLastName(crm.getLastName());
		user.setEmail(crm.getEmail());
		user.setGender(crm.getGender());
		user.setUsername(crm.getUsername());
		user.setPassword(passwordEncoder.encode(crm.getPassword()));
		userRepo.save(user);
		return user;
	}

}
