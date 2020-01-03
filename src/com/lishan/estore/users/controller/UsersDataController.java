package com.lishan.estore.users.controller;
import javax.servlet.http.Cookie;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.lishan.estore.users.IUsersService;
import com.lishan.estore.users.Users;
import com.lishan.estore.util.Cookies_util;
import com.lishan.estore.util.GetJsonUtil;
import com.lishan.estore.util.MySendMailThread;

//import com.lishan.estore.util.SendCode;

@Controller
@RequestMapping(value = "/users", produces = "text/html;charset=utf-8")
public class UsersDataController {

	@Autowired
	@Qualifier("uService")
	private IUsersService usersService;

	@Autowired
	private GetJsonUtil jsonUtil;

	// 添加acode进数据库 和用户激活验证 同一用户全局使用参数
	String acode = UUID.randomUUID().toString().replace("-", "");

	@RequestMapping(value = "/login.action", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String passNameAndPasswordLogin(@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "remeberme", required = true) String remeberme,
			@RequestParam(value = "password", required = true) String password, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		response.setCharacterEncoding("text/html;charset=utf-8");
		Users users = usersService.loginBynameOrEmailAndPassword(name, password);
		JSONObject json = jsonUtil.getJson();
		if (users != null) {
			
			if("1".equals(remeberme)){
                //是否保存到cookie中呢？    //users.getUsername调用的是pojo类里面的set  get方法
                Cookie usernameCookie = Cookies_util.getCookie("username",users.getUsername(),1800);
                //打钩选项 状态为1 或 0 也存放进 cookie 并从中取值 反馈给浏览器
                //temp的字段 是从网页内获取匹配的，个人推断表示位置 name = value 相对应
                Cookie tempCookie = Cookies_util.getCookie("temp", "1", 1800);
                //把cookie响应到浏览器
                response.addCookie(usernameCookie);
                response.addCookie(tempCookie);
            }else {
                Cookie usernameCookie = Cookies_util.getCookie("username","",0);
                Cookie tempCookie = Cookies_util.getCookie("temp","",0);
                //默认是0的话也将响应反馈到浏览器
                response.addCookie(usernameCookie);
                response.addCookie(tempCookie);
            }
			System.out.println("-----------------" + users);
			//登录成功用户信息存储到session中
			session.setAttribute("user", users);
			json.put("error_code", "0");
			json.put("error_msg", "login OK!");
		} else {
			json.put("error_code", "10000");
			json.put("error_msg", "用户名或者密码错误!");
		}
		return json.toJSONString();
	}

	//注册用户
	@RequestMapping(value = "/register", produces = "text/html;charset=utf-8")
	@ResponseBody // @RequestParam(value = "birthday", required = true) Date birthday,
	public String registerUser(@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "sex", required = true) String sex,
			@RequestParam(value = "address", required = true) String address, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("测试是否得到参数：" + username + "password:" + password + ",email:" + ",sex:" + sex + ",name:" + name
				+ ",address:" + address);

		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// String startTime = sdf.format(birthday);

		response.setCharacterEncoding("text/html;charset=utf-8");
		JSONObject json = jsonUtil.getJson();

		int result = usersService.insertUserService(username, password, email, name, sex, address, acode);

		System.out.println("注册数据的返回值：" + result);

