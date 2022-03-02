package com.nyanner.govii.elementary.model.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.nyanner.govii.elementary.entity.knowledge.Tag;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class SearchKnowledge implements Comparable<SearchKnowledge>{
    private Long id;
    private String title;
    private String content;
    private Author author;
    private List<Tag> keyWords;
    @JsonProperty("releaseTime")
    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date createTime;
    @JsonProperty("viewNumber")
    private Integer viewCounts;
    @JsonProperty("likeNumber")
    private Integer likeCounts;
    @JsonProperty("dislikeNumber")
    private Integer dislikeCounts;
    @JsonProperty("commentNumber")
    private Integer commentCounts;
    @JsonProperty("collectNumber")
    private Integer collectCounts;

    @Override
    public int compareTo(SearchKnowledge searchKnowledge) {
        return this.likeCounts.compareTo(searchKnowledge.getLikeCounts());
    }
}
