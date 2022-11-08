package com.mobileshop.service.impl;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.mobileshop.entities.Role;
import com.mobileshop.repository.UserRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserRepository repo;

	@Override
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		com.mobileshop.entities.User user = repo.findByEmail(username);
		if (user == null) {
			throw new UsernameNotFoundException("User with email " + username + " was not be found");
		}
		
		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		Set<Role> roles = user.getVaiTro();
		for (Role role : roles) {
			grantedAuthorities.add(new SimpleGrantedAuthority(role.getTenVaiTro()));
		}
		return new User(username, user.getPassword(), grantedAuthorities);
	}

}
