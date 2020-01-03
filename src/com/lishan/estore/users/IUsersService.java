package com.lishan.estore.users;




public interface IUsersService {

	//用户登录
	public Users loginBynameOrEmailAndPassword(String name, String password) throws Exception;
	//用户注册，已废弃
	public Users registerBynNamePasswordService(String username, String password, String email, String name, String sex,
			String address) throws Exception;
	//用户注册
	public int  insertUserService(String username, String password, String email, String name, String sex,
			String address,String acode) throws Exception;
	//邮箱验证激活
	public int activeUser(String acode)throws Exception;
	//通过手机号去数据库查询数据，返回值为user
	public Users queryUserByphone(String phoneNum)throws Exception;
	//通过手机号 和用户名修改密码
	public boolean updateUserByphoneAndpassword(String phoneno, String newpassword, String username)throws Exception;
	//通过email查询是否有该用户
	public Users queryUserByEmail(String email);
	//通过username查询是否有该用户
	public Users queryUserByUsername(String username);
	//快速注册
	public boolean insertUserByphoneAndpassword(String phoneno, String newpassword, String username)throws Exception;

	
}
