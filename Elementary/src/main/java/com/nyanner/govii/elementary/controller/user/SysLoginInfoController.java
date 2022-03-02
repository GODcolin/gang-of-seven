package com.nyanner.govii.elementary.controller.user;

import com.nyanner.govii.elementary.entity.user.SysLoginInfo;
import com.nyanner.govii.elementary.service.user.SysLoginInfoService;
import com.nyanner.govii.elementary.vo.RestResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/monitor/logInfo")
public class SysLoginInfoController {

    @Autowired
    private SysLoginInfoService sysLoginInfoService;

    //分页获取登录日志列表
    @GetMapping("/list")
    public RestResponse list(SysLoginInfo sysLoginInfo) {
//        if(sysLoginInfo.getLimit()!=null && sysLoginInfo.getPage()!=null){
//            return RestResponse.ok(sysLoginInfoService.getList(sysLoginInfo));
//        }
        if (sysLoginInfo.getLimit() == null) {
            sysLoginInfo.setLimit(10);
        }
        if (sysLoginInfo.getPage() == null) {
            sysLoginInfo.setPage(1);
        }
        return RestResponse.ok(sysLoginInfoService.getList(sysLoginInfo));
    }

//    @GetMapping("/list")
//    public RestResponse list(@RequestParam(value = "ipaddr", defaultValue = "")  String ipaddr,
//                             @RequestParam(value = "userName", defaultValue = "")  String userName,
//                             @RequestParam(value = "status", defaultValue = "")  String status,
//                             @RequestParam(value = "beginTime", defaultValue = "")  String beginTime,
//                             @RequestParam(value = "endTime", defaultValue = "")  String endTime,
//                             @RequestParam(value = "page", defaultValue = "1") Integer page,
//                             @RequestParam(value = "limit", defaultValue = "10") Integer limit){
//        SysLoginInfo sysLoginInfo = new SysLoginInfo();
//        sysLoginInfo.setIpaddr(ipaddr);
//        sysLoginInfo.setUserName(userName);
//        sysLoginInfo.setStatus(status);
//        return RestResponse.ok(sysLoginInfoService.getList(sysLoginInfo,page,limit));
//    }
}

































