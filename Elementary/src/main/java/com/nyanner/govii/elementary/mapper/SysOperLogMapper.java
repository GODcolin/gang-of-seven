package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.user.SysOperLog;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/*
操作日志
 */
@Mapper
public interface SysOperLogMapper {
    /*
        新增操作日志
     */

    void insertOperlog(SysOperLog operLog);


    List<SysOperLog> selectOperLogList(SysOperLog operLog);

    /*
    批量删除系统操作日志
     */
    int deleteOperLogByIds(Long[] operIds);

    /*
    查询操作日志详细信息
     */
    SysOperLog selectOperLogById(Long operId);

    void cleanOperLog();
}









