package com.lishan.estore.util;


 
import java.io.FileWriter;
import java.io.IOException;
 
/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */
 
public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
 
	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101600697781";
	
	// 商户私钥(生成工具生成的应用私钥)，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDj513Ursm4ioVVC0VZiTJg6wSjunGvY8qpLbpSP7A09IB2yWMgtmBGV+bpeheyuHMCiO8jPs9zGoZe6cE2GJrpxJUhpYSI/pfqUSuoGaqIgNosWBXmeNwHstymlSLT1vsOIUKY1xOdWbsdbYKC5zPuE+dXxd4h1yF0FB3W6nBRaCL+fMrqPwcvfilYIV1ez0JjzJxp7MGTWWNZCoXsa1y+Yx2+YL8GFhgzvlr4r/9xkX0tHQGm8j75DHz4XZg4ZDnm/rsbUUe/WJc85OVvuance2/laYgEehe8ZzlDE0/QglxwlsbvkykDQ6hS3c9PHA1S1l0kKmsWRnyTGsEsfZ39AgMBAAECggEAEzdxC/vo+myDrZYTtOcCnnVyoLOZ3mYVsoouibzhCLYNFvcIKrv2BjhnOgyXbvRqji4pq9kh+Nyls98V8Y/FkCyJPpsMP9jnylQp0DTJ0lS7EL4kqphKRUPpowo0M5SO+rQHP4fzGXN1eZfAR3VjRZHcEeSXRFc1dOo1UefWrKZodT+mtXzXasgajCZ77j6dx/xb8IsLm42uL80DCFU2gQ7Q7vbWThKkU2dyeaBL0YvneniK68749vZpRCgSDjcSj7qx53QMYmNjWQqX6FOtOkw3VBRyPD891IOFwDvPoCMiaHfeMM7VNyeeopuwsuXzVqdTky73jnIrX7z6jm+A6QKBgQD9U2I8HamZFteB1d7CnHNdMQK7XaRSgV9YXFz7XkSV3Eh5vXYLZVAl1/erLpqOsMYZBUnsO5Vd/4xgB0XKgEo0ie2qq/Ef2cIiAfLx6GeoWi7d3Sx0swuGFdVj3hZW0pjyYWJoelKrMe+s2cpGoQziQpyGuL77w7hTGLJ4RsW9FwKBgQDmT0eWzqSVTlG5AiqC0i1h4Z4+Nwr/fQYZjrxrdEo5Y8HJcg5/4rK/xJO7sR/X4hHaRUmFss2aAWekX8BUVKH/3CDVCaUY3eh3zfzu2nMCzqu+B1KOa/Ry5rcpEkT4cDXT4y6AVnGYsAbnonoh/kQ/U43FQVSD6yrYsGhdH3AyCwKBgQC/NIK/ETyDmmQLUZwTk/bXbji7p1ByHcgTb5OW/24RFvV1PfWtYEkAZ2Q+xqxN60t6cy16qvZwvoP7r0GUOQTJZxoGakVTXw9Sj9oJkPs8bOVW/KujYcje6ffoqyZ9XfOnbq3SYhGnucdH1hMBAGozFUgDv8oXSYEE5209r11s/QKBgEEBa5Fzbhz+aC6yH9GhBVI1XnbtDluirFAWa7RgtHqSX6Y+XT1XfWCHWbOGgRhsJOHY4LGuED5B20EYDa8/3CHdvh6jhEgKio0WRSgd3IyUTQFsC69LZUnxOQ2MrI77DRZrbzqmK5YPSUOkJpjlrdm5+bANio9Zl1RmJm7yaraVAoGBAIxlfpKeTvZVkai1S7aLyqi+WyyZMI4qAdup4/iYFuly4wI3mXrloZI6fcw8TtzSbBwvFqR4uHENVMgO9etE2fJEtoQ7HhtEOESYoh8O/jJMgqhMOYp6Wmm2/uS80cKBz83yX7rDE8UTgGURGSx/GPkFiN60gee87PIOwLqYTPkb";
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjttnSvLvlgLkSy4MqVvEj6VmY/FrE71k/C0rTQbzOmXnMFb3yUL4qKI1OkZs2aNqHFqnxqFUYV1jVMW46uazAmYbwqA9KeZg1ImJtkQgJFq0Tlo7X/+O2eB23X1DrqapwbXXZdLzl3FuOxgXIUHeCg9Xz+Bmsi5D5FGv+C8MLVEpzfZU1cGDp8sS0JzaK6JjzZiFaB+rKuyCxzpqyEtCnJ8gqft8ZJA1c4eFw246ywY7z0/yo/qgiAe/0kqsX9o10m+bShbjtMunb+PpQ1M5OxK8qeNQL7MgWztCBdFd4mvRNDc5o4EE47S78yUbInf7ufnNwcO+squOIOlRTJyuywIDAQAB";
 
	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "172.16.10.12:8080/Estore/notify_url.jsp";
 
	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问等同于支付成功的页面
	public static String return_url = "http://172.16.10.12:8080/Estore/items/index.html";
 
	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
//	// 支付宝网关
//	public static String log_path = "/lishan/logs/";
 
 
//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
 
    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
//    public static void logResult(String sWord) {
//        FileWriter writer = null;
//        try {
//            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
//            writer.write(sWord);
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (writer != null) {
//                try {
//                    writer.close();
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//    }
}
 
