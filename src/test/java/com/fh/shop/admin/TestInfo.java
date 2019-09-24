package com.fh.shop.admin;

import com.alibaba.fastjson.JSONObject;
import org.junit.Test;
import sun.applet.Main;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

public class TestInfo {

    @Test
    public void test1() {
        Map result = new HashMap();
        result.put("code", "-10000");
        result.put("msg", "没有访问权限");

        String s = JSONObject.toJSONString(result);
        System.out.println(s);
    }

    @Test
    public void test2() {
        Map<String, String> result = new HashMap();
        result.put("userName", "zhangsan");
        result.put("age", "30");
        result.put("sex", "男");
        result.put("class", "1901");
        Iterator<Map.Entry<String, String>> iterator = result.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<String, String> entry = iterator.next();
            System.out.println(entry.getKey()+":"+entry.getValue());
        }
        System.out.println("============");
    }

    @Test
    public void testSendMail() throws MessagingException {
        // 通过发件人的账号和密码，连接发送邮件的服务器【登录邮箱】
        Properties prop = new Properties();
        prop.setProperty("mail.host", "smtp.qq.com");
        prop.setProperty("mail.transport.protocol", "smtp");
        prop.setProperty("mail.smtp.auth", "true");
        Session session = Session.getInstance(prop);
        Transport ts = session.getTransport();
        ts.connect("smtp.qq.com", "1106969220@qq.com", "zbfgvwcokmgkfiae");
        // 写邮件
        MimeMessage message = new MimeMessage(session);
        // 发件人[当前登录人] from
        message.setFrom(new InternetAddress("1106969220@qq.com"));
        // 收件人 to
        message.setRecipient(Message.RecipientType.TO, new InternetAddress("532028476@qq.com"));
        // 标题 subject
        message.setSubject("我的测试111");
        // 内容
        message.setContent("<h1>你好啊！</h1>", "text/html;charset=UTF-8");
        // 发送按钮
        ts.sendMessage(message, message.getAllRecipients());
        ts.close();

    }
}
