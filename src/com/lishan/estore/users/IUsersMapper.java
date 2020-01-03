package com.lishan.estore.users;


import org.apache.ibatis.annotations.Param;

public interface IUsersMapper {

	// dao层 查询数据库数据的接口 用户登录SQL
	//登录时 查询数据
	public Users queryUserByUsernameorEmailorPassword(@Param("username") String username,
			@Param("email") String email, @Param("password") String password);
	//注册用户 插入数据
	public int insertUserBynNamePasswordESAUB(@Param("username") String username,
			@Param("email") String email, @Param("password") String password,@Param("sex") String sex,
			 @Param("address") String address,@Param("name")String name,@Param("acode")String acode);
	
	//用户激活更改状态
	public int  updateUserStat(String acode);
	//通过手机号查询用户，快速登录
	public Users queryUserByPhone(String phoneNum);
	//修改用户密码
	public int updateUserPasswordByphoneAndpassword(@Param("phone")String phoneno, @Param("password")String newpassword,@Param("username") String username);
	//通过email查询用户
	public Users queryUserByEmail(String email);
	//通过username查询用户
	public Users queryUserByUsername(String username);
	//快速注册用户
	public int insertUserPasswordByphoneAndpassword(@Param("phoneno")String phoneno, @Param("password")String newpassword, @Param("username")String username);
	//public int insertUserPasswordByphoneAndpassword(String phoneno, String newpassword, String username);
	
}
