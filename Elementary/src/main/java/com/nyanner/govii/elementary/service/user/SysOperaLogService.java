package com.nyanner.govii.elementary.service.user;

import com.nyanner.govii.elementary.entity.user.SysOperLog;
import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.mapper.SysOperLogMapper;
import com.nyanner.govii.elementary.utils.PageUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class SysOperaLogService {

    private SysOperLogMapper sysOperLogMapper;

    public void insertOperaLog(SysOperLog sysOperLog) {
        sysOperLogMapper.insertOperlog(sysOperLog);
    }

//    public PageMode<SysOperLog> getList(SysOperLog sysOperLog,Integer page,Integer limit){
//        return PageUtil.query(page, limit, () -> sysOperLogMapper.selectOperLogList(sysOperLog));
//    }

    public PageMode<SysOperLog> getList(SysOperLog sysOperLog) {
        return PageUtil.query(sysOperLog.getPage(), sysOperLog.getLimit(), () -> sysOperLogMapper.selectOperLogList(sysOperLog));
    }


}
