package com.mobileshop.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Cart {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	private String tong_tien;
	
	@OneToOne
	@JoinColumn(name = "ma_nguoi_dung")
	private User nguoiDung;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTong_tien() {
		return tong_tien;
	}

	public void setTong_tien(String tong_tien) {
		this.tong_tien = tong_tien;
	}

	public User getNguoiDung() {
		return nguoiDung;
	}

	public void setNguoiDung(User nguoiDung) {
		this.nguoiDung = nguoiDung;
	}
	
}
