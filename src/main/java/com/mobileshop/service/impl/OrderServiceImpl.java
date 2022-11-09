package com.mobileshop.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.mobileshop.dto.SearchDonHangObject;
import com.mobileshop.entities.Orders;
import com.mobileshop.entities.QOrders;
import com.mobileshop.entities.User;
import com.mobileshop.repository.OrderRepository;
import com.mobileshop.service.OrderService;
import com.querydsl.core.BooleanBuilder;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderRepository donHangRepo;

	@Override
	public Page<Orders> getAllDonHangByFilter(SearchDonHangObject object, int page) throws ParseException {
		BooleanBuilder builder = new BooleanBuilder();

		String trangThaiDon = object.getTrangThaiDon();
		String tuNgay = object.getTuNgay();
		String denNgay = object.getDenNgay();
		SimpleDateFormat formatDate = new SimpleDateFormat("dd-MM-yyyy");

		if (!trangThaiDon.equals("")) {
			builder.and(QOrders.orders.trangThaiDonHang.eq(trangThaiDon));
		}

		if (!tuNgay.equals("") && tuNgay != null) {
			if (trangThaiDon.equals("") || trangThaiDon.equals("Đang chờ giao") || trangThaiDon.equals("Đã hủy")) {
				builder.and(QOrders.orders.ngayDatHang.goe(formatDate.parse(tuNgay)));
			} else if (trangThaiDon.equals("Đang giao")) {
				builder.and(QOrders.orders.ngayGiaoHang.goe(formatDate.parse(tuNgay)));
			} else { // hoàn thành
				builder.and(QOrders.orders.ngayNhanHang.goe(formatDate.parse(tuNgay)));
			}
		}

		if (!denNgay.equals("") && denNgay != null) {
			if (trangThaiDon.equals("") || trangThaiDon.equals("Đang chờ giao") || trangThaiDon.equals("Đã hủy")) {
				builder.and(QOrders.orders.ngayDatHang.loe(formatDate.parse(denNgay)));
			} else if (trangThaiDon.equals("Đang giao")) {
				builder.and(QOrders.orders.ngayGiaoHang.loe(formatDate.parse(denNgay)));
			} else { // hoàn thành
				builder.and(QOrders.orders.ngayNhanHang.loe(formatDate.parse(denNgay)));
			}
		}

		return donHangRepo.findAll(builder, PageRequest.of(page - 1, 6));
	}

	@Override
	public Orders update(Orders dh) {
		return donHangRepo.save(dh);
	}

	@Override
	public Orders findById(long id) {
		return donHangRepo.findById(id).get();
	}

	@Override
	public List<Orders> findByTrangThaiDonHangAndShipper(String trangThai, User shipper) {
		return donHangRepo.findByTrangThaiDonHangAndShipper(trangThai, shipper);
	}

	@Override
	public Orders save(Orders dh) {
		return donHangRepo.save(dh);
	}

	@Override
	public List<Object> layDonHangTheoThangVaNam() {
		return donHangRepo.layDonHangTheoThangVaNam();
	}
	
	@Override
	public List<Orders> getDonHangByNguoiDung(User ng) {
		return donHangRepo.findByNguoiDat(ng);
	}

	@Override
	public Page<Orders> findDonHangByShipper(SearchDonHangObject object, int page, int size, User shipper) throws ParseException {
		BooleanBuilder builder = new BooleanBuilder();

		String trangThaiDon = object.getTrangThaiDon();
		String tuNgay = object.getTuNgay();
		String denNgay = object.getDenNgay();
		SimpleDateFormat formatDate = new SimpleDateFormat("dd-MM-yyyy");
		
		builder.and(QOrders.orders.shipper.eq(shipper));

		if (!trangThaiDon.equals("")) {
			builder.and(QOrders.orders.trangThaiDonHang.eq(trangThaiDon));
		}

		if (!tuNgay.equals("") && tuNgay != null) {
			if (trangThaiDon.equals("Đang giao")) {
				builder.and(QOrders.orders.ngayGiaoHang.goe(formatDate.parse(tuNgay)));
			} else { // hoàn thành
				builder.and(QOrders.orders.ngayNhanHang.goe(formatDate.parse(tuNgay)));
			}
		}

		if (!denNgay.equals("") && denNgay != null) {
			if (trangThaiDon.equals("Đang giao")) {
				builder.and(QOrders.orders.ngayGiaoHang.loe(formatDate.parse(denNgay)));
			} else { // hoàn thành
				builder.and(QOrders.orders.ngayNhanHang.loe(formatDate.parse(denNgay)));
			}
		}

		return donHangRepo.findAll(builder, PageRequest.of(page - 1, size));
	}

	@Override
	public int countByTrangThaiDonHang(String trangThaiDonHang) {
		return donHangRepo.countByTrangThaiDonHang(trangThaiDonHang);
	}

}
