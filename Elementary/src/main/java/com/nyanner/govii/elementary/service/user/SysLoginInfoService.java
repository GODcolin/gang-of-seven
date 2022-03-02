package com.nyanner.govii.elementary.service.user;

import com.nyanner.govii.elementary.entity.user.SysLoginInfo;
import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.mapper.SysLoginInfoMapper;
import com.nyanner.govii.elementary.utils.PageUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class SysLoginInfoService {

    private SysLoginInfoMapper loginInfoMapper;

    public void insertLoginInfo(SysLoginInfo loginInfo) {
        loginInfoMapper.insertLoginInfo(loginInfo);
    }

//    public PageMode<SysLoginInfo> getList(SysLoginInfo loginInfo,Integer page,Integer limit){
//        return PageUtil.query(page, limit, () -> loginInfoMapper.selectLoginInfo(loginInfo));
//    }

    public PageMode<SysLoginInfo> getList(SysLoginInfo loginInfo) {
        return PageUtil.query(loginInfo.getPage(), loginInfo.getLimit(), () -> loginInfoMapper.selectLoginInfo(loginInfo));
    }


    public PageMode<SysLoginInfo> selectLoginInfo(SysLoginInfo loginInfo) {
        return PageUtil.query(loginInfo.getPage(), loginInfo.getLimit(), () -> loginInfoMapper.selectLoginInfo(loginInfo));
    }


}















