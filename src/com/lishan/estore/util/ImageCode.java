package com.lishan.estore.util;
import java.util.Random;
import java.util.Scanner;

public class ImageCode {

    //验证码登录功能  4位组成数字和大写字母 无序  每次都不同
    public static void main(String[] args) {
        //定义验证码数组
        String[] strArray = {"0","1","2","3","4","5","6","7","8","9",
                "A","B","C","D","E","F","G","H","I","J","K","L","M","N",
                "O","P","Q","R","S","T","U","V","W","X","Y","Z"};
        //定义一个内存为4的数组
        String[] str = new String[4];
        //System.out.println(strArray.length);
        Random random = new Random();
        //生成随机数（0-37）
        int randNum = random.nextInt(37);
        str[0] = strArray[randNum];
        for (int i = 1; i < str.length; i++) {
            randNum = random.nextInt(37);
            str[i] = strArray[randNum];
            for (int j = 0; j < str.length; j++) {
                if(str[i] == str[j] && i != j){
                    randNum = random.nextInt(37);
                    str[i] = strArray[randNum];
                    j = j-1;//退回到前一位重新判断
                }
            }
        }
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < str.length; i++) {
            sb.append(str[i]);
        }
        String s = sb.toString();
        System.out.print("4位验证码："+s);
        @SuppressWarnings("resource")
        Scanner sc = new Scanner(System.in);
        String strNum;
        System.out.println();
        System.out.println("请输入4位验证码：");
        strNum = sc.next();
        while(strNum != null){
            if(strNum.toUpperCase().equals(s)){
                System.out.println("验证码正确");
                break;
            }else{
                System.out.println("你的输入有误，请重新输入：");
                strNum = sc.next();
            }
        }




    }
}
