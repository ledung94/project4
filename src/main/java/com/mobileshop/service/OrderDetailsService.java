package com.mobileshop.service;

import java.util.List;

import com.mobileshop.entities.OrderDetails;

public interface OrderDetailsService {
	List<OrderDetails> save(List<OrderDetails> list);
}
