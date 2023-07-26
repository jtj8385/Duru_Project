package com.raspberry.board.service;

import com.raspberry.board.dao.ProBookDao;
import com.raspberry.board.dto.ProBookDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
@Slf4j
public class ProBookService {
    @Autowired
    private ProBookDao pbDao;

    //신청 정보 작성
    public String addProBookInfo(ProBookDto proBookDto, RedirectAttributes rttr) {
        log.info("addProBookInfo()");
        String view = null;
        String msg = null;

        try {
            //글 내용 저장.
            pbDao.addProBookInfo(proBookDto);
            log.info("프로그램 신청 번호 : " + proBookDto.getPbook_num());

            //목록 첫페이지로 이동.
            view = "redirect:proList?pageNum=1";
            msg = "프로그램 신청 성공";
        } catch (Exception e) {
            e.printStackTrace();
            view = "redirect:proBook";
            msg = "프로그램 신청 실패";
        }
        rttr.addFlashAttribute("msg", msg);
        return view;
    }

}
