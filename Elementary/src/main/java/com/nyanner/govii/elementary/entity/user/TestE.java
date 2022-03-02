package com.nyanner.govii.elementary.entity.user;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class TestE {
    private String name;
    private String phone;
    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date time;
}
