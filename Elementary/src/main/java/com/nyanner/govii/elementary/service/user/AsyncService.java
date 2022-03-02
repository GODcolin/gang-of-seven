package com.nyanner.govii.elementary.service.user;

import com.nyanner.govii.elementary.entity.user.SysLoginInfo;
import com.nyanner.govii.elementary.utils.ServletUtils;
import com.nyanner.govii.elementary.utils.ip.AddressUtils;
import com.nyanner.govii.elementary.utils.ip.IpUtils;
import eu.bitwalker.useragentutils.UserAgent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName AsyncService
 * @Description TODO
 * @Author Hangover
 * @Date 2022/3/2 19:44
 **/

@Service
public class AsyncService {
    @Autowired
    SysLoginInfoService sysLoginInfoService;

    /*
    异步记录登录操作
     */
    @Async
    public void asyncRecordLoginInfo(String username, String status, String message, HttpServletRequest request){
        UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
        String ip = IpUtils.getIpAddr(request);
        String address = AddressUtils.getRealAddressByIP(ip);

        //获取客户端操作系统
        String os = userAgent.getOperatingSystem().getName();
        //获取客户端浏览器
        String browser = userAgent.getBrowser().getName();

        SysLoginInfo loginInfo = new SysLoginInfo();
        loginInfo.setUserName(username);
        loginInfo.setIpaddr(ip);
        loginInfo.setLoginLocation(address);
        loginInfo.setBrowser(browser);
        loginInfo.setOs(os);
        loginInfo.setMsg(message);
        loginInfo.setStatus(status);

        sysLoginInfoService.insertLoginInfo(loginInfo);
    }
}






