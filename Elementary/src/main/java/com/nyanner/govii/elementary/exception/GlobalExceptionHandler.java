package com.nyanner.govii.elementary.exception;

import com.nyanner.govii.elementary.auth.payload.response.MessageResponse;
import com.nyanner.govii.elementary.common.AppConstant;
import com.nyanner.govii.elementary.utils.StringUtils;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.ConversionNotSupportedException;
import org.springframework.beans.TypeMismatchException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

@ControllerAdvice
@ResponseBody
@Slf4j
public class GlobalExceptionHandler {
    private static final String logExceptionFormat = "服务器异常: Code: %s Detail: %s";

    //运行时异常
//    @ExceptionHandler(RuntimeException.class)
    public RestResponse runtimeExceptionHandler(RuntimeException ex) {
        System.err.println("RuntimeException:");
        return resultOut(AppConstant.RunTime, "服务器内部错误，运行异常", ex);
    }

//    //空指针异常
//    @ExceptionHandler(NullPointerException.class)
//    public RestResponse nullPointerExceptionHandler(NullPointerException ex) {
//        System.err.println("NullPointerException:");
//        return resultOut(AppConstant.NullPointer, "空指针异常", ex);
//    }

    //类型转换异常
    @ExceptionHandler(ClassCastException.class)
    public RestResponse classCastExceptionHandler(ClassCastException ex) {
        System.err.println("ClassCastException:");
        return resultOut(AppConstant.ClassCast, "类型转换异常", ex);
    }

    //IO异常
    @ExceptionHandler(IOException.class)
    public RestResponse iOExceptionHandler(IOException ex) {
        System.err.println("IOException:");
        return resultOut(AppConstant.IO, "IO异常", ex);
    }

    //未知方法异常
    @ExceptionHandler(NoSuchMethodException.class)
    public RestResponse noSuchMethodExceptionHandler(NoSuchMethodException ex) {
        System.err.println("NoSuchMethodException:");
        return resultOut(AppConstant.NoSuchMethod, "未知方法异常", ex);
    }

    //数组越界异常
    @ExceptionHandler(IndexOutOfBoundsException.class)
    public RestResponse indexOutOfBoundsExceptionHandler(IndexOutOfBoundsException ex) {
        System.err.println("IndexOutOfBoundsException:");
        return resultOut(AppConstant.IndexOutOfBounds, "数组越界异常", ex);
    }

    //400错误
    @ExceptionHandler({HttpMessageNotReadableException.class})
    public RestResponse requestNotReadable(HttpMessageNotReadableException ex) {
        System.err.println("HttpMessageNotReadableException");
        return resultOut(AppConstant.HttpMessageNotReadable, "400 bad request", ex);
    }

    //400错误
    @ExceptionHandler({TypeMismatchException.class})
    public RestResponse requestTypeMismatch(TypeMismatchException ex) {
        System.err.println("TypeMismatchException:");
        return resultOut(AppConstant.TypeMismatch, "400 bad request", ex);
    }

    //400错误
    @ExceptionHandler({MissingServletRequestParameterException.class})
    public RestResponse requestMissingServletRequest(MissingServletRequestParameterException ex) {
        System.err.println("MissingServletRequestParameterException:");
        return resultOut(AppConstant.MissingServletRequestParameter, "400 bad request", ex);
    }

    @ExceptionHandler({CaptchaErrorException.class})
    public ResponseEntity<?> captchaError(CaptchaErrorException ex) {
        System.err.println("CaptchaErrorException:");
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(new MessageResponse(ex.getMessage()));
    }

    //405错误
    @ExceptionHandler({HttpRequestMethodNotSupportedException.class})
    public RestResponse request405(HttpRequestMethodNotSupportedException ex) {
        System.err.println("HttpRequestMethodNotSupportedException:");
        return resultOut(AppConstant.HttpRequestMethodNotSupported, "405 Method not allowed", ex);
    }

    //406错误
    @ExceptionHandler({HttpMediaTypeNotAcceptableException.class})
    public RestResponse request406(HttpMediaTypeNotAcceptableException ex) {
        System.err.println("HttpMediaTypeNotAcceptableException:");
        return resultOut(AppConstant.HttpMediaTypeNotAcceptable, "406 Not Acceptable", ex);
    }

    //500错误
    @ExceptionHandler({ConversionNotSupportedException.class, HttpMessageNotWritableException.class})
    public RestResponse server500(RuntimeException ex) {
        System.err.println("RuntimeException:");
        return resultOut(AppConstant.HttpMediaTypeNotAcceptable, "500 error", ex);
    }

    //栈溢出
    @ExceptionHandler({StackOverflowError.class})
    public RestResponse requestStackOverflow(StackOverflowError ex) {
        System.err.println("StackOverflowError:");
        return resultOut(AppConstant.StackOverflow, "栈溢出异常", ex);
    }

    //除数不能为0
    @ExceptionHandler({ArithmeticException.class})
    public RestResponse arithmeticException(ArithmeticException ex) {
        System.err.println("ArithmeticException:");
        return resultOut(AppConstant.Arithmetic, "除数不能为0", ex);
    }

    //其他错误
//    @ExceptionHandler({Exception.class})
    public RestResponse exception(Exception ex) {
        System.err.println("Exception:");
        return resultOut(AppConstant.other, "其他异常", ex);
    }

    /**
     * 对返回数据集中处理
     *
     * @param code
     * @param msg
     * @param ex
     * @param <T>
     * @return
     */
    private <T extends Throwable> RestResponse resultOut(int code, String msg, T ex) {
        ex.printStackTrace();
        log.error(String.format(logExceptionFormat, code, ex.getMessage()));
        return RestResponse.fail(code).msg(msg);
    }


    /**
     * 业务异常
     */
    @ExceptionHandler(CustomException.class)
    public RestResponse businessException(CustomException e) {
        if (StringUtils.isNull(e.getCode())) {
            return RestResponse.fail().msg(e.getMessage());
        }

        return RestResponse.fail(e.getCode()).msg(e.getMessage());
    }


}

















