<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String searchType = request.getParameter("searchType");
	String keyword    = request.getParameter("keyword");
	

	ArticleDAO dao = ArticleDAO.getInstance();
	
	// 글 조회	
	ArticleDTO article = dao.selectArticle(no);
	
	// 글 조회 카운트 업데이트
	dao.updateHitCount(no);
	
	// 댓글 조회
	List<ArticleDTO> comments = dao.selectComments(no);	
	
	// 동적 파라미터 생성
	String params = "";
	
	if(searchType != null && keyword != null){
		params = "?searchType="+searchType+"&keyword="+keyword;
	}
%>
<%@ include file="./_header.jsp" %>
<script>	
	window.onload = function(){
		
		// 원글수정
		const btnModify = document.querySelector('.btnModify');
		
		if(btnModify != null){			
			btnModify.onclick = ()=>{
				if(confirm('수정 하시겠습니까?')){
					return true;
				}else{
					return false;
				}
			}
		}
		
		
		// 원글삭제
		const btnDelete = document.querySelector('.btnDelete');
		
		if(btnDelete != null){
			
			btnDelete.onclick = () => {
				if(confirm('정말 삭제 하시겠습니까?')){
					return true;
				}else{
					return false;
				}
			}
			
		}
		
		// 댓글작성 취소
		const btnCancel = document.getElementsByClassName('btnCancel')[0];
		
		btnCancel.onclick = function(e){
			e.preventDefault();			
			document.frmComment.reset(); // 폼 초기화
		}
		
		// 댓글삭제
		const dels = document.getElementsByClassName('del');
		
		for(const del of dels ){
			
			
			del.onclick = function(){
				alert();
			}
			
		}
		
		/*
		del.forEach((item)=>{
			
			item.onclick = function(){
				
				const result = confirm('정말 삭제 하시겠습니까?');
				
				if(result){
					return true;	
				}else{
					// 표준 이벤트 모델(addEventListener)은 작업취소 안됨
					return false;
				}
			}
		});
		*/
		// 댓글수정
		const mod = document.querySelectorAll('.mod');
		
		mod.forEach((item)=>{
			item.onclick = function(e){
				e.preventDefault();
				
				if(this.innerText == '수정'){
					// 수정모드 전환
					this.innerText = '수정완료';
					const textarea = this.parentElement.previousElementSibling;
					textarea.readOnly = false;
					textarea.style.background = 'white';
					textarea.focus();
					
				}else{
					// 수정완료 클릭
					const form = this.closest('form'); // 상위 노드 중 가장 가까운 form 태그 선택 
					form.submit();
					
					// 수정모드 해제
					this.innerText = '수정';
					const textarea = this.parentElement.previousElementSibling;
					textarea.readOnly = true;
					textarea.style.background = 'transparent';	
				}
			}
		});		
	}
</script>
<main>
    <section class="view">
        <h3>글보기</h3>
        <table>
            <tr>
                <td>제목</td>
                <td><input type="text" name="title" value="<%= article.getTitle() %>" readonly/></td>
            </tr>
            <% if(article.getFile() > 0){ %>
            <tr>
                <td>첨부파일</td>
                <td>
                    <a href="#">2020년 상반기 매출자료.xls</a>
                    <span>7회 다운로드</span>
                </td>
            </tr>
            <% } %>
            <tr>
                <td>내용</td>
                <td>
                    <textarea name="content" readonly><%= article.getContent() %></textarea>
                </td>
            </tr>
        </table>
        <div>
        	<% if(article.getWriter().equals(sessUser.getUid())){ %>
            <a href="/jboard1/proc/deleteProc.jsp?no=<%= article.getNo() %>" class="btnDelete">삭제</a>
            <a href="/jboard1/modify.jsp?no=<%= article.getNo() %>" class="btnModify">수정</a>
            <% } %>
            <a href="/jboard1/list.jsp<%= params %>" class="btnList">목록</a>
        </div>
        
        <!-- 댓글리스트 -->
        <section class="commentList">
            <h3>댓글목록</h3>
            <% for(ArticleDTO comment : comments){ %>
            <form action="/jboard1/proc/commentUpdate.jsp" method="post">
            	<input type="hidden" name="no" value="<%= comment.getNo() %>">
            	<input type="hidden" name="parent" value="<%= comment.getParent() %>">
	            <article class="comment">
	                <span>
	                    <span><%= comment.getNick() %></span>
	                    <span><%= comment.getRdate().substring(2, 10) %></span>
	                </span>
	                <textarea name="content" readonly><%= comment.getContent() %></textarea>
	                
	                <% if(comment.getWriter().equals(sessUser.getUid())){ %>
	                <div>
	                    <a href="/jboard1/proc/commentDelete.jsp?parent=<%= comment.getParent() %>&no=<%= comment.getNo() %>" class="del">삭제</a>
	                    <a href="#" class="mod">수정</a>
	                </div>
	                <% } %>                
	            </article>
            </form>
            <% } %>
            
            <% if(comments.isEmpty()) { %>
            <p class="empty">등록된 댓글이 없습니다.</p>
            <% } %>
            
        </section>

        <!-- 댓글입력폼 -->
        <section class="commentForm">
            <h3>댓글쓰기</h3>
            <form action="/jboard1/proc/commentInsert.jsp" name="frmComment" method="post">
            	<input type="hidden" name="parent" value="<%= no %>">
            	<input type="hidden" name="writer" value="<%= sessUser.getUid() %>">
                <textarea name="content"></textarea>
                <div>
                    <a href="#" class="btnCancel">취소</a>
                    <input type="submit" class="btnWrite" value="작성완료"/>
                </div>
            </form>
        </section>
    </section>
</main>
<%@ include file="./_footer.jsp" %>










