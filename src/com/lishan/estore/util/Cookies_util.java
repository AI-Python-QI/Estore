package com.lishan.estore.util;

import javax.servlet.http.Cookie;

public class Cookies_util {

    //获取cookie的方法
    public static Cookie getCookie(String name, String value, int life){
        //此处调用的是真实的cookie函数，进行传值 操作
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(life);
        //设置cookie的作用域，调用cookie的path方法
        cookie.setPath("/");
        //然后做一个返回
        return cookie;

    }

}
