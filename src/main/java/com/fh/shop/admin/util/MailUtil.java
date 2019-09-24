package com.fh.shop.admin.util;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailUtil {

    public static void sendMail(String subject, String content, String to) {
        // 通过发件人的账号和密码，连接发送邮件的服务器【登录邮箱】
        Properties prop = new Properties();
        prop.setProperty("mail.host", SystemConst.MAIL_HOST);
        prop.setProperty("mail.transport.protocol", "smtp");
        prop.setProperty("mail.smtp.auth", "true");
        Session session = Session.getInstance(prop);
        Transport ts = null;
        try {
            ts = session.getTransport();
            ts.connect(SystemConst.MAIL_HOST, SystemConst.MAIL_FROM, SystemConst.MAIL_PASSWORD);
            // 写邮件
            MimeMessage message = new MimeMessage(session);
            // 发件人[当前登录人] from
            message.setFrom(new InternetAddress(SystemConst.MAIL_FROM));
            // 收件人 to
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // 标题 subject
            message.setSubject(subject);
            // 内容
            message.setContent(content, "text/html;charset=UTF-8");
            // 发送按钮
            ts.sendMessage(message, message.getAllRecipients());
        } catch (MessagingException e) {
            e.printStackTrace();
        } finally {
            if (null !=  ts) {
                try {
                    ts.close();
                    ts = null;
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
