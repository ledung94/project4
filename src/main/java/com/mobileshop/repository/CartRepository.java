package com.mobileshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mobileshop.entities.Cart;
import com.mobileshop.entities.User;

public interface CartRepository extends JpaRepository<Cart, Long>{
	
	Cart findByNguoiDung(User n);
	
}
