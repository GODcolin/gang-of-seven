package com.nyanner.govii.elementary.entity.knowledge;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.nyanner.govii.elementary.model.bean.Author;
import com.nyanner.govii.elementary.model.bean.DepartIdAndName;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Data
public class Knowledge {
    private Long id;

    @NotBlank
    @NotNull
    @Size(max = 60, message = "标题长度不能超过60")
    private String title;

    private Long authorId;

    private Author user;

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date createTime;

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date lifeTime;  //有效时间

    @NotBlank
    private String content;

    private Category category;

    private Integer viewCounts;

    private String isDelete;//0上1下线

    private String status;//0草稿 1待审核 2发布 3审核不通过

    private Integer likeCounts;

    private Integer dislikeCounts;

    private Integer commentCounts;

    private Integer collectCounts;

    private Long masterId;//同一个系列知识的masterId相同

    private String version;//‘C’当前最新版本，'A'历史版本

    private Source source;

    private List<Tag> tags;

    private List<DepartIdAndName> depts;

    public Knowledge() {

    }

}















