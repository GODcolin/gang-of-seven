package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.user.SysLoginInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/*
系统访问日志情况
 */

@Mapper
public interface SysLoginInfoMapper {

    /*
    新增系统登录记录
     */
    void insertLoginInfo(SysLoginInfo loginInfo);

    /*
    查询系统登录日志记录
     */
    List<SysLoginInfo> selectLoginInfo(SysLoginInfo loginInfo);

}







