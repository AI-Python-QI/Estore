package com.lishan.estore.users;

import java.util.Date;

public class Users {

	private Integer id;
	private String username;
	private String password;
	private String name;
	private String email;
	private String phone;
	private Date birthday;
	private String sex;
	private String address;
	private String photo;
	private String acode;
	private Integer stat;
	
		
	
	
	
	public Users() {
		
	}
	public Users(Integer id, String username, String password, String name, String email, String phone, Date birthday,
			String sex, String address, String photo, String acode, Integer stat) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
		this.sex = sex;
		this.address = address;
		this.photo = photo;
		this.acode = acode;
		this.stat = stat;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getAcode() {
		return acode;
	}
	public void setAcode(String acode) {
		this.acode = acode;
	}
	public Integer getStat() {
		return stat;
	}
	public void setStat(Integer stat) {
		this.stat = stat;
	}
	
	@Override
	public String toString() {
		return "Users [id=" + id + ", username=" + username + ", password=" + password + ", name=" + name + ", email="
				+ email + ", phone=" + phone + ", birthday=" + birthday + ", sex=" + sex + ", address=" + address
				+ ", photo=" + photo + ", acode=" + acode + ", stat=" + stat + "]";
	}
	
	
	
	
	
	
	
	
	
}
