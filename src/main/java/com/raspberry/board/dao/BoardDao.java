package com.raspberry.board.dao;

import com.raspberry.board.dto.BoardDto;
import com.raspberry.board.dto.CommentDto;
import com.raspberry.board.dto.SearchDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardDao {
    //게시글 목록 가져오는 메소드 선언
    List<BoardDto> selectBoardList(SearchDto sdto);
    //게시글 개수 가져오는 메소드 선언
    int selectBoardCnt(SearchDto sdto);
    //게시글 저장 메소드 선언
    void insertBoard(BoardDto board);
    //게시글 1개 가져오는 메소드 선언
    BoardDto selectBoard(Integer b_no);
    //게시글 5개 가져오는 메소드 선언
    List<BoardDto> outputBoard();
    //댓글 목록 가져오는 메소드 선언
    List<CommentDto> selectComment(Integer b_no);
    //댓글 저장 메소드
    void insertComment(CommentDto comment);
    //추가한 댓글 가져오는 메소드
    CommentDto selectLastComment(Integer c_no);
    //댓글 목록 메소드 선언
    void deleteComment(Integer b_no);
    //게시글 삭제 메소드 선언
    void deleteBoard(Integer b_no);
    //게시글 수정 메소드 선언
    void updateBoard(BoardDto board);
}
