package com.mobileshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import com.mobileshop.entities.Orders;
import com.mobileshop.entities.User;

public interface OrderRepository extends JpaRepository<Orders, Long>, QuerydslPredicateExecutor<Orders> {

	public List<Orders> findByTrangThaiDonHangAndShipper(String trangThai, User shipper);

	@Query(value = "select DATE_FORMAT(dh.ngayNhanHang, '%m') as month, "
			+ " DATE_FORMAT(dh.ngayNhanHang, '%Y') as year, sum(ct.soLuongNhanHang * ct.donGia) as total, sum(ct.soLuongNhanHang * ct.giaVon) as cost"
			+ " from Orders dh, OrderDetails ct"
			+ " where dh.id = ct.donHang.id and dh.trangThaiDonHang ='Hoàn thành'"
			+ " group by DATE_FORMAT(dh.ngayNhanHang, '%Y%m')"
			+ " order by year asc" )
	public List<Object> layDonHangTheoThangVaNam();
	
	public List<Orders> findByNguoiDat(User ng);
	
	public int countByTrangThaiDonHang(String trangThaiDonHang);
	
}
