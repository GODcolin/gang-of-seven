package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.user.SysOperLog;
import com.nyanner.govii.elementary.mapper.SysOperLogMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class SysOperLogMapperTest {
    @Autowired
    SysOperLogMapper sysOperLogMapper;


    @Test
    void insertOperLog() {
        SysOperLog sysOperLog = new SysOperLog();
        sysOperLog.setTitle("日志模块");
        sysOperLog.setOperName("ahsduha");
        sysOperLog.setOperLocation("安徽合肥");
        sysOperLogMapper.insertOperlog(sysOperLog);

    }

    @Test
    void selectOperLogListTest() {
        List<SysOperLog> sysOperLogs = sysOperLogMapper.selectOperLogList(new SysOperLog());
        sysOperLogs.forEach(e -> log.info("查询操作日志信息{}", e));
    }


}
