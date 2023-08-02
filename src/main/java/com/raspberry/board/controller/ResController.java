package com.raspberry.board.controller;

import com.raspberry.board.dto.ResBookDto;
import com.raspberry.board.dto.ResCheckDto;
import com.raspberry.board.dto.ResMemberDto;
import com.raspberry.board.service.ResMemberService;
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

import java.util.List;

@Controller
@Slf4j
public class ResController {
    @Autowired
    private ResMemberService rServ;

    private ModelAndView mv;

    //REST 방식(Ajax)으로 전송할 경우의 메소드
    @GetMapping("rIdCheck")
    @ResponseBody           //REST 방식일 때 꼭 넣을 것.
    public String rIdCheck(String rid){
        log.info("rIdCheck()");
        String res = rServ.rIdCheck(rid);

        return res;
    }

    @PostMapping("resJoinProc")
    public String resJoinProc(ResMemberDto rmember, RedirectAttributes rttr){
        log.info("resJoinProc()");
        String view = rServ.resJoin(rmember, rttr);

        return view;
    }

    @GetMapping("resLogin")
    public String resLogin(){
        log.info("resLogin()");
        return "resLogin";
    }

    @PostMapping("rLoginProc")
    public String rLoginProc(ResMemberDto rmember,
                             HttpSession session,
                             RedirectAttributes rttr){
        log.info("rLoginProc()");
        String view = rServ.rLoginProc(rmember,session,rttr);
        return view;
    }

    //음식점 아이디, 비번 찾기
    @GetMapping("resFindId")
    public String resFindId(){
        log.info("resFindId()");
        return "resFindId";
    }

    @PostMapping("rFindId")
    public ModelAndView rFindId(String rname, String rphone_num){
        log.info("rFindId()");
        mv = rServ.rFindId3(rname, rphone_num);
        return mv;
    }

    @GetMapping("resFindPwd")
    public String resFindPwd(){
        log.info("resFindPwd()");
        return "resFindPwd";
    }

    @GetMapping("resResetPwd")
    public String resResetPwd(String rid, String rname, String rphone_num, Model model) {
        if (rServ.resResetPwd3(rid, rname, rphone_num)) {
            model.addAttribute("rid", rid);
            return "resResetPwd";
        } else {
            return "redirect:resFindPwd";
        }
    }

    @PostMapping("resRePw")
    public String resRePw(String rpwd, String rid){
        log.info("resRePw");
        String view = rServ.resRePw(rpwd, rid);

        return view;
    }

    //식당 마이페이지
    @GetMapping("resInfo")
    public String resInfo(){
        log.info("resInfo()");
        return "resInfo";
    }

    //식당 회원 정보 수정 페이지 이동
    @GetMapping ("resInfoUpdate")
    public ModelAndView resInfoUpdate(String rid){
        log.info("resInfoUpdate()");
        mv = rServ.resInfoUpdate(rid);
        return mv;
    }

    //식당 회원 정보 수정
    @PostMapping("rInfoFix")
    public String rInfoFix(ResMemberDto rmember, HttpSession session,
                           RedirectAttributes rttr){
        log.info("rInfoFix()");
        String view = rServ.rInfoUpdate(rmember, session, rttr);
        return view;
    }

    //식당 회원 탈퇴
    @GetMapping("rWithd")
    public String rWithd(String rid){
        log.info("rWithd()");
        String view = rServ.rWithdProc(rid);
        return view;
    }

    //음식점 목록 이동(음식점 회원이 회원가입하면 회원가입때 입력한 음식점정보가 resList에 출력 )
    @GetMapping("resList")
    public String resList(Model model) {
        log.info("resList()");
        List<ResMemberDto> rList = rServ.getRegisteredRes();
        model.addAttribute("rList", rList);
        return "resList";
    }

    //예약 페이지 이동
    @GetMapping("resBook")
    public String resBook(String rid, Model model){
        log.info("resBook");
        model.addAttribute("r_rid", rid);
        return "resBook";
    }

    //예약 정보를 처리하는 메소드
    @PostMapping("rBookProc")
    public String rBookProc(ResBookDto resBookDto) {
        rServ.addResBookInfo(resBookDto);
        return "redirect:/resList";
    }

    //음식점 인터페이스에서보이는 예약자 목록페이지 이동
    @GetMapping("resBookList")
    public String resBookList(Model model, HttpSession session){
        String rid = (String) session.getAttribute("rid");
        List<ResBookDto> rbList = rServ.getResBookInfo(rid);
        model.addAttribute("rbList",rbList);
        log.info("resBookList()");
        return "resBookList";
    }

    ////////////////////////사용자 음식점 예약 목록/////////////////////////////
    @GetMapping("resCheck")
    public String resCheck(Model model, HttpSession session){
        String uid = (String) session.getAttribute("uid");
        List<ResCheckDto> rcList = rServ.checkResBookInfo(uid);
        model.addAttribute("rcList", rcList);
        log.info("resCheck()");
        return "resCheck";
    }

    //음식점 예약 취소
    @GetMapping("rCancel")
    public String rCancel(Integer rbook_num,RedirectAttributes rttr){
        log.info("rCancel()");
        return rServ.resCancel(rbook_num, rttr);
    }

    //음식점 예약손님 거절
    @GetMapping("rRefuse")
    public String rRefuse(Integer rbook_num, RedirectAttributes rttr){
        log.info("rRefuse()");
        return rServ.resRefuse(rbook_num, rttr);
    }
}
