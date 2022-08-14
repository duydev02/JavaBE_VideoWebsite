package com.poly.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.poly.constant.NamedStored;
import com.poly.dao.UserDao;
import com.poly.dao.impl.UserDaoImpl;
import com.poly.dto.UserDto;
import com.poly.entity.User;
import com.poly.service.UserService;

public class UserServiceImpl implements UserService {

	private UserDao dao;

	public UserServiceImpl() {
		dao = new UserDaoImpl();
	}

	@Override
	public User findByid(Integer id) {
		return dao.findByid(id);
	}

	@Override
	public User findByEmail(String email) {
		return dao.findByEmail(email);
	}

	@Override
	public User findByUsername(String username) {
		return dao.findByUsername(username);
	}

	@Override
	public User login(String username, String password) {
		return dao.findbyUsernameAndPassword(username, password);
	}

	@Override
	public User resetPassword(String email) {
		User existUser = findByEmail(email);
		if (existUser != null) {
			// (Math.random()) * ((max - min) + 1) + min
			String newPass = String.valueOf((int) (Math.random() * ((9999 - 1000) + 1)) + 1000);
			existUser.setPassword(newPass);
			return dao.update(existUser);
		}
		return null;
	}

	@Override
	public List<User> findAll() {
		return dao.findAll();
	}

	@Override
	public List<User> findAll(int PageNumber, int PageSize) {
		return dao.findAll(PageNumber, PageSize);
	}

	@Override
	public User register(String username, String password, String email) {
		User newuser = new User();
		newuser.setUsername(username);
		newuser.setPassword(password);
		newuser.setEmail(email);
		newuser.setIsAdmin(Boolean.FALSE);
		newuser.setIsActive(Boolean.TRUE);
		System.out.println("--------------------" + username);
		return dao.create(newuser);
	}

	@Override
	public User update(User entity) {
		return dao.update(entity);
	}

	@Override
	public User delete(String username) {
		User user = dao.findByUsername(username);
		user.setIsActive(Boolean.FALSE);
		return dao.update(user);
	}

	@Override
	public List<UserDto> findUsersLikedVideoByVideoHref(String href) {
		Map<String, Object> params = new HashMap<>();
		params.put(NamedStored.PARAMETER_FIND_USERS_LIKED_VIDEO_BY_VIDEO_HREF, href);
		List<User> users = dao.findUserdLikedVideoByVideoHref(params);
		List<UserDto> result = new ArrayList<>();
		users.forEach(user -> {
			UserDto dto = new UserDto();
			dto.setUsername(user.getUsername());
			dto.setEmail(user.getEmail());
			result.add(dto);
		});
		return result;
	}

}
