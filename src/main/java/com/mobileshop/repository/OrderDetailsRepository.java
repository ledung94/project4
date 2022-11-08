package com.mobileshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mobileshop.entities.OrderDetails;

public interface OrderDetailsRepository extends JpaRepository<OrderDetails, Long>{
}
