package com.mobileshop.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class OrderDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@OneToOne
	@JoinColumn(name="ma_san_pham")
	private Product sanPham;
	private long donGia;
	private long giaVon;
	private int soLuongDat;
	
	private int soLuongNhanHang;

	@ManyToOne
	@JoinColumn(name = "ma_don_hang")
	@JsonIgnore
	private Orders donHang;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Product getSanPham() {
		return sanPham;
	}

	public void setSanPham(Product sanPham) {
		this.sanPham = sanPham;
	}

	public long getDonGia() {
		return donGia;
	}
	
	public long getGiaVon() {
		return giaVon;
	}

	public void setDonGia(long donGia) {
		this.donGia = donGia;
	}
	
	public void setGiaVon(long giaVon) {
		this.giaVon = giaVon;
	}

	public int getSoLuongDat() {
		return soLuongDat;
	}

	public void setSoLuongDat(int soLuongDat) {
		this.soLuongDat = soLuongDat;
	}

	public Orders getDonHang() {
		return donHang;
	}

	public void setDonHang(Orders donHang) {
		this.donHang = donHang;
	}
	
	
	public int getSoLuongNhanHang() {
		return soLuongNhanHang;
	}

	public void setSoLuongNhanHang(int soLuongNhanHang) {
		this.soLuongNhanHang = soLuongNhanHang;
	}

}
