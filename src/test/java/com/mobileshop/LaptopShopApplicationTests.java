package com.mobileshop;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.mobileshop.entities.Category;
import com.mobileshop.entities.Orders;
import com.mobileshop.entities.User;
import com.mobileshop.entities.Role;
import com.mobileshop.repository.OrderRepository;
import com.mobileshop.repository.UserRepository;
import com.mobileshop.service.CategoryService;
import com.mobileshop.service.UserService;
import com.mobileshop.service.ProductService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class LaptopShopApplicationTests {

	@Autowired
	private CategoryService dmService;

	@Autowired
	private UserService nguoiDungService;

	@Autowired
	private UserRepository ndRepo;

	@Autowired
	private OrderRepository dhRepo;
	
	@Autowired
	private ProductService spService;


//	@Test
//	public void getALlDanhMucTest() {
//		System.out.println(dhRepo.test().size());
//	}

	@Test
	public void getALlDanhMucTest() {
		System.out.println(spService.getSanPhamByTenSanPhamForAdmin("asus",0,10).getContent().size());
	}

}
