package com.nyanner.govii.elementary.model.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

//个人发起工单
@Data
public class IndividualTicket {

    private Long id;

    private String title;

    private String content;

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date createTime;

    private String status;      //工单状态

}










