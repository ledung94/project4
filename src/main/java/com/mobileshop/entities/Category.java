package com.mobileshop.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Category {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@NotEmpty(message="Tên danh mục không được trống")
	private String tenDanhMuc;

	@JsonIgnore
	@OneToMany(mappedBy = "danhMuc")
	private List<Product> listSanPham;
	
//	public DanhMuc(long id, String tenDanhMuc) {
//		this.id = id;
//		this.tenDanhMuc = tenDanhMuc;
//	}
	

	public String getTenDanhMuc() {
		return tenDanhMuc;
	}

	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}

	public List<Product> getListSanPham() {
		return listSanPham;
	}

	public void setListSanPham(List<Product> listSanPham) {
		this.listSanPham = listSanPham;
	}
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
}
