package com.raspberry.board.controller;

import com.raspberry.board.dto.*;
import com.raspberry.board.service.TaxMemberService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
public class TaxController {
    @Autowired
    private TaxMemberService tServ;

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

    //addTaxBookInfo로 메소드 이름 정할거임

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

    @PostMapping("updateStatus")
    @ResponseBody
    public String updateStatus(@RequestParam("tid") String tid) {
        // Service를 호출하여 해당 tid를 가진 택시 회원 정보의 status를 업데이트합니다.
        tServ.updateStatus(tid);
        return "success";
    }

    @PostMapping("resetStatus")
    @ResponseBody
    public String resetStatus(@RequestParam("tid") String tid){
        tServ.resetStatus(tid);
        tServ.delTBookInfo(tid);
        return "homeBus";
    }

    @GetMapping("checkTaxBook")
    @ResponseBody
    public int checkTaxBook(@RequestParam("uid") String uid){
        int count = tServ.taxBookCount(uid);
        return count;
    }

}

