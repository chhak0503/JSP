<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./_header.jsp" %>
<script>
	window.onload = function(){
		
		const commentList = document.getElementsByClassName('commentList')[0];
		const btnSubmit = document.commentForm.submit;
		const form = document.commentForm;
		
		// 댓글 입력
		btnSubmit.onclick = function(e){
			e.preventDefault();
			
			const parent = form.parent.value;
			const writer = form.writer.value;
			const content = form.content.value;
			
			const jsonData = {
				"parent": parent, 	
				"writer": writer, 	
				"content": content
			};
			
			console.log(jsonData);
			
			fetch('/jboard2/comment.do', {
					method: 'POST',
					headers: {"Content-type": "application/json"},
					body: JSON.stringify(jsonData)
				})
				.then((resp) => resp.json())
				.then((data) => {
					console.log(data);
					
					const today = new Date();
					const year = today.getFullYear();
					const month = today.getMonth() + 1;
					const date = today.getDate();
					
					// 태그 문자열 생성
					let commentArticle = "<article>";
					commentArticle += "<span class='nick'>${sessUser.nick}</span>";
					commentArticle += "<span class='date'>"+year+"-"+month+"-"+date+"</span>";
					commentArticle += "<p class='content'>"+content+"</p>";
					commentArticle += "<div>";
					commentArticle += "<a href='#' class='remove'>삭제</a>";
					commentArticle += "<a href='#' class='modify'>수정</a>";
					commentArticle += "</div>";
					commentArticle += "</article>";
					
					console.log(commentArticle);
					
					// 태그 문자열 삽입
					commentList.insertAdjacentHTML('beforeend', commentArticle);
					
				})
				.catch((err) => {
					console.log(err);
				});
		}
		
		
		
		
	}


</script>


<main id="board">
    <section class="view">
        
        <table border="0">
            <caption>글보기</caption>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="${requestScope.articleDTO.title}" readonly/></td>
            </tr>
            <c:if test="${articleDTO.file > 0}">
            <tr>
                <th>파일</th>
                <td>
                	<c:forEach var="file" items="${articleDTO.fileDTOs}">
                		<p style="margin-top:6px;">
                			<a href="/jboard2/fileDownload.do?fno=${file.fno}">${file.oName}</a>&nbsp;<span>${file.download}</span>회 다운로드
                		</p>
                	</c:forEach>
                </td>
            </tr>
            </c:if>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" readonly>${articleDTO.content}</textarea>
                </td>
            </tr>                    
        </table>
        
        <div>
            <a href="./delete.do?no=${articleDTO.no}" class="btn btnRemove">삭제</a>
            <a href="./modify.do?no=${articleDTO.no}" class="btn btnModify">수정</a>
            <a href="./list.do" class="btn btnList">목록</a>
        </div>

        <!-- 댓글목록 -->
        <section class="commentList">
            <h3>댓글목록</h3>
			<c:forEach var="comment" items="${comments}">
	            <article>
	                <span class="nick">${comment.nick}</span>
	                <span class="date">${comment.rdate.substring(2,10)}</span>
	                <p class="content">${comment.content}</p>
	                <div>
	                    <a href="/jboard2/comment.do?type=remove&no=${comment.no}&parent=${comment.parent}" class="remove">삭제</a>
	                    <a href="#" class="modify">수정</a>
	                </div>
	            </article>
            </c:forEach>
			
			<c:if test="${empty comments}">
            	<p class="empty">등록된 댓글이 없습니다.</p>
			</c:if>
        </section>

        <!-- 댓글쓰기 -->
        <section class="commentForm">
            <h3>댓글쓰기</h3>
            <form name="commentForm" action="#" method="post">
            	<input type="hidden" name="parent" value="${articleDTO.no}">
            	<input type="hidden" name="writer" value="${sessionScope.sessUser.uid}">
                <textarea name="content" placeholder="댓글 입력"></textarea>
                <div>
                    <a href="#" class="btn btnCancel">취소</a>
                    <input type="submit" name="submit" value="작성완료" class="btn btnComplete"/>
                </div>
            </form>
        </section>

    </section>
</main>
<%@ include file="./_footer.jsp" %>