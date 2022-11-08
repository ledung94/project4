package com.mobileshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.mobileshop.entities.Category;
import com.mobileshop.repository.CategoryRepository;
import com.mobileshop.service.CategoryService;


@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepository repo;

	@Override
	public Category save(Category d) {
		return repo.save(d);
	}

	@Override
	public Category update(Category d) {
		return repo.save(d);
	}

	@Override
	public void deleteById(long id) {
		repo.deleteById(id);
	}

	@Override
	public Page<Category> getAllDanhMucForPageable(int page, int size) {
		return repo.findAll(PageRequest.of(page, size));
	}

	@Override
	public Category getDanhMucById(long id) {
		return repo.findById(id).get();
	}

	@Override
	public List<Category> getAllDanhMuc() {
		return repo.findAll();
	}

}
