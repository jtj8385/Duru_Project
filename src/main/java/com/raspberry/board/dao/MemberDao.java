package com.raspberry.board.dao;

import com.raspberry.board.dto.MemberDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {
    //아이디 체크 메소드
    int mIdCheck(String uid);

    //회원가입 메소드
    void mJoin(MemberDto member);

    //사용자 비밀번호 검색 메소드
    String selectPass(String uid);

    //사용자의 정보를 가져오는 메소드
    MemberDto selectMember(String uid);

    //사용자 아이디 검색 메소드
    String mFindId2(String uname, String uphone_num);

    //사용자 비밀번호 검색 메소드
    boolean resetPwd2(String uid, String uname, String uphone_num);

    //사용자의 비밀번호 재설정 메소드
    void memberPwUpdate(String upwd, String uid);

    //사용자의 정보를 수정하는 메소드
    void mInfoUpdate2(MemberDto member);

    //회원 정보를 삭제하는 메소드
    void mDelete(String uid);
}