		if (result != 0) {
			json.put("error_code", "1");
			json.put("insert-users", "ok");
			System.out.println("注册用户成功，需要进行邮箱验证激活！");

			// 调用邮箱接口，进行发送验证短信！
			Users user = new Users();
			user.setUsername(username);
			user.setEmail(email);
			user.setName(name);
			user.setAcode(acode);
			new MySendMailThread(user).start();
		} else {
			json.put("error_code", "-1");
			json.put("insert-users", "false");
		}
		return json.toJSONString();

	}

	// 获取激活码Acode 通过激活码调用数据库 修改用户stat状态
	@RequestMapping(value = "/active", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String checkAcode(HttpServletResponse response, HttpServletRequest request) throws Exception {
		String acode = request.getParameter("acode");
		// System.out.println(acode+"1111111111111111111111");
		// String username = request.getParameter("userame");
		// 调用service层
		int result = usersService.activeUser(acode);
		System.out.println("调用activeuser成功！" + result);
		if (result > 0) {
			System.out.println("账户激活成功！");
			return "login";
		} else {
			System.out.println("账户激活失败！");
			return "register";
		}
	}

	// 获取手机验证码：   
	@RequestMapping(value = "/fastlogin.check1", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String checkPhoneCode(String phoneNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// System.out.println("前端获取的手机号："+phoneNum);
		// System.out.println("前端传来的验证码："+msgcode);
		// 调用短信接口 获取到服务器发送的验证码
		// String phoneCode = new SendCode().phoneCode(phoneNum);
		String phoneCode = "1234";
		// 把验证码存储到session域中
		HttpSession session = request.getSession();
		session.setAttribute("phoneCode", phoneCode);
		System.out.println("快速登录手机验证码：" + phoneCode);
		// 尝试获取一下session中存取的手机验证码
		String c1 = (String) session.getAttribute("phoneCode");
		System.out.println("此处为从session域中存取的phoneCode:" + c1);
		return c1;// 返回一个手机验证码,已存session域

	}

	// 通过手机快速登录
	@RequestMapping(value = "/fastlogin.check2", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String checkPhoneCodeAndLogin(String phoneNum, String msgcode, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String phoneCode = (String) session.getAttribute("phoneCode");
		JSONObject json = jsonUtil.getJson();
		// 判断获取的验证码 是否和 手机接收到的验证码一样 一样则去数据库查询用户 进行登录
		if (phoneCode.equals(msgcode)) {
			// 通过手机号码去数据库查询数据
			Users userphone = usersService.queryUserByphone(phoneNum);
			System.out.println("该用户登录！" + userphone);
			if (userphone != null) {
				//将用户存放到session中
				session.setAttribute("user", userphone);
				// 如果用户存在，则json发送数据 error_code =24,不存在则 发送404
				json.put("error_code", "24");
				json.put("phoneNum", "ok");
				json.put("users", "login");
			} else {
				// 如果验证码和输入的不一样，则发送error_code 404 不允许登录
				json.put("error_code", "404");
				json.put("phoneNum", "error");
				json.put("user", "cant login");
			}

		} else {
			System.out.println("phoneCode:" + phoneCode);
			System.out.println("msgcode:" + msgcode);
			System.out.println("验证码不一致！！！！！！");
		}

		// 把json数据返回到前端
		return json.toJSONString();
	}

	// 忘记密码验证码 
	@RequestMapping(value = "/forgetpassword.check", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String forgetPasswordUpdate(String phoneno, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// System.out.println("前端获取的手机号："+phoneNum);
		// System.out.println("前端传来的验证码："+msgcode);
		// 调用短信接口 获取到服务器发送的验证码
		// String phoneCode = new SendCode().phoneCode(phoneNum);
		String phoneCode = "1234";
		// 把验证码存储到session域中
		HttpSession session = request.getSession();
		session.setAttribute("phoneCode", phoneCode);
		System.out.println("忘记密码手机验证码：" + phoneCode);
		// 尝试获取一下session中存取的手机验证码
		String c1 = (String) session.getAttribute("phoneCode");
		//System.out.println("此处为从session域中存取的phoneCode:" + c1);
		return c1;// 返回一个手机验证码,已存session域

	}
	
	
	
	//异步验证邮箱
	@RequestMapping(value="/checkusername", produces="text/html;charset=utf-8")
	@ResponseBody
	public String checkusername(@RequestParam("name")String name)throws Exception{
		JSONObject json = jsonUtil.getJson();
		//System.out.println(name);
		int result = name.split("@").length;
		if(result>1) {
			String email = name;
			//证明为邮箱登录，调用SQL查询该邮箱对应的用户
			Users user = usersService.queryUserByEmail(email);
			System.out.println("email查询用户结果："+user);
			if(user!=null) {
				json.put("error_code", "24");
				json.put("error_msg", "ok");
			}else {
				json.put("error_code", "404");
			}
		}else {
			//证明为用户username登录，调用SQL 查询该username对应的用户
			String username = name;
			Users user = usersService.queryUserByUsername(username);
			System.out.println("username查询结果："+user);
			if(user!=null) {
				json.put("error_code", "24");
				json.put("error_msg", "ok");
			}else {
				json.put("error_code", "404");
				
			}
		}
		
		return json.toJSONString();
	}
	
	//异步验证手机号
	@RequestMapping(value="/checkphone", produces="text/html;charset=utf-8")
	@ResponseBody
	public String checkphone(@Param("phone")String phone)throws Exception{
		JSONObject json = jsonUtil.getJson();
		System.out.println("异步验证手机号码："+phone);
		Users user = usersService.queryUserByphone(phone);
		System.out.println("异步验证用户数据："+user);
		if(user!=null) {
			json.put("error_code", "24");
			json.put("error_msg", "queryuserbyphone ok");
		}else {
			json.put("error_code", "404");
			json.put("error_msg", "queryuserbyphone error");
		}
		return json.toJSONString();
	}
	

	//ajax check email
	@RequestMapping(value="/checkEmail",produces="text/html;charset=utf-8")
	@ResponseBody
	public String registerCheckEmail(@Param("email")String email)throws Exception{
		JSONObject json = jsonUtil.getJson();
		Users user = usersService.queryUserByEmail(email);
		if(user!=null) {
			json.put("error_code", "24");
			json.put("error_msg", "email query error");
		}else {
			json.put("error_code", "404");
		}
		return json.toJSONString();
	}
	
	
	
	// 修改密码
	@RequestMapping(value = "/forgetpassword.check1", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String forgetPasswordCheckPhoneNo(@RequestParam(value = "phoneno", required = true) String phoneno,
			@RequestParam(value = "newpassword", required = true) String newpassword,
			@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "msgcode", required = true) String msgcode, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		JSONObject json = jsonUtil.getJson();
		//获取session中的验证码，与前端验证码对比
		HttpSession session = request.getSession();
		String phoneCode = (String) session.getAttribute("phoneCode");
	
		if(phoneCode.equals(msgcode)) {
			// 通过手机号 用户名 联合对应去数据库进行修改用户密码
			boolean result = usersService.updateUserByphoneAndpassword(phoneno, newpassword, username);
			if (result) {
				System.out.println("用户密码已经重置！");
				json.put("error_code", "36");
				json.put("update_password", "ok");
			} else {
				json.put("error_code", "404");
				json.put("update_password", "error");
			}
		}else {
			System.out.println("输入的验证码不正确！");
			json.put("error_code", "404");
			json.put("error_msg", "error_checkCode!");
		}
		
		return json.toJSONString();

	}
	
	
	
	// 修改密码
		@RequestMapping(value = "/forgetpassword.check3", produces = "text/html;charset=utf-8")
		@ResponseBody
		public String fastRegister(@RequestParam(value = "phoneno", required = true) String phoneno,
				@RequestParam(value = "newpassword", required = true) String newpassword,
				@RequestParam(value = "username", required = true) String username,
				@RequestParam(value = "msgcode", required = true) String msgcode, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			JSONObject json = jsonUtil.getJson();
			//获取session中的验证码，与前端验证码对比
			HttpSession session = request.getSession();
			String phoneCode = (String) session.getAttribute("phoneCode");
		
			if(phoneCode.equals(msgcode)) {
				// 通过手机号 用户名 联合对应去数据库进行修改用户密码
				boolean result = usersService.insertUserByphoneAndpassword(phoneno, newpassword, username);
				if (result) {
					System.out.println("快速注册完成！");
					json.put("error_code", "36");
					json.put("update_password", "ok");
				} else {
					json.put("error_code", "404");
					json.put("update_password", "error");
				}
			}else {
				System.out.println("输入的验证码不正确！");
				json.put("error_code", "404");
				json.put("error_msg", "error_checkCode!");
			}
			
			return json.toJSONString();

		}
	

}
