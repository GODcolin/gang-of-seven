package com.nyanner.govii.elementary.aspect;

import com.nyanner.govii.elementary.exception.CaptchaErrorException;
import com.nyanner.govii.elementary.service.infa.CaptchaService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Aspect
@Component
@AllArgsConstructor
@Slf4j
public class CaptchaAspect {
    CaptchaService captchaService;

    @Pointcut("@annotation(com.nyanner.govii.elementary.annotation.Captcha)")
    public void captchaPointCut() {
    }

    @Before("captchaPointCut()")
    public void checkCaptcha(JoinPoint joinPoint) {
        log.info("Check captcha");
        var sra = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        assert sra != null;
        HttpServletRequest request = sra.getRequest();
        String token = request.getHeader("X-Captcha-Token");
        String code = request.getHeader("X-Captcha-Code");
        log.info("Token: {}", token);
        log.info("Code: {}", code);
        if (captchaService.versifyCaptcha(token, code)) {
            log.info("Captcha is correct");
            return;
        }
        log.info("Captcha Error!");
        throw new CaptchaErrorException("验证码错误");
    }
}
