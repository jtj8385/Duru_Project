package com.raspberry.board.dao;

import com.raspberry.board.dto.ResBookDto;
import com.raspberry.board.dto.ResCheckDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ResBookDao {

    //예약 작성 메소드
    void addResBookInfo(ResBookDto resBookDto);

    //예약자 정보 출력 메소드
    List<ResBookDto> getResBookInfo(String rid);

    //예약 내역 취소메소드(사용자)
    void cancelReservation(Integer rbook_num);

    //예약 거절 메소드(사업자)
    void refuseReservation(Integer rbook_num);
}
