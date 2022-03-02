package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.Ticket;
import com.nyanner.govii.elementary.model.bean.IndividualTicket;
import com.nyanner.govii.elementary.mapper.TicketMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class TicketTest {
    @Autowired
    TicketMapper ticketMapper;

    @Test
    public void addTicketTest() {
        Ticket ticket = new Ticket();
        ticket.setCreatorId(3L);
        ticket.setTitle("啊哈");
        ticket.setContent("工单测试内容");

        int i = ticketMapper.addTicket(ticket);
        log.info("测试工单添加{}", i);
    }

    @Test
    public void selectAuditingTicketTest() {
        List<Ticket> tickets = ticketMapper.selectTicketByStatus("2");

        tickets.forEach(e -> log.info("打印工单列表:{}", e));
    }

    @Test
    public void updateTicketStatusByIdTest() {
        int i = ticketMapper.updateTicketStatusById(1L, "2");
        log.info("测试修改工单状态:{}", i);
    }

    @Test
    public void updateTicketWhenAudit() {
        Ticket ticket = new Ticket();
        ticket.setAuditorId(2L);
        ticket.setReason("ahdahsh");
        ticket.setId(4L);
        ticket.setStatus("3");
        int i = ticketMapper.updateTicketWhenAudit(ticket);
        log.info("修改工单内容测试{}", i);
    }

    @Test
    public void updateTicketWhenReceive() {
        Ticket ticket = new Ticket();
        ticket.setReceiverId(6L);
        ticket.setStatus("3");
        ticket.setId(1L);
        int i = ticketMapper.updateTicketWhenReceive(ticket);
        log.info("测试接工单方法:{}", i);
    }


    @Test
    public void updateTicketWhenFinishTest() {
        int i = ticketMapper.updateTicketWhenFinish(4L);
        log.info("测试完成{}", i);
    }

    @Test
    public void updateTicketWhenCloseTest() {
        int i = ticketMapper.updateTicketWhenClose(4L);
        log.info("测试完成{}", i);
    }

    @Test
    public void selectTicketTest() {
        List<Ticket> tickets = ticketMapper.selectTicketByUserId(1L);
        tickets.forEach(e -> log.info("查询用户id为5的接单量{}", e));
    }

    /**
     * @param
     * @return
     * @Description
     **/
    @Test
    public void selectTicketWhenFinishAuditTest() {
        List<Ticket> tickets = ticketMapper.selectTicketWhenFinishAudit();
        tickets.forEach(e -> log.info("审核员检查接单者是否完成工单，会调用该方法{}", e));
    }

    @Test
    public void updateTicketNotPassFinish() {
        Ticket ticket = new Ticket();
        ticket.setId(21L);
        ticket.setNotFinishReason("未完成");
        int i = ticketMapper.updateTicketNotPassFinish(ticket);
        log.info("审核员审核工单是否完成不通过时，调用该方法{}", i);
    }

    @Test
    public void selectCreatedTicketByUserIdTest() {
        List<IndividualTicket> individualTickets = ticketMapper.selectCreatedTicketByUserId(1L);
        individualTickets.forEach(e -> log.info("查询个人创建的工单:{}", e));
    }

}












