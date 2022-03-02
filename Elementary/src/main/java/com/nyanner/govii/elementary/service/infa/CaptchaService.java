package com.nyanner.govii.elementary.service.infa;

import java.io.IOException;
import java.util.Map;

public interface CaptchaService {
    Map<String, Object> createToken(String captcha);

    //生成captcha验证码
    Map<String, Object> captchaCreator() throws IOException;

    //验证输入的验证码是否正确
    Boolean versifyCaptcha(String token, String inputCode);
}
