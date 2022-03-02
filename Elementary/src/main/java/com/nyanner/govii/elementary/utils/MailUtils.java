package com.nyanner.govii.elementary.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Random;

@Slf4j
public class MailUtils {

    JavaMailSenderImpl mailSender;

    public void contextLoads(String mailAddress) {
        int count = 1;  //默认发送一次

        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = null;
        try {
            helper = new MimeMessageHelper(mimeMessage, true);
            while (count-- != 0) {
                String codeNum = "";
                int[] code = new int[3];
                Random random = new Random();
                //自动生成验证码
                for (int i = 0; i < 6; i++) {
                    int num = random.nextInt(10) + 48;
                    int uppercase = random.nextInt(26) + 65;
                    int lowercase = random.nextInt(26) + 97;
                    code[0] = num;
                    code[1] = uppercase;
                    code[2] = lowercase;
                    codeNum += (char) code[random.nextInt(3)];
                }
                //标题
                helper.setSubject("您的验证码为：" + codeNum);
                //内容
                helper.setText("您好！来自电信知识库系统的验证码为：" + "<h2>" + codeNum + "</h2>" + "千万不能告诉别人哦！", true);
                //邮件接收者
                helper.setTo(mailAddress);
                //邮件发送者，必须和配置文件里的一样，不然授权码匹配不上
                helper.setFrom("2033279818@qq.com");
                mailSender.send(mimeMessage);
                log.info("邮件发送成功！" + (count + 1));
            }
        } catch (MessagingException e) {
            log.info("邮件异常错误");
        }


    }
}











