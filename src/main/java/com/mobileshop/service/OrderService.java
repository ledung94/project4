package com.mobileshop.service;

import java.text.ParseException;
import java.util.List;

import org.springframework.data.domain.Page;

import com.mobileshop.dto.SearchDonHangObject;
import com.mobileshop.entities.Order;
import com.mobileshop.entities.User;

public interface OrderService {

	Page<Order> getAllDonHangByFilter(SearchDonHangObject object, int page) throws ParseException;

	Order update(Order dh);
	
	Order findById(long id);
	
	Page<Order> findDonHangByShipper(SearchDonHangObject object, int page, int size, User shipper) throws ParseException;

	Order save(Order dh);
	
	List<Object> layDonHangTheoThangVaNam();

	List<Order> findByTrangThaiDonHangAndShipper(String string, User shipper);

	
	List<Order> getDonHangByNguoiDung(User currentUser);
	
	int countByTrangThaiDonHang(String trangThaiDonHang);
}
