<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/_header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	String pg    = request.getParameter("pg");

	int start = 0;
	int total = 0;
	int lastPageNum = 0;
	int currentPage = 1;
	int currentPageGroup = 1;
	int pageGroupStart = 0;
	int pageGroupEnd = 0;
	int pageStartNum = 0;
	
	if(pg != null){
		currentPage = Integer.parseInt(pg);	
	}
	
	start = (currentPage - 1) * 10;
	currentPageGroup = (int)Math.ceil(currentPage / 10.0);
	pageGroupStart = (currentPageGroup - 1) * 10 + 1;
	pageGroupEnd = currentPageGroup * 10;
	
	ArticleDAO dao = ArticleDAO.getInstance();
	
	// 전체 게시물 갯수 
	total = dao.selectCountTotal(cate);
	
	// 마지막 페이지 번호
	if(total % 10 == 0){
		lastPageNum = total / 10;
	}else{
		lastPageNum = total / 10 + 1;
	}
	
	if(pageGroupEnd > lastPageNum){
		pageGroupEnd = lastPageNum;
	}
	
	pageStartNum = total - start;
	
	List<ArticleBean> articles = dao.selectArticles(cate, start);

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
			            <td><%= pageStartNum-- %></td>
			            <td><a href="./view.jsp?group=<%= group %>&cate=<%= cate %>&no=<%= ab.getNo() %>&pg=<%= currentPage %>"><%= ab.getTitle() %>[<%= ab.getComment() %>]</a></td>
			            <td><%= ab.getNick() %></td>
			            <td><%= ab.getRdate().substring(2, 10) %></td>
			            <td><%= ab.getHit() %></td>
			        </tr>
			        <% } %>               
			    </table>
			
			    <div class="page">
			    	<% if(pageGroupStart > 1){ %>
			        <a href="./list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= pageGroupStart - 1 %>" class="prev">이전</a>
			        <% } %>
			        
			        <% for(int num = pageGroupStart ; num <= pageGroupEnd ; num++){ %>
			        <a href="./list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= num %>" class="num <%= (num == currentPage) ? "current":"off" %>"><%= num %></a>
			        <% } %>
			        
			        <% if(pageGroupEnd < lastPageNum){ %>
			        <a href="./list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= pageGroupEnd + 1 %>" class="next">다음</a>
			        <% } %>
			    </div>
			    <a href="./write.jsp?group=<%= group %>&cate=<%= cate %>" class="btnWrite">글쓰기</a>
			</main>
		</article>
    </section>
</div>

<%@ include file="../_footer.jsp" %>