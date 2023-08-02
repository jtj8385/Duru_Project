package com.raspberry.board.service;

import com.raspberry.board.dao.MemberDao;
import com.raspberry.board.dao.ResMemberDao;
import com.raspberry.board.dto.MemberDto;
import com.raspberry.board.dto.ResBookDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Service
@Slf4j
public class MemberService {
    @Autowired
    private MemberDao mDao;
    @Autowired
    private ResMemberDao rDao;

    private ModelAndView mv;
    //비밀번호 암호화를 위한 인코더 객체
    private BCryptPasswordEncoder pEncoder = new BCryptPasswordEncoder();

    //아이디 중복 확인 메소드
    public String mIdCheck(String uid){
        //리턴 타입과 같은 변수를 먼저 선언할 것.
        String res = null;

        //아이디가 중복이면 1, 아니면 0
        int cnt = mDao.mIdCheck(uid);

        if(cnt == 0){
            res = "ok";
        } else {
            res = "fail";
        }

        return res;
    }


    public String userJoin(MemberDto member, RedirectAttributes rttr) {
        log.info("userJoin()");
        String view = null;
        String msg = null;

        //비밀번호 암호화 처리
        String encpwd = pEncoder.encode(member.getUpwd());
        log.info(encpwd);
        //평문인 비밀번호를 암호문으로 덮어씀.
        member.setUpwd(encpwd);

        try{
            mDao.mJoin(member);
            view = "redirect:/";
            msg = "회원가입이 완료되었습니다.";

            log.info("회원가입 완료");
        } catch (Exception e){
            e.printStackTrace();
            view = "redirect:userJoin";
            msg = "회원가입에 실패하였습니다.";
        }
        rttr.addFlashAttribute("msg", msg);

        return view;
    }

    public String mLoginProc(MemberDto member, HttpSession session,
                             RedirectAttributes rttr){
        log.info("mLoginProc()");
        String view = null;
        String msg = null;
        //DB에서 회원의 비밀번호 구하기(암호문)
        String encPwd = mDao.selectPass(member.getUid());
        //encPwd에 담겨있을 수 있는 데이터
        // 1) null : 비회원인 경우
        // 2) 암호화된 비밀번호 문자열 : 회원인 경우
        if (encPwd != null) {
            // 아이디는 맞음(회원의 아이디)
            if (pEncoder.matches(member.getUpwd(), encPwd)) {
                // 비밀번호가 맞는 경우
                // 세션에 로그인 성공 정보(접속자 정보) 저장
                session.setAttribute("uid", member.getUid());

                member = mDao.selectMember(member.getUid());
                //세션에 Dto저장
                session.setAttribute("mb", member);

                // 로그인 성공 후 로그인 후 목록으로 이동
                return "redirect:/homeAfter";
            } else {
                // 비밀번호가 틀린 경우
                rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
                return "redirect:/userLogin";
            }
        } else {
            // 아이디 없음(비회원)
            rttr.addFlashAttribute("msg", "아이디가 존재하지 않습니다.");
            return "redirect:/userLogin";
        }
    }


    public String logout(HttpSession session) {
        log.info("logout()");
        session.invalidate();
        return "redirect:/";//첫페이지로 이동
    }

    //사용자 정보 가져오기
    public ModelAndView getMember(String uid){
        log.info("getMember()");
        mv = new ModelAndView();

        MemberDto mb = mDao.selectMember(uid);

        mv.addObject("mb", mb);

        mv.setViewName("userInfo");

        return mv;
    }

    //사용자 아이디 찾기
    public ModelAndView mFindId3(String uname, String uphone_num) {
        log.info("mFindId3()");
        mv = new ModelAndView();
        String id = mDao.mFindId2(uname, uphone_num);
        mv.addObject("id", id);
        mv.setViewName("findId");
        return mv;
    }

    public boolean resetPwd3(String uid, String uname, String uphone_num) {
        // uname과 uphone_num을 DB에서 확인하고 일치 여부를 반환하는 로직 구현
        if (mDao.resetPwd2(uid, uname, uphone_num)){
            return true;
        } else {
            return false;
        }
    }

    public String mRePw(String upwd, String uid) {
        log.info("mRePw()");
        String encpwd = pEncoder.encode(upwd);
        mDao.memberPwUpdate(encpwd, uid);
        return "userLogin";
    }

    public ModelAndView userUpdate(String uid) {
        log.info("userUpdate()");
        MemberDto mb = mDao.selectMember(uid);

        mv = new ModelAndView();
        mv.addObject("mb", mb);

        mv.setViewName("userUpdate");
        return mv;
    }

    public String mInfoUpdate(MemberDto member, HttpSession session, RedirectAttributes rttr) {
        log.info("mInfoUpdate()");
        String msg = null;
        mDao.mInfoUpdate2(member);
        member = mDao.selectMember(member.getUid());
        session.setAttribute("mb", member);
        msg = "회원 정보가 수정되었습니다.";
        rttr.addFlashAttribute("msg", msg);
        log.info("수정 완료");
        return "redirect:userInfo";
    }

    //회원 탈퇴
    public String mWithdProc(String uid,RedirectAttributes rttr) {
        log.info("mWithdProc()");
        String view = null;
        try{
            mDao.mDelete(uid);
            view = "home";
        }catch (Exception e){
            e.printStackTrace();
            view = "redirect:homeAfter?uid=" + uid;
        }
        return view;
    }
}
