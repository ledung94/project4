package com.mobileshop.api.admin;

import java.text.ParseException;
import java.util.Date;
import java.util.Map;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mobileshop.dto.ContactDTO;
import com.mobileshop.dto.SearchContactObject;
import com.mobileshop.entities.Contact;
import com.mobileshop.entities.ResponseObject;
import com.mobileshop.service.ContactService;
import com.mobileshop.ulti.EmailUlti;

@RestController
@RequestMapping("/api/contact")
public class ContactApi {

	@Autowired
	private ContactService lienHeService;

	@Autowired
	private EmailUlti emailUlti;

	@GetMapping("/all")
	public Page<Contact> getLienHeByFilter(@RequestParam(defaultValue = "1") int page,
			@RequestParam String trangThaiLienHe, @RequestParam String tuNgay, @RequestParam String denNgay)
			throws ParseException {

		SearchContactObject object = new SearchContactObject();
		object.setDenNgay(denNgay);
		object.setTrangThaiLienHe(trangThaiLienHe);
		object.setTuNgay(tuNgay);

		Page<Contact> listLienHe = lienHeService.getLienHeByFilter(object, page);
		return listLienHe;
	}

	@GetMapping("/{id}")
	public Contact getLienHeById(@PathVariable long id) {
		return lienHeService.findById(id);
	}

	@PostMapping("/reply")
	public ResponseObject tradLoiLienHeProcess(@RequestBody @Valid ContactDTO dto, BindingResult result) {

		ResponseObject ro = new ResponseObject();

		if (result.hasErrors()) {

			Map<String, String> errors = result.getFieldErrors().stream()
					.collect(Collectors.toMap(FieldError::getField, FieldError::getDefaultMessage));
			ro.setErrorMessages(errors);

//			List<String> keys = new ArrayList<String>(errors.keySet());
//			for (String key : keys) {
//				System.out.println(key + ": " + errors.get(key));
//			}

			ro.setStatus("fail");
		} else {
			System.out.println(dto.toString());
			
			emailUlti.sendEmail(dto.getDiaChiDen(), dto.getTieuDe(), dto.getNoiDungTraLoi());
			
			Contact lienHe = lienHeService.findById(dto.getId());
			lienHe.setTrangThai("Đã trả lời");
			lienHe.setNgayTraLoi(new Date());
			lienHe.setNoiDungTraLoi(dto.getNoiDungTraLoi());

			lienHeService.save(lienHe);
			ro.setStatus("success");
		}
		return ro;

	}
}
