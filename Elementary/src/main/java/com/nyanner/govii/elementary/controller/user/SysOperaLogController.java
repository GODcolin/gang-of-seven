package com.nyanner.govii.elementary.controller.user;

import com.nyanner.govii.elementary.entity.user.SysOperLog;
import com.nyanner.govii.elementary.service.user.SysOperaLogService;
import com.nyanner.govii.elementary.vo.RestResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/monitor")
public class SysOperaLogController {

    @Autowired
    private SysOperaLogService sysOperaLogService;

    @GetMapping("/operaLog")
    public RestResponse list(SysOperLog sysOperLog) {
        if (sysOperLog.getLimit() == null) {
            sysOperLog.setLimit(10);
        }
        if (sysOperLog.getPage() == null) {
            sysOperLog.setPage(1);
        }
        return RestResponse.ok(sysOperaLogService.getList(sysOperLog));
    }

//    //分页获取操作日志列表
//    @GetMapping("/operaLog")
//    public RestResponse list(@RequestParam(value = "title", defaultValue = "")  String title,
//                             @RequestParam(value = "operName", defaultValue = "")  String operName,
//                             @RequestParam(value = "requestMethod", defaultValue = "")  String requestMethod,
//                             @RequestParam(value = "status", defaultValue = "")  Integer status,
//                             @RequestParam(value = "beginTime", defaultValue = "")  String beginTime,
//                             @RequestParam(value = "endTime", defaultValue = "")  String endTime,
//                             @RequestParam(value = "page", defaultValue = "1") Integer page,
//                             @RequestParam(value = "limit", defaultValue = "10") Integer limit){
//        SysOperLog sysOperLog = new SysOperLog();
//        sysOperLog.setTitle(title);
//        sysOperLog.setOperName(operName);
//        sysOperLog.setRequestMethod(requestMethod);
//        sysOperLog.setStatus(status);
//        return RestResponse.ok(sysOperaLogService.getList(sysOperLog,page,limit));
//    }

}