package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.Ticket;
import com.nyanner.govii.elementary.model.bean.IndividualTicket;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TicketMapper {

    /**
     * @param ticket
     * @return
     * @Description 添加工单
     **/
    int addTicket(Ticket ticket);

    /**
     * @param
     * @return
     * @Description status为0，工单审核员查询待审核的工单
     * status为1，审核不通过
     * status为2，知识采编人员看到审核通过后的工单，可接单
     * status为3，已接单
     **/
    List<Ticket> selectTicketByStatus(String status);


    /**
     * @param ticket
     * @return
     * @Description 审核工单时，会执行该方法,
     * 要求传入status、reason、auditor_id、id
     * 审核工单后会更改状态
     **/
    int updateTicketWhenAudit(Ticket ticket);

    /**
     * @return
     * @Description 用户在工单列表接单后，会执行该方法
     * 要求传入status、receiver_id、id
     * 审核工单后会更改状态
     **/
    int updateTicketWhenReceive(Ticket ticket);

    /**
     * @param ticketId
     * @return
     * @Description 当完成工单时，执行该方法
     * id,
     **/
    int updateTicketWhenFinish(Long ticketId);


    /**
     * @param ticketId
     * @return
     * @Description 当关闭工单时，执行该方法
     **/
    int updateTicketWhenClose(Long ticketId);


    /**
     * @param userId
     * @return
     * @Description 根据用户id查询该用户的接单
     **/
    List<Ticket> selectTicketByUserId(Long userId);


    /**
     * @param
     * @return
     * @Description 查询工单完成审核界面
     * 审核员检查接单者是否完成工单，会调用该方法
     **/
    List<Ticket> selectTicketWhenFinishAudit();

    /**
     * @param
     * @return
     * @Description 审核员审核工单是否完成不通过时，调用该方法
     * 需要参数 工单id , notFinishReason
     **/
    int updateTicketNotPassFinish(Ticket ticket);


    /**
     * @param userId
     * @return
     * @Description 根据用户id查询，该用户创建的工单
     **/
    List<IndividualTicket> selectCreatedTicketByUserId(Long userId);


    /**
     * @param ticketId
     * @param status
     * @return
     * @Description 根据工单id修改工单的状态
     **/
    int updateTicketStatusById(Long ticketId, String status);
}
