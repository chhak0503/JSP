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

	ArticleBean article = null;
	
	try{
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
		psmt.setString(1, no);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			article = new ArticleBean();
			article.setNo(rs.getInt(1));
			article.setParent(rs.getInt(2));
			article.setComment(rs.getInt(3));
			article.setCate(rs.getString(4));
			article.setTitle(rs.getString(5));
			article.setContent(rs.getString(6));
			article.setFile(rs.getInt(7));
			article.setHit(rs.getInt(8));
			article.setUid(rs.getString(9));
			article.setRegip(rs.getString(10));
			article.setRdate(rs.getString(11));
		}
		
		rs.close();
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}

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
            <td><a href="#">2020년 상반기 매출자료.xls</a><span>7</span>회 다운로드</td>
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