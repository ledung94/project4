package com.mobileshop.entities;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Role {

	@Id
	@GeneratedValue
	private long id;
	
	private String tenVaiTro;

	@JsonIgnore
	@ManyToMany(mappedBy = "vaiTro")
	private Set<User> nguoiDung;

	public String getTenVaiTro() {
		return tenVaiTro;
	}

	public void setTenVaiTro(String tenVaiTro) {
		this.tenVaiTro = tenVaiTro;
	}

	public Set<User> getNguoiDung() {
		return nguoiDung;
	}

	public void setNguoiDung(Set<User> nguoiDung) {
		this.nguoiDung = nguoiDung;
	}
	
	public Role(String tenVaiTro) {
		this.tenVaiTro = tenVaiTro;
	}
	
	public Role() {
		// TODO Auto-generated constructor stub
	}
}
