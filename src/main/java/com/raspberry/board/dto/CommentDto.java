package com.raspberry.board.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommentDto {
    private int c_no;//기본키(댓글번호)
    private int c_bno;//외래키(게시글번호)
    private String c_contents;
    private String c_id;//작성자 id

    @JsonFormat(pattern = "yyyy-MM-dd",
            timezone = "Asia/Seoul")
    private Timestamp c_date;
}
