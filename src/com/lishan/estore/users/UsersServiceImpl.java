package com.lishan.estore.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service(value="uService")
public class UsersServiceImpl implements IUsersService {

	//调用dao层接口
	@Autowired
	private IUsersMapper usersMapper; 
	
	public Users loginBynameOrEmailAndPassword(String name, String password) throws Exception {
		System.out.println(name+","+password);
		//判断controller传递过来的name是否是一个邮箱格式
		String email = null;
		String username = null;
		//如果数组大于0，证明此参数是一个邮箱账号
		if (name.indexOf(".")>0) {
			email =name;
			System.out.println("获取的email:"+email);
		}else{
			username=name;
			System.out.println("获取的username是："+username);
		}
		Users users = usersMapper.queryUserByUsernameorEmailorPassword(username, email, password);
		System.out.println(users);
		System.out.println("此处是usersserviceimple");
		return users;
	}

	
	//	用户注册 service
	public Users registerBynNamePasswordService(String username, String password, String email, String name, String sex,
			String address) throws Exception {
	
		return null;
	}
	
	//用户注册 插入的数据
	public int insertUserService(String username, String password, String email, String name, String sex,
			String address,String acode) throws Exception {
		// 获取从controller层获取的数据 进行判断 ，然后调用mapper 进行插入数据，返回值为int
				int result = usersMapper.insertUserBynNamePasswordESAUB(username, email, password, sex, address, name,acode);
				return result;
	}

	//邮箱验证激活
	public int activeUser(String acode) {
		
		//调用mapper进行修改用户状态 通过acode1个参数
		int result = usersMapper.updateUserStat(acode);
		
		return result;
	}

	//通过手机号进行查询用户
	public Users queryUserByphone(String phoneNum) throws Exception {
		Users user = usersMapper.queryUserByPhone(phoneNum); 
		return user;
	}


	public boolean updateUserByphoneAndpassword(String phoneno, String newpassword, String username) throws Exception {
		//调用mapper进行修改
		int result = usersMapper.updateUserPasswordByphoneAndpassword(phoneno, newpassword, username);
		//拿到返回值 判断是否修改成功
		if(result>0) {
			System.out.println("密码修改成功！");
			return true;
		}else {
			System.out.println("用户名或者手机号不存在，用户密码修改失败！");
			return false;
		}
		
		
	}


	//通过email查询用户
	public Users queryUserByEmail(String email) {
		Users user = usersMapper.queryUserByEmail(email);
		return user;
	}

	//通过username查询用户
	public Users queryUserByUsername(String username) {
		Users user = usersMapper.queryUserByUsername(username);
		return user;
	}

	//快速注册
	public boolean insertUserByphoneAndpassword(String phoneno, String newpassword, String username) throws Exception {
		int result = usersMapper.insertUserPasswordByphoneAndpassword(phoneno, newpassword, username);
		if(result>0) {
			return true;
		}else {
			System.out.println("快速注册失败！");
			return false;
		}
		
	}

	


	

}
