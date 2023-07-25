package com.raspberry.board.controller;

import com.raspberry.board.dto.BoardDto;
import com.raspberry.board.dto.CommentDto;
import com.raspberry.board.dto.SearchDto;
import com.raspberry.board.service.BoardService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Slf4j
public class BoardController {
    @Autowired
    private BoardService bServ;

    private ModelAndView mv;


    @GetMapping("boardList")
    public ModelAndView boardList(SearchDto sdto,
                                  HttpSession session)
    {
        log.info("boardList()");
        mv = bServ.getBoardList(sdto, session);//서비스에서 데이터 삽입 및 목적페이지 지정.
        return mv;
    }

    @GetMapping("boardInput")
    public String boardInput(){
        log.info("boardInput()");
        return "boardInput";
    }

    //멀티파트 데이터를 처리하는 메소드의 첫번째 매개변수는
    //Multipart 파일 목록(List)여야 한다.
    //List 앞에 @RequestPart 어노테이션을 붙인다.
    @PostMapping("writeProc")
    public String writeProc(BoardDto board,
                            RedirectAttributes rttr){
        log.info("writeProc()");
        String view = bServ.boardWrite(board, rttr);
        return view;
    }

    @GetMapping("boardDetail")
    public ModelAndView boardDetail(Integer b_no){
        log.info("boardDetail()");
        mv = bServ.getBoard(b_no);
        return mv;
    }

    @PostMapping("commentInsert")
    @ResponseBody
    public CommentDto commentInsert(CommentDto comment){
        log.info("commentInsert()");
        comment = bServ.commentInsert(comment);//서비스 처리 부분
        return comment;
    }

    @GetMapping("boardDelete")
    public String boardDelete(Integer b_no, RedirectAttributes rttr){
        log.info("boardDelete()");
        String view = bServ.boardDelete(b_no, rttr);//서비스에서 처리
        return view;
    }

    //게시글 수정
    @GetMapping("boardUpdate")
    public ModelAndView boardUpdate(Integer b_no){
        log.info("boardUpdate()");
        mv = bServ.boardUpdate(b_no); //서비스에서 처리
        return mv;
    }

    @PostMapping("boardUpdateProc")
    public String updateProc(BoardDto board, RedirectAttributes rttr){
        log.info("updateProc()");
        String view = bServ.updateBoard(board, rttr);
        return view;
    }
}//class end
