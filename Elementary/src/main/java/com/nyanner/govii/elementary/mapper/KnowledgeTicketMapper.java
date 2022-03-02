package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeTicket;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface KnowledgeTicketMapper {

    /**
     * @param knowledgeTicket
     * @return
     * @Description 添加一条知识工单关联记录
     **/
    int addKnowledgeTicket(KnowledgeTicket knowledgeTicket);
}
