package com.raspberry.board.controller;

import com.raspberry.board.dao.MemberDao;
import com.raspberry.board.dao.ResBookDao;
import com.raspberry.board.dao.ResMemberDao;
import com.raspberry.board.dao.TaxMemberDao;
import com.raspberry.board.dto.*;
import com.raspberry.board.service.MemberService;
import com.raspberry.board.service.ProMemberService;
import com.raspberry.board.service.ResMemberService;
import com.raspberry.board.service.TaxMemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@Slf4j
public class HomeController {
    @Autowired
    private MemberService mServ;
    @Autowired
    private ResMemberService rServ;
    @Autowired
    private TaxMemberService tServ;
    @Autowired
    private ProMemberService pServ;
    @Autowired
    private ResMemberDao rDao;
    @Autowired
    private TaxMemberDao tDao;
    @Autowired
    private MemberDao mDao;

    private ModelAndView mv;


    @GetMapping("/")
    public String home(){
        log.info("home()");
        return "home";
    }

//    @GetMapping("homeAfter")
//    public String homeAfter(){
//        log.info("homeAfter()");
//        return "homeAfter";
//    }

    //사용자 로그인후 아이디 전달
    @GetMapping("homeAfter")
    public String homeAfter(HttpSession session, Model model) {
        log.info("homeAfter");

        // 세션에서 회원 아이디 값을 가져옵니다.
        String uid = (String) session.getAttribute("uid");
        log.info(uid);
        // Model에 회원 아이디 값을 저장하여 View로 전달합니다.
        MemberDto member = new MemberDto();
        member.setUid(uid);
        model.addAttribute("member", member);

        return "homeAfter";
    }

    //사업자 로그인후 아이디 전달
    @GetMapping("homeBus")
    public String homeBus(HttpSession session, Model model) {
        log.info("homeBus");

        // 세션에서 음식점 사업자 아이디 값을 가져옵니다.
        String rid = (String) session.getAttribute("rid");
        log.info(rid);
        // Model에 회원 아이디 값을 저장하여 View로 전달합니다.
        ResMemberDto rmember = new ResMemberDto();
        rmember.setRid(rid);
        model.addAttribute("rmember", rmember);

        // 세션에서 택시 사업자 아이디 값을 가져옵니다.
        String tid = (String) session.getAttribute("tid");
        log.info(tid);
        // Model에 회원 아이디 값을 저장하여 View로 전달합니다.
        TaxMemberDto tmember = new TaxMemberDto();
        tmember.setTid(tid);
        model.addAttribute("tmember", tmember);

        // 세션에서 프로그램 사업자 아이디 값을 가져옵니다.
        String pid = (String) session.getAttribute("pid");
        log.info(pid);
        // Model에 회원 아이디 값을 저장하여 View로 전달합니다.
        ProMemberDto pmember = new ProMemberDto();
        pmember.setPid(pid);
        model.addAttribute("pmember", pmember);

        return "homeBus";
    }

    @GetMapping("map")
    public String map(){
        log.info("map");
        return "map";
    }

    @GetMapping("introduce")
    public String introduce(){
        log.info("introduce()");
        return "introduce";
    }

    //회원가입 유형 선택
    @GetMapping("joinSelect")
    public String joinSelect(){
        log.info("joinSelect()");
        return "joinSelect";
    }

    //로그인 유형 선택
    @GetMapping("loginSelect")
    public String loginSelect(){
        log.info("loginSelect()");
        return "loginSelect";
    }

    //사용자 회원가입 페이지 이동
    @GetMapping("userJoin")
    public String userJoin(){
        log.info("userJoin()");
        return "userJoin";
    }
    //음식점 사업자 회원가입 페이지 이동
    @GetMapping("resJoin")
    public String resJoin(){
        log.info("resJoin()");
        return "resJoin";
    }
    //음식점 사업자 회원가입 페이지 이동
    @GetMapping("taxJoin")
    public String taxJoin(){
        log.info("taxJoin()");
        return "taxJoin";
    }
    //프로그램 사업자 회원가입 페이지 이동
    @GetMapping("proJoin")
    public String proJoin(){
        log.info("proJoin()");
        return "proJoin";
    }

