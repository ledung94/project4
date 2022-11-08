package com.mobileshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobileshop.entities.OrderDetails;
import com.mobileshop.repository.OrderDetailsRepository;
import com.mobileshop.service.OrderDetailsService;

@Service
public class OrderDetailsServiceImpl implements OrderDetailsService{
	
	@Autowired
	private OrderDetailsRepository repo;
	
	@Override
	public List<OrderDetails> save(List<OrderDetails> list)
	{	
		return repo.saveAll(list);
	}
}
