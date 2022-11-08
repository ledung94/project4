package com.mobileshop.api.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mobileshop.dto.SearchDonHangObject;
import com.mobileshop.entities.OrderDetails;
import com.mobileshop.entities.Order;
import com.mobileshop.entities.Product;
import com.mobileshop.service.OrderService;
import com.mobileshop.service.UserService;

@RestController
@RequestMapping("/api/don-hang")
public class OrderApi {

	@Autowired
	private OrderService donHangService;

	@Autowired
	private UserService nguoiDungService;

	// lấy danh sách đơn hàng theo search object
	@GetMapping("/all")
	public Page<Order> getDonHangByFilter(@RequestParam(defaultValue = "1") int page, @RequestParam String trangThai,
			@RequestParam String tuNgay, @RequestParam String denNgay) throws ParseException {

		SearchDonHangObject object = new SearchDonHangObject();
		object.setDenNgay(denNgay);
		object.setTrangThaiDon(trangThai);
		object.setTuNgay(tuNgay);
		Page<Order> listDonHang = donHangService.getAllDonHangByFilter(object, page);
		return listDonHang;
	}

	@GetMapping("/{id}")
	public Order getDonHangById(@PathVariable long id) {
		return donHangService.findById(id);
	}

	// phân công đơn hàng
	@PostMapping("/assign")
	public void phanCongDonHang(@RequestParam("shipper") String emailShipper,
			@RequestParam("donHangId") long donHangId) {
		Order dh = donHangService.findById(donHangId);
		dh.setTrangThaiDonHang("Đang giao");
		dh.setShipper(nguoiDungService.findByEmail(emailShipper));

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {

			String dateStr = format.format(new Date());
			Date date = format.parse(dateStr);
			dh.setNgayGiaoHang(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		donHangService.save(dh);
	}

	// xác nhận hoàn thành đơn hàng
	@PostMapping("/update")
	public void xacNhanHoanThanhDon(@RequestParam("donHangId") long donHangId,
			@RequestParam("ghiChu") String ghiChuAdmin) {
		Order dh = donHangService.findById(donHangId);
		
		for(OrderDetails ct : dh.getDanhSachChiTiet()) {
			Product sp = ct.getSanPham();
			sp.setDonViBan(sp.getDonViBan() + ct.getSoLuongNhanHang());
			sp.setDonViKho(sp.getDonViKho() - ct.getSoLuongNhanHang() );
		}
		dh.setTrangThaiDonHang("Hoàn thành");
		String ghiChu = dh.getGhiChu();
		if (!ghiChuAdmin.equals("")) {
			ghiChu += "<br> Ghi chú admin:\n" + ghiChuAdmin;
		}
		dh.setGhiChu(ghiChu);
		donHangService.save(dh);
	}

	// xác nhận hoàn thành đơn hàng
	@PostMapping("/cancel")
	public void huyDonHangAdmin(@RequestParam("donHangId") long donHangId) {
		Order dh = donHangService.findById(donHangId);
		dh.setTrangThaiDonHang("Đã bị hủy");
		donHangService.save(dh);
	}

	// lấy dữ liệu làm báo cáo thống kê
	@GetMapping("/report")
	public List<Object> test() {
		return donHangService.layDonHangTheoThangVaNam();
	}
}
