package com.mobileshop.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mobileshop.dto.AccountDTO;
import com.mobileshop.entities.User;
import com.mobileshop.entities.Role;
import com.mobileshop.repository.UserRepository;
import com.mobileshop.repository.RoleRepository;
import com.mobileshop.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository nguoiDungRepo;

	@Autowired
	private RoleRepository vaiTroRepo;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public User findByEmail(String email) {
		return nguoiDungRepo.findByEmail(email);
	}

	@Override
	public User findByConfirmationToken(String confirmationToken) {
		return null;
	}

	@Override
	public User saveUserForMember(User nd) {
		nd.setPassword(bCryptPasswordEncoder.encode(nd.getPassword()));
		Set<Role> setVaiTro = new HashSet<>();
		setVaiTro.add(vaiTroRepo.findByTenVaiTro("ROLE_MEMBER"));
		nd.setVaiTro(setVaiTro);
		return nguoiDungRepo.save(nd);
	}

	@Override
	public User findById(long id) {
		User nd = nguoiDungRepo.findById(id).get();
		return nd;
	}

	@Override
	public User updateUser(User nd) {
		return nguoiDungRepo.save(nd);
	}

	@Override
	public void changePass(User nd, String newPass) {
		nd.setPassword(bCryptPasswordEncoder.encode(newPass));
		nguoiDungRepo.save(nd);
	}

	@Override
	public Page<User> getNguoiDungByVaiTro(Set<Role> vaiTro,  int page) {
		return nguoiDungRepo.findByVaiTro(vaiTro, PageRequest.of(page - 1, 6));
	}

	@Override
	public List<User> getNguoiDungByVaiTro(Set<Role> vaiTro) {
		return nguoiDungRepo.findByVaiTro(vaiTro);
	}

	@Override
	public User saveUserForAdmin(AccountDTO dto) {
		User nd = new User();
		nd.setHoTen(dto.getHoTen());
		nd.setDiaChi(dto.getDiaChi());
		nd.setEmail(dto.getEmail());
		nd.setSoDienThoai(dto.getSdt());
		nd.setPassword(bCryptPasswordEncoder.encode(dto.getPassword()));
		
		Set<Role> vaiTro  = new HashSet<>();
		vaiTro.add(vaiTroRepo.findByTenVaiTro(dto.getTenVaiTro()));
		nd.setVaiTro(vaiTro);
		
		return nguoiDungRepo.save(nd);
	}

	@Override
	public void deleteById(long id) {
		nguoiDungRepo.deleteById(id);
	}

}
