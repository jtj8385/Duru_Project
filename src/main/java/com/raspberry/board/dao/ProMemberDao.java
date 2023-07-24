package com.raspberry.board.dao;

import com.raspberry.board.dto.ProMemberDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProMemberDao {
    //프로그램 아이디 체크 메소드
    int pIdCheck(String pid);

    //프로그램 회원가입 메소드
    void pJoin(ProMemberDto pmember);

    //프로그램 회원의 비밀번호 검색 메소드
    String selectPass(String pid);

    //사용자의 정보를 가져오는 메소드
    ProMemberDto selectMember(String pid);

    //프로그램 아이디 찾기 메소드
    String pFindId2(String pcenter_name, String pcenter_num);

    //프로그램 사업자 비밀번호 재설정 메소드
    boolean proResetPwd2(String pid, String pcenter_name, String pcenter_num);

    //프로그램 사업자의 비밀번호 재설정 메소드
    void proMemberPwUpdate(String ppwd, String pid);

    //사용자의 정보를 수정하는 메소드
    void pInfoUpdate2(ProMemberDto pmember);

    //회원 정보를 삭제하는 메소드
    void mDelete(String pid);
}
