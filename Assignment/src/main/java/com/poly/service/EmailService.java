package com.poly.service;

import javax.servlet.ServletContext;

import com.poly.entity.User;

public interface EmailService {
	
	void sendEmail(ServletContext context, User recipient, String type);
	
}
