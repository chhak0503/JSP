<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pg = request.getParameter("pg");

	ArticleDAO dao = ArticleDAO.getInstance();

	// 전체 글 갯수
	int total = dao.selectCountTotal();
	
	// 마지막 페이지 번호 계산
	int lastPageNum = 0;
	
	if(total % 10 == 0){
		lastPageNum = (total / 10);		
	}else {
		lastPageNum = (total / 10) + 1;
	}
	
	// 현재 페이지 번호
	int currentPg = 1;
	
	if(pg != null){
		currentPg = Integer.parseInt(pg);
	}
	
	// limit 시작값 계산
	int start = (currentPg - 1) * 10;
		
	

	// 글 조회
	List<ArticleDTO> articles = dao.selectArticles(start);
%>
<%@ include file="./_header.jsp" %>
<main>
    <section class="list">
        <h3>글목록</h3>
        <article>
            <table border="0">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>날짜</th>
                    <th>조회</th>
                </tr>
                <% for(ArticleDTO article : articles){ %>
                <tr>
                    <td><%= article.getNo() %></td>
                    <td><a href="#"><%= article.getTitle() %></a>&nbsp;[<%= article.getComment() %>]</td>
                    <td><%= article.getNick() %></td>
                    <td><%= article.getRdate().substring(2, 10) %></td>
                    <td><%= article.getHit() %></td>
                </tr>
                <% } %>
            </table>
        </article>

        <!-- 페이지 네비게이션 -->
        <div class="paging">
            <a href="#" class="prev">이전</a>
            
            <% for(int n=1 ; n<=lastPageNum ; n++){ %>
            <a href="/jboard1/list.jsp?pg=<%= n %>" class="num"><%= n %></a>
            <% } %>

            <a href="#" class="next">다음</a>
        </div>

        <!-- 글쓰기 버튼 -->
        <a href="/jboard1/write.jsp" class="btnWrite">글쓰기</a>
    </section>
</main>
<%@ include file="./_footer.jsp" %>

















