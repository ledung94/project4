package com.mobileshop.service;

import com.mobileshop.entities.Cart;
import com.mobileshop.entities.User;

public interface CartService {
	
	Cart getGioHangByNguoiDung(User n);
	
	Cart save(Cart g);
}
