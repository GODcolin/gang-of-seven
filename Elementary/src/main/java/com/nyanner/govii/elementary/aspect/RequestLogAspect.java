package com.nyanner.govii.elementary.aspect;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
@Aspect
@Slf4j
public class RequestLogAspect {
    private final ObjectMapper JSON = new ObjectMapper();

    /**
     * 定义切点
     */
    @Pointcut("execution(* com.nyanner.govii.elementary.controller..*(..))")
    public void requestLog() {
    }

    @Around("requestLog()")
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
        //记录请求开始执行时间：
        long beginTime = System.currentTimeMillis();
        //获取请求信息
        ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        assert sra != null;
        HttpServletRequest request = sra.getRequest();

        //获取代理地址、请求地址、请求类名、方法名
//        String remoteAddress = IPUtils.getProxyIP(request);
        String requestURI = request.getRequestURI();
        String requestMethod = request.getMethod();
        String methodName = pjp.getSignature().getName();
        String clazzName = pjp.getTarget().getClass().getSimpleName();

        //获取请求参数：
        MethodSignature ms = (MethodSignature) pjp.getSignature();
        //获取请求参数类型
        String[] parameterNames = ms.getParameterNames();
        //获取请求参数值
        Object[] parameterValues = pjp.getArgs();
        StringBuilder sb = new StringBuilder();
        //组合请求参数，进行日志打印
        if (parameterNames != null && parameterNames.length > 0) {
            for (int i = 0; i < parameterNames.length; i++) {
                if (parameterNames[i].equals("bindingResult")) {
                    break;
                }
                if ((parameterValues[i] instanceof HttpServletRequest) || (parameterValues[i] instanceof HttpServletResponse)) {
                    sb.
                        append("[").
                        append(parameterNames[i]).append("=").append(parameterValues[i])
                        .append("]");
                } else {
                    sb.
                        append("[").
                        append(parameterNames[i]).append("=")
                        .append(JSON.writeValueAsString(parameterValues[i]))
                        .append("]");
                }
            }
        }
        Object result = null;
        try {
            result = pjp.proceed();
        } catch (Throwable throwable) {
            //请求操纵失败
            //记录错误日志
            log.error("""
                (ง•̀_•́)ง (っ•̀ω•́)っ 切面处理请求错误！
                URI信息(ง•̀_•́)ง->：【{}】
                请求映射控制类(ง•̀_•́)ง->：【{}】
                请求方法(ง•̀_•́)ง->：【{}】
                请求参数列表(ง•̀_•́)ง->：【{}】
                """, requestURI, clazzName, methodName, sb.toString()
            );
            throw throwable;
        }
        //请求操作成功
        //记录请求完成执行时间：
        long endTime = System.currentTimeMillis();
        long usedTime = endTime - beginTime;
        //记录日志
        log.info("""
            请求操作成功！ 请求耗时：【{}】
            {} {}->：{}.{}
            请求参数列表(◍'౪`◍)ﾉﾞ->：【{}】
            """, usedTime, requestMethod, requestURI, clazzName, methodName, sb.toString()
        );

        return result;
    }
}
