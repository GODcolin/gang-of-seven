package com.nyanner.govii.elementary.entity.user;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.util.Date;

//系统访问记录表
@EqualsAndHashCode(callSuper = true)
@Data
public class SysLoginInfo extends BaseEntity {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    private Long infoId;

    /**
     * 用户账号
     */
    private String userName;

    /**
     * 登录状态 0成功 1失败
     */
    private String status;

    /**
     * 登录IP地址
     */
    private String ipaddr;

    /**
     * 登录地点
     */
    private String loginLocation;

    /**
     * 浏览器类型
     */
    private String browser;

    /**
     * 操作系统
     */
    private String os;

    /**
     * 提示消息
     */
    private String msg;

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date loginTime;

    private Integer limit;

    private Integer page;


}
