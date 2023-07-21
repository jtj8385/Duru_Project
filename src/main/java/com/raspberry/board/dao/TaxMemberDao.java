package com.raspberry.board.dao;

import com.raspberry.board.dto.TaxBookDto;
import com.raspberry.board.dto.TaxMemberDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TaxMemberDao {
    //택시 아이디 체크 메소드
    int tIdCheck(String tid);

    //택시 회원가입 메소드
    void tJoin(TaxMemberDto tmember);

    //택시 회원의 비밀번호 검색 메소드
    String selectPass(String tid);

    //택시 사업자의의 정보를 가져오는 메소드
    TaxMemberDto selectMember(String tid);

    //택시 목록 가져옴
    List<TaxMemberDto> getTaxInfo(String tcar_kind);

    //택시 호출정보 메소드
    void addTaxBookInfo(TaxBookDto td);

    //사용자 기준 예약 정보
    TaxBookDto getTaxBookInfo(String uid);

    //사업자 기준 예약 정보
    TaxBookDto getTaxBook(String tid);

    //택시 사업자의 아이디를 가져오는 메소드
    String tFindId2(String tname, String tphone_num);

    //택시 사업자 비밀번호 찾기 메소드
    boolean taxResetPwd2(String tid, String tname, String tphone_num);

    //택시 사업자 비밀번호 재설정 메소드
    void taxMemberPwUpdate(String tpwd, String tid);

    //택시 상태 "1"(배차완료) 상태로 변환하는 메소드
    void updateStatus(String tid);

    //택시 상태 "0"(배차대기) 상태로 변환하는 메소드
    void resetStatus(String tid);

    //택시 운행완료후 택시 예약 정보 삭제
    void delTBookInfo(String tid);

    int taxBookCount(String uid);
}
