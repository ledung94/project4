package com.mobileshop.service;

import java.text.ParseException;

import org.springframework.data.domain.Page;

import com.mobileshop.dto.SearchContactObject;
import com.mobileshop.entities.Contact;

public interface ContactService {

	Page<Contact> getLienHeByFilter(SearchContactObject object, int page) throws ParseException;

	Contact findById(long id);
	
	Contact save(Contact lh);
	
	int countByTrangThai(String trangThai);

}
