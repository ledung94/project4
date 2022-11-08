package com.mobileshop.repository;

import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mobileshop.entities.User;
import com.mobileshop.entities.Role;

public interface UserRepository extends JpaRepository<User, Long>{

	User findByEmail(String email);

	Page<User> findByVaiTro(Set<Role> vaiTro, Pageable of);

	List<User> findByVaiTro(Set<Role> vaiTro);
}