    ///////////사용자////////////
    //REST 방식(Ajax)으로 전송할 경우의 메소드
    @GetMapping("mIdCheck")
    @ResponseBody           //REST 방식일 때 꼭 넣을 것.
    public String mIdCheck(String uid){
        log.info("mIdCheck()");
        String res = mServ.mIdCheck(uid);

        return res;
    }

    @PostMapping ("userJoinProc")
    public String userJoinProc(MemberDto member, RedirectAttributes rttr){
        log.info("userJoinProc()");
        String view = mServ.userJoin(member, rttr);

        return view;
    }

    @GetMapping("userLogin")
    public String userLogin(){
        log.info("userLogin()");
        return "userLogin";
    }

    @PostMapping("mLoginProc")
    public String mLoginProc(MemberDto member,
                             HttpSession session,
                             RedirectAttributes rttr){
        log.info("mLoginProc()");
        String view = mServ.mLoginProc(member,session,rttr);
        return view;
    }

    ///////////음식점////////////
    //REST 방식(Ajax)으로 전송할 경우의 메소드
    @GetMapping("rIdCheck")
    @ResponseBody           //REST 방식일 때 꼭 넣을 것.
    public String rIdCheck(String pid){
        log.info("rIdCheck()");
        String res = rServ.rIdCheck(pid);

        return res;
    }

    @PostMapping ("resJoinProc")
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


    ///////////택시////////////
    @GetMapping("tIdCheck")
    @ResponseBody           //REST 방식일 때 꼭 넣을 것.
    public String tIdCheck(String tid){
        log.info("tIdCheck()");
        String res = tServ.tIdCheck(tid);

        return res;
    }

    @PostMapping ("taxJoinProc")
    public String taxJoinProc(TaxMemberDto tmember, RedirectAttributes rttr){
        log.info("taxJoinProc()");
        String view = tServ.taxJoin(tmember, rttr);

        return view;
    }

    @GetMapping("taxLogin")
    public String taxLogin(){
        log.info("taxLogin()");
        return "taxLogin";
    }

    @PostMapping("tLoginProc")
    public String tLoginProc(TaxMemberDto tmember,
                              HttpSession session,
                              RedirectAttributes rttr){
        log.info("tLoginProc()");
        String view = tServ.tLoginProc(tmember,session, rttr);

        return view;
    }

    ///////////프로그램////////////
    @GetMapping("proLogin")
    public String proLogin(){
        log.info("proLogin()");
        return "proLogin";
    }

    @PostMapping("pLoginProc")
    public String pLoginProc(ProMemberDto pmember,
                             HttpSession session,
                             RedirectAttributes rttr){
        log.info("pLoginProc()");
        String view = pServ.pLoginProc(pmember,session,rttr);
        return view;
    }
    //REST 방식(Ajax)으로 전송할 경우의 메소드
    @GetMapping("pIdCheck")
    @ResponseBody           //REST 방식일 때 꼭 넣을 것.
    public String pIdCheck(String pid){
        log.info("pIdCheck()");
        String res = pServ.pIdCheck(pid);

        return res;
    }

    @PostMapping ("proJoinProc")
    public String proJoinProc(ProMemberDto pmember, RedirectAttributes rttr){
        log.info("proJoinProc()");
        String view = pServ.proJoin(pmember, rttr);

        return view;
    }

    //사용자 로그아웃
    @GetMapping("logout")
    public String logout(HttpSession session){
        log.info("logout()");
        String view = mServ.logout(session);
        return view;
    }

    //음식점 로그아웃
    @GetMapping("rlogout")
    public String rlogout(HttpSession session){
        log.info("rlogout()");
        String view = rServ.rlogout(session);
        return view;
    }

    //택시 로그아웃
    @GetMapping("tlogout")
    public String tlogout(HttpSession session){
        log.info("tlogout()");
        String view = tServ.tlogout(session);
        return view;
    }

    //프로그램 로그아웃
    @GetMapping("plogout")
    public String plogout(HttpSession session){
        log.info("plogout()");
        String view = pServ.plogout(session);
        return view;
    }

