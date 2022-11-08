package com.mobileshop.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.mobileshop.dto.SearchContactObject;
import com.mobileshop.entities.Contact;
import com.mobileshop.entities.QContact;
import com.mobileshop.repository.ContactRepository;
import com.mobileshop.service.ContactService;
import com.querydsl.core.BooleanBuilder;

@Service
public class ContactServiceImpl implements ContactService {

	@Autowired
	private ContactRepository lienHeRepo;

	@Override
	public Page<Contact> getLienHeByFilter(SearchContactObject object, int page) throws ParseException {
		BooleanBuilder builder = new BooleanBuilder();

		String trangThai = object.getTrangThaiLienHe();
		String tuNgay = object.getTuNgay();
		String denNgay = object.getDenNgay();
		SimpleDateFormat formatDate = new SimpleDateFormat("dd-MM-yyyy");

		if (!trangThai.equals("")) {
			builder.and(QContact.contact.trangThai.eq(trangThai));
		}

		if (!tuNgay.equals("") && tuNgay != null) {
			builder.and(QContact.contact.ngayLienHe.goe(formatDate.parse(tuNgay)));
		}

		if (!denNgay.equals("") && denNgay != null) {
			builder.and(QContact.contact.ngayLienHe.loe(formatDate.parse(denNgay)));
		}

		return lienHeRepo.findAll(builder, PageRequest.of(page - 1, 2));
	}

	@Override
	public Contact findById(long id) {
		return lienHeRepo.findById(id).get();
	}

	@Override
	public Contact save(Contact lh) {
		return lienHeRepo.save(lh);
	}

	@Override
	public int countByTrangThai(String trangThai) {
		return lienHeRepo.countByTrangThai(trangThai);
	}

}
