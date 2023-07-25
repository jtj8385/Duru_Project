package com.raspberry.board.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardDto {
    private int b_no;
    private String b_title;
    private String b_contents;
    private String b_uid;
    private Timestamp b_date;
}
