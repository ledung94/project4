package com.mobileshop.api.shipper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mobileshop.dto.OrderUpdateShipper;
import com.mobileshop.dto.SearchDonHangObject;
import com.mobileshop.entities.OrderDetails;
import com.mobileshop.entities.Order;
import com.mobileshop.entities.User;
import com.mobileshop.service.OrderService;
import com.mobileshop.service.UserService;

@RestController
@RequestMapping("/api/shipper/don-hang")
public class OrderDeliveryApi {

	@Autowired
	private OrderService donHangService;

	@Autowired
	private UserService nguoiDungService;

	@GetMapping("/all")
	public Page<Order> getDonHangByFilter(@RequestParam(defaultValue = "1") int page, @RequestParam String trangThai,
			@RequestParam String tuNgay, @RequestParam String denNgay, @RequestParam long idShipper)
			throws ParseException {

		SearchDonHangObject object = new SearchDonHangObject();
		object.setDenNgay(denNgay);
		object.setTrangThaiDon(trangThai);
		object.setTuNgay(tuNgay);

		User shipper = nguoiDungService.findById(idShipper);
		Page<Order> listDonHang = donHangService.findDonHangByShipper(object, page, 6, shipper);
		return listDonHang;
	}

	@GetMapping("/{id}")
	public Order getDonHangById(@PathVariable long id) {
		return donHangService.findById(id);
	}

	@PostMapping("/update")
	public void capNhatTrangThaiDonHang(@RequestBody OrderUpdateShipper capNhatDonHangShipper) {
		Order donHang = donHangService.findById(capNhatDonHangShipper.getIdDonHang());

		for (OrderDetails chiTiet : donHang.getDanhSachChiTiet()) {
			for (OrderUpdateShipper.CapNhatChiTietDon chiTietCapNhat : capNhatDonHangShipper
					.getDanhSachCapNhatChiTietDon()) {
				if (chiTiet.getId() == chiTietCapNhat.getIdChiTiet()) {
					chiTiet.setSoLuongNhanHang(chiTietCapNhat.getSoLuongNhanHang());
				}
			}
		}

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {

			String dateStr = format.format(new Date());
			Date date = format.parse(dateStr);
			donHang.setNgayNhanHang(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		donHang.setTrangThaiDonHang("Chờ duyệt");

		String ghiChu = capNhatDonHangShipper.getGhiChuShipper();

		if (!ghiChu.equals("")) {
			donHang.setGhiChu("Ghi chú shipper: \n" + capNhatDonHangShipper.getGhiChuShipper());
		}
		donHangService.save(donHang);

	}
}
