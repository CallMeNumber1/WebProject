package com.service;

import com.entity.User;

public class UserService {
	public static User check(String username, String password) {
		if ("root".equals(username) && "root".equals(password)) {
			User user = new User();
			user.setPassword(password);
			user.setUsername(username);
			user.setName("root");
			return user;
		} else {
			return null;
		}
	}
}
