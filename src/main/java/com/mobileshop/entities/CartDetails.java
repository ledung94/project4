package com.mobileshop.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class CartDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@ManyToOne
	@JoinColumn(name = "ma_san_pham")
	private Product sanPham;
	
	private int so_luong;
	
	@ManyToOne
	@JoinColumn(name = "ma_gio_hang")
	private Cart gioHang;

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

	public int getSo_luong() {
		return so_luong;
	}

	public void setSo_luong(int so_luong) {
		this.so_luong = so_luong;
	}

	public Cart getGioHang() {
		return gioHang;
	}

	public void setGioHang(Cart gioHang) {
		this.gioHang = gioHang;
	}

	
	

}
