<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/_header.jsp" %>
<%
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	
	int start = 0;
	
	List<ArticleBean> articles = ArticleDAO.getInstance().selectArticles(cate, start);

	pageContext.include("./_"+group+".jsp");
%>
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
			        <% for(ArticleBean ab : articles){ %>
			        <tr>
			            <td><%= ab.getNo() %></td>
			            <td><a href="./view.jsp?group=<%= group %>&cate=<%= cate %>"><%= ab.getTitle() %>[<%= ab.getComment() %>]</a></td>
			            <td><%= ab.getNick() %></td>
			            <td><%= ab.getRdate().substring(2, 10) %></td>
			            <td><%= ab.getHit() %></td>
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
			    <a href="./write.jsp?group=<%= group %>&cate=<%= cate %>" class="btnWrite">글쓰기</a>
			</main>
		</article>
    </section>
</div>

<%@ include file="../_footer.jsp" %>