    @GetMapping("mapAfter")
    public String mapAfter(){
        log.info("mapAfter()");
        return "mapAfter";
    }

    @GetMapping("introduceAfter")
    public String introduceAfter(){
        log.info("introduceAfter()");
        return "introduceAfter";
    }

    //관련 시설 이동
    @GetMapping("staInfo")
    public String staInfo(){
        log.info("staInfo()");
        return "staInfo";
    }

    //관련 사이트 이동
    @GetMapping("reSite")
    public String reSite(){
        log.info("reSite()");
        return "reSite";
    }

    //고객센터 이동
    @GetMapping("cusCenter")
    public String cusCenter(){
        log.info("cusCenter()");
        return "cusCenter";
    }
    ///////////////////////////////////////////////////////////////
    @GetMapping("userInfo")
    public ModelAndView userInfo(String uid){
        log.info("userInfo()");
        mv = mServ.getMember(uid);
        return mv;
    }

    @GetMapping("findId")
    public String findId(){
        log.info("findId()");
        return "findId";
    }

    @PostMapping("mFindId")
    public ModelAndView mFindId(String uname, String uphone_num){
        log.info("mFindId()");
        mv = mServ.mFindId3(uname, uphone_num);
        return mv;
    }

    @GetMapping("findPwd")
    public String findPwd(){
        log.info("findPwd()");
        return "findPwd";
    }

    @GetMapping("resetPwd")
    public String resetPwd(String uid, String uname, String uphone_num, Model model) {
        if (mServ.resetPwd3(uid, uname, uphone_num)) {
            model.addAttribute("uid", uid);
            return "resetPwd";
        } else {
            return "redirect:findPwd";
        }
    }

    @PostMapping("mRePw")
    public String mRePw(String upwd, String uid){
        log.info("mRePw");
        String view = mServ.mRePw(upwd, uid);

        return view;
    }


    //resController 옮길예정
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

    @GetMapping("taxFindId")
    public String taxFindId(){
        log.info("taxFindId()");
        return "taxFindId";
    }

    @PostMapping("tFindId")
    public ModelAndView tFindId(String tname, String tphone_num){
        log.info("tFindId()");
        mv = tServ.tFindId3(tname, tphone_num);
        return mv;
    }

    //택시 아이디 비번 찾기//
    @GetMapping("taxFindPwd")
    public String taxFindPwd(){
        log.info("taxFindPwd()");
        return "taxFindPwd";
    }

    @GetMapping("taxResetPwd")
    public String taxResetPwd(String tid, String tname, String tphone_num, Model model) {
        if (tServ.taxResetPwd3(tid, tname, tphone_num)) {
            model.addAttribute("tid", tid);
            return "taxResetPwd";
        } else {
            return "redirect:taxFindPwd";
        }
    }

    @PostMapping("taxRePw")
    public String taxRePw(String tpwd, String tid){
        log.info("taxRePw");
        String view = tServ.taxRePw(tpwd, tid);

        return view;
    }
    //////프로그램 아이디 비밀번호 찾기////
    @GetMapping("proFindId")
    public String proFindId(){
        log.info("proFindId()");
        return "proFindId";
    }

    @PostMapping("pFindId")
    public ModelAndView pFindId(String pcenter_name, String pcenter_num){
        log.info("pFindId()");
        mv = pServ.pFindId3(pcenter_name, pcenter_num);
        return mv;
    }

    @GetMapping("proFindPwd")
    public String proFindPwd(){
        log.info("proFindPwd()");
        return "proFindPwd";
    }

    @GetMapping("proResetPwd")
    public String proResetPwd(String pid, String pcenter_name, String pcenter_num, Model model) {
        if (pServ.proResetPwd3(pid, pcenter_name, pcenter_num)) {
            model.addAttribute("pid", pid);
            return "proResetPwd";
        } else {
            return "redirect:proFindPwd";
        }
    }

    @PostMapping("proRePw")
    public String proRePw(String ppwd, String pid){
        log.info("proRePw");
        String view = pServ.proRePw(ppwd, pid);

        return view;
    }



