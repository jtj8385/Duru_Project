package com.raspberry.board.controller;

import com.raspberry.board.dto.*;
import com.raspberry.board.service.TaxMemberService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Slf4j
public class TaxController {
    @Autowired
    private TaxMemberService tServ;

    private ModelAndView mv;

    // 택시 아이디 중복체크
    @GetMapping("tIdCheck")
    @ResponseBody           //REST 방식일 때 꼭 넣을 것.
    public String tIdCheck(String tid){
        log.info("tIdCheck()");
        String res = tServ.tIdCheck(tid);

        return res;
    }

    //택시 회원가입
    @PostMapping ("taxJoinProc")
    public String taxJoinProc(TaxMemberDto tmember, RedirectAttributes rttr){
        log.info("taxJoinProc()");
        String view = tServ.taxJoin(tmember, rttr);

        return view;
    }

    //택시 로그인 페이지 이동
    @GetMapping("taxLogin")
    public String taxLogin(){
        log.info("taxLogin()");
        return "taxLogin";
    }

    //택시 로그인
    @PostMapping("tLoginProc")
    public String tLoginProc(TaxMemberDto tmember,
                             HttpSession session,
                             RedirectAttributes rttr){
        log.info("tLoginProc()");
        String view = tServ.tLoginProc(tmember,session, rttr);

        return view;
    }

    //택시 아이디 찾기 페이지 이동
    @GetMapping("taxFindId")
    public String taxFindId(){
        log.info("taxFindId()");
        return "taxFindId";
    }

    //택시 아이디 찾기
    @PostMapping("tFindId")
    public ModelAndView tFindId(String tname, String tphone_num){
        log.info("tFindId()");
        mv = tServ.tFindId3(tname, tphone_num);
        return mv;
    }

    //택시 아이디 비번 찾기 페이지 이동
    @GetMapping("taxFindPwd")
    public String taxFindPwd(){
        log.info("taxFindPwd()");
        return "taxFindPwd";
    }

    //택시 비번 찾기
    @GetMapping("taxResetPwd")
    public String taxResetPwd(String tid, String tname, String tphone_num, Model model) {
        if (tServ.taxResetPwd3(tid, tname, tphone_num)) {
            model.addAttribute("tid", tid);
            return "taxResetPwd";
        } else {
            return "redirect:taxFindPwd";
        }
    }

    //택시 비밀번호 재설정
    @PostMapping("taxRePw")
    public String taxRePw(String tpwd, String tid){
        log.info("taxRePw");
        String view = tServ.taxRePw(tpwd, tid);

        return view;
    }

    //택시 마이페이지 이동
    @GetMapping("taxInfo")
    public String taxInfo(){
        log.info("taxInfo()");
        return "taxInfo";
    }

    //택시 마이페이지 정보 출력
    @GetMapping ("taxInfoUpdate")
    public ModelAndView taxInfoUpdate(String tid){
        log.info("paxInfoUpdate()");
        mv = tServ.taxInfoUpdate(tid);
        return mv;
    }

    //택시 정보 수정
    @PostMapping("tInfoFix")
    public String tInfoFix(TaxMemberDto tmember, HttpSession session,
                           RedirectAttributes rttr){
        log.info("tInfoFix()");
        String view = tServ.tInfoUpdate(tmember, session, rttr);
        return view;
    }

    //택시 회원 탈퇴
    @GetMapping("tWithd")
    public String tWithd(String tid){
        log.info("tWithd()");
        String view = tServ.tWithdProc(tid);
        return view;
    }

    //택시 호출신청페이지 이동
    @GetMapping("taxBook")
    public String taxBook() {
        log.info("taxBook()");
        return "taxBook";
    }

    //택시 호출정보 작성
    @PostMapping("taxChoice")
    public String getTaxInfo(Model model,
                             TaxBookDto taxbook,
                             HttpSession session) {
        log.info("taxChoice()");
        List<TaxMemberDto> tList = tServ.getTaxInfo(taxbook.getTcar_kind());
        model.addAttribute("tList", tList);
        session.setAttribute("taxInfo", taxbook);
        return "taxChoice";
    }

    //택시 호출 메소드
    @GetMapping("tBookProc")
    public String tBookProc(HttpSession session, String tid, Model model) {
        log.info("tBookProc()");
        TaxBookDto td = (TaxBookDto) session.getAttribute("taxInfo");
        td.setTid(tid);
        tServ.addTaxBookInfo(td);
        TaxMemberDto tMember = tServ.getTaxMember(tid);
        model.addAttribute("taxMember", tMember);
        return "taxCheck"; //추후의 예약목록페이지로 이동
    }

    //택시 호출 정보(사용자)
    @GetMapping("taxCheck")
    public String taxCheck(Model model, HttpSession session) {
        log.info("taxCheck()");
        //택시 예약 정보 가져오기
        String uid  = (String) session.getAttribute("uid");
        TaxBookDto taxbook = tServ.getTaxBookInfo(uid);
        //기사 정보
        if(taxbook != null) {
            TaxMemberDto tMember = tServ.getTaxMember(taxbook.getTid());
            model.addAttribute("taxMember", tMember);
        }
        model.addAttribute("taxInfo", taxbook);
        return "taxCheck";
    }

    //택시 호출목록(택시 사업자)
    @GetMapping("taxBookList")
    public String taxBookList(Model model, HttpSession session) {
        log.info("taxBookList()");
        String tid  = (String) session.getAttribute("tid");
        TaxBookDto taxbook = tServ.getTaxBook(tid);
        if(taxbook != null) {
            TaxMemberDto tMember = tServ.getTaxMember(taxbook.getTid());
            model.addAttribute("taxMember", tMember);
        }
        model.addAttribute("taxInfo", taxbook);
        return "taxBookList";
    }

    //택시 상태 "1"(배차 완료)로 업데이트
    @PostMapping("updateStatus")
    @ResponseBody
    public String updateStatus(@RequestParam("tid") String tid) {
        // Service를 호출하여 해당 tid를 가진 택시 회원 정보의 status를 업데이트합니다.
        tServ.updateStatus(tid);
        return "success";
    }

    //택시 상태 "0"(배차 대기)로 업데이트
    @PostMapping("resetStatus")
    @ResponseBody
    public String resetStatus(@RequestParam("tid") String tid){
        tServ.resetStatus(tid);
        tServ.delTBookInfo(tid);
        return "homeBus";
    }

    //택시 호출 여부 체크
    @GetMapping("checkTaxBook")
    @ResponseBody
    public int checkTaxBook(@RequestParam("uid") String uid){
        int count = tServ.taxBookCount(uid);
        return count;
    }

}

