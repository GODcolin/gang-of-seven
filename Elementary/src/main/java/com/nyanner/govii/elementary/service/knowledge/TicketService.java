package com.nyanner.govii.elementary.service.knowledge;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeTicket;
import com.nyanner.govii.elementary.entity.knowledge.Ticket;
import com.nyanner.govii.elementary.model.bean.IndividualTicket;
import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.mapper.KnowledgeMapper;
import com.nyanner.govii.elementary.mapper.KnowledgeTicketMapper;
import com.nyanner.govii.elementary.mapper.TicketMapper;
import com.nyanner.govii.elementary.utils.PageUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.nyanner.govii.elementary.common.TicketStatusCode.*;

@Service
@AllArgsConstructor
public class TicketService {

    private TicketMapper ticketMapper;
    private SecurityAuditorAware securityAuditorAware;
    private KnowledgeTicketMapper knowledgeTicketMapper;
    private KnowledgeMapper knowledgeMapper;

    public PageMode<Ticket> selectTicket(Integer limit, Integer page) {
        return PageUtil.query(page, limit,
            () -> ticketMapper.selectTicketByUserId(securityAuditorAware.getCurrentAuditor().orElseThrow()));
    }

    public void addTicket(Ticket ticket) {
        ticket.setCreatorId(securityAuditorAware.getCurrentAuditor().orElseThrow());
        ticket.setStatus(AUDITING_TICKETS);
        ticketMapper.addTicket(ticket);
    }

    public PageMode<Ticket> selectTicketByStatus(String status, Integer page, Integer limit) {
        return PageUtil.query(page, limit, () -> ticketMapper.selectTicketByStatus(status));
    }

    public PageMode<Ticket> selectTicketWhenFinishAudit( Integer page, Integer limit) {
        return PageUtil.query(page, limit, () -> ticketMapper.selectTicketWhenFinishAudit());
    }


    public void updateTicketWhenAudit(Ticket ticket) {
        ticket.setAuditorId(securityAuditorAware.getCurrentAuditor().orElseThrow());
        if (ticket.getFlag() == 0) {
            ticket.setStatus(FAIL_TICKETS);
        } else if (ticket.getFlag() == 1) {
            ticket.setStatus(AUDIT_PASS_TICKETS);
        }
        ticketMapper.updateTicketWhenAudit(ticket);
    }

    public void updateTicketWhenReceive(Ticket ticket) {
        ticket.setReceiverId(securityAuditorAware.getCurrentAuditor().orElseThrow());
        ticket.setStatus(RECEIVED_TICKETS);
        ticketMapper.updateTicketWhenReceive(ticket);
    }

    public void updateTicketWhenFinish(KnowledgeTicket knowledgeTicket) {
        knowledgeTicketMapper.addKnowledgeTicket(knowledgeTicket);
        ticketMapper.updateTicketWhenFinish(knowledgeTicket.getTicketId());
    }

    public void closeTicket(Ticket ticket) {
        if (ticket.getFlag() == 1) {
            ticketMapper.updateTicketWhenClose(ticket.getId());
        } else if (ticket.getFlag() == 0) {
            ticketMapper.updateTicketNotPassFinish(ticket);
        }
    }

    public List<IndividualTicket> selectCreatedTicketByUserId() {
        return ticketMapper.selectCreatedTicketByUserId(securityAuditorAware.getCurrentAuditor().orElseThrow());
    }


}