    /////////////////////////////  음식점   /////////////////////////////////////////
    //음식점 목록 이동(음식점 회원이 회원가입하면 회원가입때 입력한 음식점정보가 resList에 출력 )
    @GetMapping("resList")
    public String resList(Model model) {
        log.info("resList()");
        List<ResMemberDto> rList = rServ.getRegisteredRes();
        model.addAttribute("rList", rList);
        return "resList";
    }


/////////////////////////음식점 예약 부분////////////////////////////

    //예약 페이지 이동
    @GetMapping("resBook")
    public String resBook(String rid, Model model){
        log.info("resBook");
        model.addAttribute("r_rid", rid);
        return "resBook";
    }

    //예약 정보를 처리하는 메소드
    @PostMapping("rBookProc")
    public String rBookProc(ResBookDto resBookDto, Model model) {
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

    //사용자 마이페이지 관련
    @GetMapping ("userUpdate")
    public ModelAndView userUpdate(String uid){
        log.info("userUpdate()");
        mv = mServ.userUpdate(uid);
        return mv;
    }

    @PostMapping("mInfoFix")
    public String mInfoFix(MemberDto member, HttpSession session,
                           RedirectAttributes rttr){
        log.info("mInfoFix()");
        String view = mServ.mInfoUpdate(member, session, rttr);
        return view;
    }

    @GetMapping("mWithd")
    public String mWithd(String uid, RedirectAttributes rttr){
        log.info("mWithd()");
        String view = mServ.mWithdProc(uid, rttr);
        return view;
    }
    //식당 마이페이지
    @GetMapping("resInfo")
    public String resInfo(){
        log.info("resInfo()");
        return "resInfo";
    }
    @GetMapping ("resInfoUpdate")
    public ModelAndView resInfoUpdate(String rid){
        log.info("resInfoUpdate()");
        mv = rServ.resInfoUpdate(rid);
        return mv;
    }

    @PostMapping("rInfoFix")
    public String rInfoFix(ResMemberDto rmember, HttpSession session,
                           RedirectAttributes rttr){
        log.info("rInfoFix()");
        String view = rServ.rInfoUpdate(rmember, session, rttr);
        return view;
    }

    @GetMapping("rWithd")
    public String rWithd(String rid){
        log.info("rWithd()");
        String view = rServ.rWithdProc(rid);
        return view;
    }
    //택시 마이페이지
    @GetMapping("taxInfo")
    public String taxInfo(){
        log.info("taxInfo()");
        return "taxInfo";
    }

    @GetMapping ("taxInfoUpdate")
    public ModelAndView taxInfoUpdate(String tid){
        log.info("paxInfoUpdate()");
        mv = tServ.taxInfoUpdate(tid);
        return mv;
    }

    @PostMapping("tInfoFix")
    public String tInfoFix(TaxMemberDto tmember, HttpSession session,
                           RedirectAttributes rttr){
        log.info("tInfoFix()");
        String view = tServ.tInfoUpdate(tmember, session, rttr);
        return view;
    }

    @GetMapping("tWithd")
    public String tWithd(String tid){
        log.info("tWithd()");
        String view = tServ.tWithdProc(tid);
        return view;
    }

    //프로그램 마이페이지
    @GetMapping("proInfo")
    public String proInfo(){
        log.info("proInfo()");
        return "proInfo";
    }

    @GetMapping ("proInfoUpdate")
    public ModelAndView proInfoUpdate(String pid){
        log.info("proInfoUpdate()");
        mv = pServ.proInfoUpdate(pid);
        return mv;
    }

    @PostMapping("pInfoFix")
    public String pInfoFix(ProMemberDto pmember, HttpSession session,
                           RedirectAttributes rttr){
        log.info("pInfoFix()");
        String view = pServ.pInfoUpdate(pmember, session, rttr);
        return view;
    }

    @GetMapping("pWithd")
    public String pWithd(String pid){
        log.info("pWithd()");
        String view = pServ.pWithdProc(pid);
        return view;
    }






}//class end
