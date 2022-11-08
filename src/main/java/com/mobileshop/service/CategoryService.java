package com.mobileshop.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.mobileshop.entities.Category;

public interface CategoryService {

	Page<Category> getAllDanhMucForPageable(int page, int size);

	List<Category> getAllDanhMuc();

	Category getDanhMucById(long id);

	Category save(Category d);

	Category update(Category d);

	void deleteById(long id);
}
