package com.mobileshop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobileshop.entities.Cart;
import com.mobileshop.entities.User;
import com.mobileshop.repository.CartRepository;
import com.mobileshop.service.CartService;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartRepository repo;
	
	@Override
	public Cart getGioHangByNguoiDung(User n)
	{
		return repo.findByNguoiDung(n);
	}
	
	@Override
	public Cart save(Cart g)
	{
		return repo.save(g);
	}

}
