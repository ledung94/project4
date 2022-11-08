package com.mobileshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mobileshop.entities.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {

	Role findByTenVaiTro(String tenVaiTro);
}
