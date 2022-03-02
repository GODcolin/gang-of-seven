package com.nyanner.govii.elementary.entity.knowledge;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class History {

    private Long id;

    private Long userId;

    private Long knowledgeId;

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date viewTime;

}
