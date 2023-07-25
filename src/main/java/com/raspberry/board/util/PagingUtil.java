package com.raspberry.board.util;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class PagingUtil {
    private int maxNum;//전체 글 개수.
    private int pageNum;//현재 보이는 페이지 번호.
    private int listCnt;//페이지 당 글 개수.
    private int pageCnt;//보여질 페이지 번호 개수.
    private String listName;//목록 페이지가 여러개인 경우
                            //페이징 처리할 목록 페이지 url.

    //페이징용 html 코드를 만드는 메소드
    public String makePaging() {
        String page = null;
        StringBuffer sb = new StringBuffer();

        //1. 전체 페이지 개수 구하기(페이지 당 listCnt 만큼 출력)
        // listCnt가 5일 때
        // 전체 데이터가 4개 : 1 페이지
        // 전체 데이터가 6개 : 2 페이지
        int totalPage = (maxNum % listCnt) > 0 ?
                maxNum / listCnt + 1 :
                maxNum / listCnt;
        //2. 현재 페이지가 속해 있는 그룹 번호 구하기
        int curGroup = (pageNum % pageCnt) > 0 ?
                pageNum / pageCnt + 1 :
                pageNum / pageCnt;
        //3. 현재 보이는 페이지 그룹의 시작 번호 구하기
        int start = (curGroup * pageCnt) - (pageCnt - 1);
        //두번째 그룹의 시작번호 = (2 * 5) - (5 - 1) = 6

        //4. 현재 보이는 페이지 그룹의 마지막 번호 구하기
        int end = (curGroup * pageCnt) >= totalPage ?
                totalPage : curGroup * pageCnt;
        //totalPage 9, curGroup * pageCnt 10
        // -> totalPage가 마지막 번호.

        //'이전' 버튼 처리. 시작번호가 1일 때는 버튼 생성 X.
        if (start != 1) {
            sb.append("<a class='pno' href='/" + listName
                    + "pageNum=" + (start - 1) + "'>");
            sb.append("&nbsp;이전&nbsp;</a>");
        }
        //<a class='pno' href='/list?pageNum=5'>&nbsp;이전&nbsp;</a>

        //중간 페이지 번호버튼 처리
        for (int i = start; i <= end; i++) {
            if (pageNum != i) { //현재 페이지가 아닌 번호
                sb.append("<a class='pno' href='/" + listName
                        + "pageNum=" + i + "'>");
                sb.append("&nbsp;" + i + "&nbsp;</a>");
                //<a class='pno' href='/list?pageNum=2>&nbsp;2&nbsp;</a>
            } else { //현재 페이지 번호(링크 X)
                sb.append("<font class='pno' style='color: red;'>");
                sb.append("&nbsp;" + i + "&nbsp;</font>");
                //<font class='pno' style='color: red;'>&nbsp;1&nbsp;</font>
            }
        }// for end

        //'다음' 버튼 처리
        if (end != totalPage) {
            sb.append("<a class='pno' href='/" + listName
                    + "pageNum=" + (end + 1) + "'>");
            sb.append("&nbsp;다음&nbsp;</a>");
            //<a class='pno' href='/list?pageNum=6'>&nbsp;다음&nbsp;</a>
        }

        //StringBuffer에 저장된 내용을 문자열로 변화나.
        page = sb.toString();

        return page;
    }
}//class end