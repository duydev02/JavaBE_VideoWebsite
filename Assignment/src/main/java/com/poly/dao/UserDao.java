package com.poly.dao;

import java.util.List;
import java.util.Map;

import com.poly.entity.User;

public interface UserDao {
	User findByid(Integer id);
	User findByEmail(String email);
	User findByUsername(String username);
	User findbyUsernameAndPassword(String username, String password);
	
	List<User> findAll();
	List<User> findAll(int PageNumber, int PageSize);	
	User create(User entity);
	User update(User entity);
	User delete(User entity);
	List<User> findUserdLikedVideoByVideoHref(Map<String, Object> params);
}