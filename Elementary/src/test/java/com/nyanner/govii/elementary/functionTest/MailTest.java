package com.nyanner.govii.elementary.functionTest;

import com.nyanner.govii.elementary.utils.MailUtils;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@SpringBootTest
@Slf4j
public class MailTest {
    @Autowired
    JavaMailSenderImpl javaMailSender;

    @Autowired
    MailUtils mailUtils;

    @Test
    public void mainSend() {
        SimpleMailMessage message = new SimpleMailMessage();

        //邮件主题
        message.setSubject("密码忘记验证");

        //邮件内容
        message.setText("1234");

        //接收者邮箱地址
        message.setTo("3189019385@qq.com");

        //发送者邮箱地址
        message.setFrom("2033279818@qq.com");

        javaMailSender.send(message);

    }


    @Test
    public void randomCode() {
        mailUtils.contextLoads("3189019385@qq.com");

    }
}















