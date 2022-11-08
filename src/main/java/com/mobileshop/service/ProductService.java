package com.mobileshop.service;

import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;

import com.mobileshop.dto.ProductDTO;
import com.mobileshop.dto.SearchProductObject;
import com.mobileshop.entities.Product;

public interface ProductService {

	Product save(ProductDTO sp);

	Product update(ProductDTO sp);

	void deleteById(long id);

	Page<Product> getAllSanPhamByFilter(SearchProductObject object, int page, int limit);

	Product getSanPhamById(long id);
	
	List<Product> getLatestSanPham();
	
	Iterable<Product> getSanPhamByTenSanPhamWithoutPaginate(SearchProductObject object);
	
	Page<Product> getSanPhamByTenSanPham(SearchProductObject object,int page, int resultPerPage);
	
	List<Product> getAllSanPhamByList(Set<Long> idList);
	
	Page<Product> getSanPhamByTenSanPhamForAdmin(String tenSanPham, int page, int size);
	
	Iterable<Product> getSanPhamByTenDanhMuc(String brand);
	
	public Page<Product> getSanPhamByBrand(SearchProductObject object, int page, int resultPerPage);
}
