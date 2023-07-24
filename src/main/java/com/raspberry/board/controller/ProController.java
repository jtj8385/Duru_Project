package com.raspberry.board.controller;

import com.raspberry.board.dto.ProMemberDto;
import com.raspberry.board.service.ProMemberService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Slf4j
public class ProController {
    @Autowired
    private ProMemberService pServ;

    private ModelAndView mv;

    //프로그램 로그인 페이지 이동
    @GetMapping("proLogin")
    public String proLogin(){
        log.info("proLogin()");
        return "proLogin";
    }

    //프로그램 로그인
    @PostMapping("pLoginProc")
    public String pLoginProc(ProMemberDto pmember,
                             HttpSession session,
                             RedirectAttributes rttr){
        log.info("pLoginProc()");
        String view = pServ.pLoginProc(pmember,session,rttr);
        return view;
    }

    //프로그램 아이디 중복 체크
    //REST 방식(Ajax)으로 전송할 경우의 메소드
    @GetMapping("pIdCheck")
    @ResponseBody           //REST 방식일 때 꼭 넣을 것.
    public String pIdCheck(String pid){
        log.info("pIdCheck()");
        String res = pServ.pIdCheck(pid);

        return res;
    }

    //프로그램 회원가입
    @PostMapping ("proJoinProc")
    public String proJoinProc(ProMemberDto pmember, RedirectAttributes rttr){
        log.info("proJoinProc()");
        String view = pServ.proJoin(pmember, rttr);

        return view;
    }

    //프로그램 아이디 찾기 페이지 이동
    @GetMapping("proFindId")
    public String proFindId(){
        log.info("proFindId()");
        return "proFindId";
    }

    //프로그램 아이디 찾기
    @PostMapping("pFindId")
    public ModelAndView pFindId(String pcenter_name, String pcenter_num){
        log.info("pFindId()");
        mv = pServ.pFindId3(pcenter_name, pcenter_num);
        return mv;
    }

    //프로그램 비밀번호 찾기 페이지 이동
    @GetMapping("proFindPwd")
    public String proFindPwd(){
        log.info("proFindPwd()");
        return "proFindPwd";
    }

    //프로그램 비밀번호 찾기
    @GetMapping("proResetPwd")
    public String proResetPwd(String pid, String pcenter_name, String pcenter_num, Model model) {
        if (pServ.proResetPwd3(pid, pcenter_name, pcenter_num)) {
            model.addAttribute("pid", pid);
            return "proResetPwd";
        } else {
            return "redirect:proFindPwd";
        }
    }

    //프로그램 비밀번호 재설정
    @PostMapping("proRePw")
    public String proRePw(String ppwd, String pid){
        log.info("proRePw");
        String view = pServ.proRePw(ppwd, pid);

        return view;
    }

    //프로그램 마이페이지
    @GetMapping("proInfo")
    public String proInfo(){
        log.info("proInfo()");
        return "proInfo";
    }

    //프로그램 회원 마이페이지 정보 수정 페이지 이동
    @GetMapping ("proInfoUpdate")
    public ModelAndView proInfoUpdate(String pid){
        log.info("proInfoUpdate()");
        mv = pServ.proInfoUpdate(pid);
        return mv;
    }

    //프로그램 회원 마이페이지 정보 수정
    @PostMapping("pInfoFix")
    public String pInfoFix(ProMemberDto pmember, HttpSession session,
                           RedirectAttributes rttr){
        log.info("pInfoFix()");
        String view = pServ.pInfoUpdate(pmember, session, rttr);
        return view;
    }

    //프로그램 회원 탈퇴
    @GetMapping("pWithd")
    public String pWithd(String pid){
        log.info("pWithd()");
        String view = pServ.pWithdProc(pid);
        return view;
    }
}
