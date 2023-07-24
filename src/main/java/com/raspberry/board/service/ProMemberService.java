package com.raspberry.board.service;

import com.raspberry.board.dao.ProMemberDao;
import com.raspberry.board.dto.MemberDto;
import com.raspberry.board.dto.ProMemberDto;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
@Slf4j
public class ProMemberService {
    @Autowired
    private ProMemberDao pDao;

    private ModelAndView mv;
    //비밀번호 암호화를 위한 인코더 객체
    private BCryptPasswordEncoder pEncoder = new BCryptPasswordEncoder();

    //아이디 중복 확인 메소드
    public String pIdCheck(String pid){
        //리턴 타입과 같은 변수를 먼저 선언할 것.
        String res = null;

        //아이디가 중복이면 1, 아니면 0
        int cnt = pDao.pIdCheck(pid);

        if(cnt == 0){
            res = "ok";
        } else {
            res = "fail";
        }
        return res;
    }

    public String proJoin(ProMemberDto pmember, RedirectAttributes rttr) {
        log.info("proJoin()");
        String view = null;
        String msg = null;

        //비밀번호 암호화 처리
        String encpwd = pEncoder.encode(pmember.getPpwd());
        log.info(encpwd);
        //평문인 비밀번호를 암호문으로 덮어씀.
        pmember.setPpwd(encpwd);

        try{
            pDao.pJoin(pmember);
            view = "redirect:/";
            msg = "회원가입이 완료되었습니다.";

            log.info("회원가입 완료");
        } catch (Exception e){
            e.printStackTrace();
            view = "redirect:proJoin";
            msg = "회원가입에 실패하였습니다.";
        }
        rttr.addFlashAttribute("msg", msg);

        return view;
    }

    public String pLoginProc(ProMemberDto pmember, HttpSession session, RedirectAttributes rttr) {
        log.info("pLoginProc()");
        String view = null;
        String msg = null;

        //DB에서 회원의 비밀번호 구하기(암호문)
        String encPwd = pDao.selectPass(pmember.getPid());
        //encPwd에 담겨있을 수 있는 데이터
        // 1) null : 비회원인 경우
        // 2) 암호화된 비밀번호 문자열 : 회원인 경우
        if (encPwd != null) {
            // 아이디는 맞음(회원의 아이디)
            if (pEncoder.matches(pmember.getPpwd(), encPwd)) {
                // 비밀번호가 맞는 경우
                // 세션에 로그인 성공 정보(접속자 정보) 저장
                session.setAttribute("pid", pmember.getPid());

                pmember = pDao.selectMember(pmember.getPid());
                //세션에 Dto저장
                session.setAttribute("pmb", pmember);

                // 로그인 성공 후 로그인 후 목록으로 이동
                return "redirect:/homeBus";
            } else {
                // 비밀번호가 틀린 경우
                rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
                return "redirect:/proLogin";
            }
        } else {
            // 아이디 없음(비회원)
            rttr.addFlashAttribute("msg", "아이디가 존재하지 않습니다.");
            return "redirect:/proLogin";
        }
    }

    public String plogout(HttpSession session) {
        log.info("plogout()");
        session.invalidate();
        return "redirect:/";//첫페이지로 이동
    }

    public ModelAndView pFindId3(String pcenter_name, String pcenter_num) {
        log.info("tFindId3()");
        mv = new ModelAndView();
        String proid = pDao.pFindId2(pcenter_name, pcenter_num);
        mv.addObject("proid", proid);
        mv.setViewName("proFindId");
        return mv;
    }

    public boolean proResetPwd3(String pid, String pcenter_name, String pcenter_num) {
        if (pDao.proResetPwd2(pid, pcenter_name, pcenter_num)){
            return true;
        } else {
            return false;
        }
    }

    public String proRePw(String ppwd, String pid) {
        log.info("proRePw()");
        String encpwd = pEncoder.encode(ppwd);
        pDao.proMemberPwUpdate(encpwd, pid);
        return "proLogin";

    }

    //마이 페이지
    public ModelAndView proInfoUpdate(String pid) {
        log.info("proInfoUpdate()");
        ProMemberDto pmb = pDao.selectMember(pid);

        mv = new ModelAndView();
        mv.addObject("pmb", pmb);

        mv.setViewName("proInfoUpdate");
        return mv;
    }

    public String pInfoUpdate(ProMemberDto pmember, HttpSession session, RedirectAttributes rttr) {
        log.info("pInfoUpdate()");
        String msg = null;
        pDao.pInfoUpdate2(pmember);
        pmember = pDao.selectMember(pmember.getPid());
        session.setAttribute("pmb", pmember);
        msg = "회원 정보가 수정되었습니다.";
        rttr.addFlashAttribute("msg", msg);
        log.info("수정 완료");
        return "redirect:proInfo?pid="+pmember.getPid();
    }
    //회원 탈퇴
    public String pWithdProc(String pid) {
        log.info("pWithdProc()");
        String view = null;
        try{
            pDao.mDelete(pid);
            view = "home";
        }catch (Exception e){
            e.printStackTrace();
            view = "redirect:homeAfter?pid=" + pid;
        }
        return view;
    }
}
