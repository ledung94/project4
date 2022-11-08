package com.mobileshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobileshop.entities.Role;
import com.mobileshop.repository.RoleRepository;
import com.mobileshop.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
	

	@Autowired
	private RoleRepository repo;

	@Override
	public Role findByTenVaiTro(String tenVaiTro) {
		return repo.findByTenVaiTro(tenVaiTro);
	}

	@Override
	public List<Role> findAllVaiTro() {
		return repo.findAll();
	}


}
