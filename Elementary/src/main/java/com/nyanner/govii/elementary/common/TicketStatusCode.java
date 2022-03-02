package com.nyanner.govii.elementary.common;

public class TicketStatusCode {
    /**
     * 待审核工单
     */
    public static final String AUDITING_TICKETS = "0";

    /**
     * 审核不通过的工单
     */
    public static final String FAIL_TICKETS = "1";

    /**
     * 审核通过的工单,可接单
     */
    public static final String AUDIT_PASS_TICKETS = "2";

    /**
     * 采编人员已经接单的工单
     */
    public static final String RECEIVED_TICKETS = "3";

    /**
     * 采编人员已经接单的工单
     */
    public static final String FINISHED_TICKETS = "4";

    /**
     * 采编人员已经接单的工单
     */
    public static final String CLOSED_TICKETS = "5";

}
