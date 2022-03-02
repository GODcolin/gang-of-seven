package com.nyanner.govii.elementary.model.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class KnowledgeParams{

    private String title;

    private String keyWords;

    private String category;

    private String author;

    private Integer limit;

    private Integer page;


    private Date beginTime;

    private Date endTime;
}
