<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");

	// DAO 객체 가져오기
	ArticleDAO dao = ArticleDAO.getInstance();
	
	// 글 조회수 카운트 +1
	dao.updateArticleHit(no);
	
	// 글 가져오기
	ArticleBean article = dao.selectArticle(no);
%>
<%@ include file="./_header.jsp" %>
<main id="board" class="view">
    <table>
        <caption>글보기</caption>
        <tr>
            <th>제목</th>
            <td><input type="text" name="title" value="<%= article.getTitle() %>" readonly/></td>
        </tr>
        <% if(article.getFile() > 0){ %>
        <tr>
            <th>파일</th>
            <td><a href="/JBoard1/proc/download.jsp?fno=<%= article.getFno() %>"><%= article.getOriName() %></a>&nbsp;<span><%= article.getDownload() %></span>회 다운로드</td>
        </tr>
        <% } %>
        <tr>
            <th>내용</th>
            <td><textarea name="content" readonly><%= article.getContent() %></textarea></td>
        </tr>
    </table>

    <div>
        <a href="#" class="btn btnRemove">삭제</a>
        <a href="/JBoard1/modify.jsp" class="btn btnModify">수정</a>
        <a href="/JBoard1/list.jsp" class="btn btnList">목록</a>
    </div>

    <!-- 댓글목록 -->
    <section class="commentList">
        <h3>댓글목록</h3>
        <article>
            <span class="nick">길동이</span>
            <span class="date">20-05-13</span>                    
            <p class="content">댓글 샘플입니다.</p>
            <div>
                <a href="#" class="remove">삭제</a>
                <a href="#" class="modify">수정</a>
            </div>
        </article>                
        <p class="empty">등록된 댓글이 없습니다.</p>
    </section>

    <!-- 댓글쓰기 -->
    <section class="commentForm">
        <h3>댓글쓰기</h3>
        <form action="#">
            <textarea name="content" placeholder="댓글내용 입력"></textarea>
            <div>
                <a href="#" class="btn btnCancel">취소</a>
                <input type="submit" class="btn btnComplete" value="작성완료"/>
            </div>
        </form>
    </section>
</main>
<%@ include file="./_footer.jsp" %>