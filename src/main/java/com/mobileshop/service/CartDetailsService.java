package com.mobileshop.service;

import java.util.List;

import com.mobileshop.entities.CartDetails;
import com.mobileshop.entities.Cart;
import com.mobileshop.entities.Product;

public interface CartDetailsService{
	
	List<CartDetails> getChiMucGioHangByGioHang(Cart g);
	
	CartDetails getChiMucGioHangBySanPhamAndGioHang(Product sp,Cart g);
	
	CartDetails saveChiMucGiohang(CartDetails c);
	
	void deleteChiMucGiohang(CartDetails c);
	
	void deleteAllChiMucGiohang(List<CartDetails> c);
	
}
