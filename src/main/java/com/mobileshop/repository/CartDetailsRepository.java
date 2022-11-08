package com.mobileshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mobileshop.entities.CartDetails;
import com.mobileshop.entities.Cart;
import com.mobileshop.entities.Product;

public interface CartDetailsRepository extends JpaRepository<CartDetails, Long>{
	
	CartDetails findBySanPhamAndGioHang(Product sp,Cart g);
	
	List<CartDetails> findByGioHang(Cart g);
}
