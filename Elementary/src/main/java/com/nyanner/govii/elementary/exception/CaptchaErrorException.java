package com.nyanner.govii.elementary.exception;

import org.springframework.security.core.AuthenticationException;

import java.io.Serial;

public class CaptchaErrorException extends AuthenticationException {
    @Serial
    private static final long serialVersionUID = 1L;

    public CaptchaErrorException(String msg) {
        super(msg);
    }
}
