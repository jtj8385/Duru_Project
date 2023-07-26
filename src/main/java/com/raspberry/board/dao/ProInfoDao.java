package com.raspberry.board.dao;

import com.raspberry.board.dto.ProInfoDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProInfoDao {
    // 사업자용 프로그램 목록을 가져오는 메소드 선언
    List<ProInfoDto> selectProListBus(String pid);

    // 프로그램 저장 메소드 선언
    void insertPro(ProInfoDto proinfo);

    //프로그램 삭제 메소드 선언
    void deletePro(Integer p_no);

    //프로그램 수정 메소드 선언
    void updatePro(ProInfoDto proinfo);

    //작성된 프로그램 1개를 가져오는 메소드 선언
    ProInfoDto selectPro(Integer p_no);

    //프로그램 목록 가져오는 메소드 선언
    List<ProInfoDto> selectProList();

    // 사업자용 프로그램 예약 목록 정보를 가져오는 메소드 선언
    List<ProInfoDto> selectBookProList(String p_pid);
}
