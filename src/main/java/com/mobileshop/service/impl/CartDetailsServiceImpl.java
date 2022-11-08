package com.mobileshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobileshop.entities.CartDetails;
import com.mobileshop.entities.Cart;
import com.mobileshop.entities.Product;
import com.mobileshop.repository.CartDetailsRepository;
import com.mobileshop.service.CartDetailsService;

@Service
public class CartDetailsServiceImpl implements CartDetailsService{
	
	@Autowired
	private CartDetailsRepository repo;
	
	@Override
	public CartDetails getChiMucGioHangBySanPhamAndGioHang(Product sp,Cart g)
	{
		return repo.findBySanPhamAndGioHang(sp,g);
	}
	
	@Override
	public CartDetails saveChiMucGiohang(CartDetails c)
	{
		return repo.save(c);
	}
	
	@Override
	public void deleteChiMucGiohang(CartDetails c)
	{
		repo.delete(c);
	}
	
	@Override
	public List<CartDetails> getChiMucGioHangByGioHang(Cart g)
	{
		return repo.findByGioHang(g);
	}
	
	@Override
	public void deleteAllChiMucGiohang(List<CartDetails> c)
	{
		repo.deleteAll(c);
	}

}
