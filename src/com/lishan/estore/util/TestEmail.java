package com.lishan.estore.util;

import java.util.UUID;

import com.lishan.estore.users.Users;


public class TestEmail {

	public static void main(String[] args) {
		Users user = new Users();
		user.setUsername("root");
		user.setName("曾鳴俊");
		user.setEmail("2292833025@qq.com");
		user.setAcode(UUID.randomUUID().toString().replace("-", ""));
		
		MySendMailThread thread = new MySendMailThread(user);
		
		thread.start();
	}

}
