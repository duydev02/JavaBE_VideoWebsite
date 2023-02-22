package com.poly.service.Impl;

import javax.servlet.ServletContext;

import com.poly.entity.User;
import com.poly.service.EmailService;
import com.poly.util.SendEmailUtil;

public class EmailServiceImpl implements EmailService {

	private static final String EMAIL_WELCOME_SUBJECT = "Welcome to DuTube";
	private static final String EMAIL_WELCOME_PASSWORD = "DuTube - New password";

	@Override
	public void sendEmail(ServletContext context, User recipient, String type) {
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass") + "loonf7;";

		try {
			String content = null;
			String subject = null;
			switch (type) {
			case "welcome":
				subject = EMAIL_WELCOME_SUBJECT;
				content = "Thank you for signing up, " + recipient.getUsername() + "\n\n"
						+ "We built DuTube to help people can share videos with each "
						+ "other to a higher level.\n\n"
						+ "All the best,\n\n"
						+ "Duymoiz\n"
						+ "CEO DuTube";
				break;
			case "forgot":
				subject = EMAIL_WELCOME_PASSWORD;
				content = "Dear " + recipient.getUsername() + ", your new password here: " + recipient.getPassword();
				break;
			default:
				subject = "DuTube";
				content = "Maybe this email is wrong, don't care about it";
			}
			SendEmailUtil.sendEmail(host, port, user, pass, recipient.getEmail(), subject, content);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
