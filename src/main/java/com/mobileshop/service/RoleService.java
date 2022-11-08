package com.mobileshop.service;

import java.util.List;

import com.mobileshop.entities.Role;

public interface RoleService {

	Role findByTenVaiTro(String tenVaiTro);
	List<Role> findAllVaiTro();
}
