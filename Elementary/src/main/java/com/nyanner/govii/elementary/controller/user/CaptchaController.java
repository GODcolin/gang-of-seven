package com.nyanner.govii.elementary.controller.user;

import com.nyanner.govii.elementary.service.infa.CaptchaService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.Map;

@RestController
@RequestMapping("/api/captcha")
@AllArgsConstructor
public class CaptchaController {
    private CaptchaService captchaService;

    @GetMapping
    public Map<String, Object> captcha() throws IOException {
        return captchaService.captchaCreator();
    }
}
