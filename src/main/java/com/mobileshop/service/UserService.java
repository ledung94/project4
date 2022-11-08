package com.mobileshop.service;

import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;

import com.mobileshop.dto.AccountDTO;
import com.mobileshop.entities.User;
import com.mobileshop.entities.Role;

public interface UserService {

	User findByEmail(String email);

	User findByConfirmationToken(String confirmationToken);

	User saveUserForMember(User nd);

	User findById(long id);

	User updateUser(User nd);

	void changePass(User nd, String newPass);

	Page<User> getNguoiDungByVaiTro(Set<Role> vaiTro, int page);

	List<User> getNguoiDungByVaiTro(Set<Role> vaiTro);
	
	User saveUserForAdmin(AccountDTO dto);

	void deleteById(long id);

}
