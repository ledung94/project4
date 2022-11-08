package com.mobileshop.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.mobileshop.entities.Manufacturer;

public interface ManufacturerService {

	List<Manufacturer> getALlHangSX();
	
	Page<Manufacturer> getALlHangSX(int page, int size);

	Manufacturer getHSXById(long id);

	Manufacturer save(Manufacturer h);

	Manufacturer update(Manufacturer h);

	void deleteById(long id);
}
