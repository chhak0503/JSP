<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	List<ArticleBean> articles = new ArrayList<>();	

	try{
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()){
			ArticleBean article = new ArticleBean();
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
			article.setNick(rs.getString(12));
			
			articles.add(article);
		}
		
		rs.close();
		psmt.close();
		conn.close();		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<%@ include file="./_header.jsp" %>
<main id="board" class="list">
    <table border="0">
        <caption>글목록</caption>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>날짜</th>
            <th>조회</th>
        </tr>
        <% for(ArticleBean article : articles){ %>
        <tr>
            <td><%= article.getNo() %></td>
            <td><a href="/JBoard1/view.jsp"><%= article.getTitle() %>[<%= article.getComment() %>]</a></td>
            <td><%= article.getNick() %></td>
            <td><%= article.getRdate().substring(2, 10) %></td>
            <td><%= article.getHit() %></td>
        </tr>  
        <% } %>             
    </table>
    <div class="page">
        <a href="#" class="prev">이전</a>
        <a href="#" class="num current">1</a>
        <a href="#" class="num">2</a>
        <a href="#" class="num">3</a>
        <a href="#" class="next">다음</a>
    </div>
    <a href="/JBoard1/write.jsp" class="btnWrite">글쓰기</a>
</main>
<%@ include file="./_footer.jsp" %>