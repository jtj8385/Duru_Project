package com.raspberry.board.dao;

import com.raspberry.board.dto.ProBookDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProBookDao {
    void addProBookInfo(ProBookDto proBookDto);
    // 프로그램 저장 메소드 선언
    void insertProBook(ProBookDto proBookDto);

    List<ProBookDto> selectProBookList(String uid);
    // 프로그램 예약 정보 목록을 가져오는 메소드 선언

    //프로그램 신청 취소 메소드 선언
    void deleteProBook(String uid);
}
