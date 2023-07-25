package com.raspberry.board.service;

import com.raspberry.board.dao.BoardDao;
import com.raspberry.board.dto.BoardDto;
import com.raspberry.board.dto.CommentDto;
import com.raspberry.board.dto.SearchDto;
import com.raspberry.board.util.PagingUtil;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Service
@Slf4j
public class BoardService {
    @Autowired
    private BoardDao bDao;

    private ModelAndView mv;
    private int lcnt = 5;

    public ModelAndView getBoardList(SearchDto sdto,
                                     HttpSession session) {
        log.info("getBoardList()");
        mv = new ModelAndView();

        //SQL 쿼리문의 limit 부분 설정.
        int num = sdto.getPageNum();
        //출력할 게시물 수가 설정되지 않으면 기본값(5)로 설정
        if (sdto.getListCnt() == 0) {
            sdto.setListCnt(lcnt);
        }
        //페이지번호를 limit 시작 번호로 변경
        sdto.setPageNum((num - 1) * sdto.getListCnt());

        //Dao로 게시글 목록 가져오기
        List<BoardDto> board = bDao.selectBoardList(sdto);

        mv.addObject("board", board);

        //페이징 처리
        sdto.setPageNum(num);
        String pageHtml = getPaging(sdto);
        mv.addObject("paging", pageHtml);

        //세션에 필요 정보 저장(pageNum, 검색관련 정보)
        //페이지 번호 지정 - 글쓰기 또는 상세보기 화면에서
        //목록으로 돌아갈 때
        session.setAttribute("pageNum", num);
        //검색 결과 목록으로 돌아갈 때
        if (sdto.getColname() != null) {
            //검색 결과 목록
            session.setAttribute("sdto", sdto);
        } else {
            //검색이 아닐 때는 SearchDto를 제거
            //세션에 저장한 데이터 삭제 : removeAttribute()
            session.removeAttribute("sdto");
        }

        mv.setViewName("boardList");
        return mv;
    }

    private String getPaging(SearchDto sdto) {
        String pageHtml = null;

        //전체 글개수 구하기.
        int maxNum = bDao.selectBoardCnt(sdto);
        //페이지에 보여질 번호 개수
        int pageCnt = 5;
        String listName = null;
        if (sdto.getColname() != null) {
            listName = "boardList?colname=" + sdto.getColname()
                    + "&keyword=" + sdto.getKeyword() + "&";
        } else {
            listName = "boardList?";
        }

        PagingUtil paging = new PagingUtil(maxNum,
                sdto.getPageNum(),
                sdto.getListCnt(),
                pageCnt, listName);

        pageHtml = paging.makePaging();

        return pageHtml;
    }

    public String boardWrite(BoardDto board,
                             RedirectAttributes rttr) {
        log.info("boardWrite()");
        String view = null;
        String msg = null;

        try {
            //글 내용 저장.
            bDao.insertBoard(board);
            log.info("게시글 번호 : " + board.getB_no());

            //목록 첫페이지로 이동.
            view = "redirect:boardList?pageNum=1";
            msg = "글 작성 성공";
        } catch (Exception e) {
            e.printStackTrace();
            view = "redirect:boardInput";
            msg = "글 작성 실패";
        }
        rttr.addFlashAttribute("msg", msg);
        return view;
    }

    public ModelAndView getBoard(Integer b_no) {
        log.info("getBoard()");
        mv = new ModelAndView();

        //글 내용 가져오기
        BoardDto board = bDao.selectBoard(b_no);

        //댓글 목록 가져오기
        List<CommentDto> comment = bDao.selectComment(b_no);

        //가져온 데이터를 mv에 담기
        mv.addObject("board", board);
        mv.addObject("comment", comment);

        //mv에 view 지정하기
        mv.setViewName("boardDetail");

        return mv;
    }

    public CommentDto commentInsert(CommentDto comment) {
        log.info("commentInsert()");
        try {
            //DB에 댓글 저장(insert)
            bDao.insertComment(comment);
            //저장된 댓글 가져오기(select)
            comment = bDao.selectLastComment(comment.getC_no());
        } catch (Exception e) {
            e.printStackTrace();
            comment =null;
        }
        return comment;
    }

    public String boardDelete(Integer b_no, RedirectAttributes rttr) {
        log.info("boardDelete()");
        String view = null;
        String msg = null;

        try {
            //삭제순서는 댓글 다음에 게시글을 삭제
            //따라서 댓글을 먼저 삭제한다.
            bDao.deleteComment(b_no);
            bDao.deleteBoard(b_no);

            view = "redirect:boardList?pageNum=1";
            msg = "삭제가 완료되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();
            view = "redirect:boardDetail?b_no=" + b_no;
            msg = "삭제를 실패했습니다.";
        }
        rttr.addFlashAttribute("msg", msg);
        return view;
    }

    //게시글 수정 메소드
    public ModelAndView boardUpdate(Integer b_no) {
        log.info("boardUpdate()");
        //게시글 내용 가져오기
        BoardDto board = bDao.selectBoard(b_no);

        //mv에 추가
        mv = new ModelAndView();
        mv.addObject("board", board);

        //뷰 지정
        mv.setViewName("boardUpdate");
        return mv;
    }

    public String updateBoard(BoardDto board, RedirectAttributes rttr) {
        log.info("updateBoard()");
        String view = null;
        String msg = null;

        try{
            bDao.updateBoard(board);
            view = "redirect:boardDetail?b_no=" + board.getB_no();
            msg = "수정을 완료했습니다.";
        } catch (Exception e) {
            e.printStackTrace();
            view = "redirect:boardUpdate?b_no=" + board.getB_no();
            msg = "수정을 실패했습니다.";
        }
        rttr.addFlashAttribute("msg", msg);
        return view;
    }

    public List<BoardDto> getPreBoardList() {
        return bDao.outputBoard();
    }
}//class end
