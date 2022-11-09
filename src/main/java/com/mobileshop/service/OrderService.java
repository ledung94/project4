package com.mobileshop.service;

import java.text.ParseException;
import java.util.List;

import org.springframework.data.domain.Page;

import com.mobileshop.dto.SearchDonHangObject;
import com.mobileshop.entities.Orders;
import com.mobileshop.entities.User;

public interface OrderService {

	Page<Orders> getAllDonHangByFilter(SearchDonHangObject object, int page) throws ParseException;

	Orders update(Orders dh);
	
	Orders findById(long id);
	
	Page<Orders> findDonHangByShipper(SearchDonHangObject object, int page, int size, User shipper) throws ParseException;

	Orders save(Orders dh);
	
	List<Object> layDonHangTheoThangVaNam();

	List<Orders> findByTrangThaiDonHangAndShipper(String string, User shipper);

	
	List<Orders> getDonHangByNguoiDung(User currentUser);
	
	int countByTrangThaiDonHang(String trangThaiDonHang);
}
