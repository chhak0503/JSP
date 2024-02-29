<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./_header.jsp" %>
<script>
	window.onload = function(){
		
		const fileDels = document.getElementsByClassName('fileDel');
		
		for(const del of fileDels){
			
			del.onclick = (e) => {
				e.preventDefault();
				
				if(confirm('정말 삭제 하시겠습니까?')){
					
					// 태그의 사용자 정의 속성(data-fno) 값 가져오기
					const fno = del.dataset.fno;
					
					// 서버로 ajax 삭제 요청
					fetch('/jboard2/fileDelete.do?fno='+fno)
						.then((response)=>response.json())
						.then((data)=>{
							console.log(data);
							
							// 파일첨부 tr 문서객체 생성해둠(여기다가 아래 동적생성 input file 태그 생성)
							const td = del.closest('td');
							
							// 해당 삭제링크의 부모태그 p태그를 동적 제거
							del.parentNode.remove();
							
							// 만약 파일정보가 더이상 없으면 파일 입력필드 동적 생성
							const count = document.getElementsByClassName('fileDel').length;
							console.log('count : ' + count);
							
							if(count == 0){
								console.log('here1...');
								const fileInput = document.createElement('input');
								fileInput.setAttribute('type', 'file');
								fileInput.setAttribute('name', 'fname');
								fileInput.setAttribute('multiple', 'multiple');
								td.appendChild(fileInput);
							}
						})
						.catch((err)=>{
							console.log(err);
						});
				}
			}
		}
	}
	
</script>
<main id="board">
    <section class="modify">

        <form action="/jboard2/modify.do" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="no" value="${articleDTO.no}">
            <table border="0">
                <caption>글수정</caption>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" value="${articleDTO.title}" placeholder="제목을 입력하세요."/></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="content">${articleDTO.content}</textarea>
                    </td>
                </tr>
                
                <tr>
                    <th>파일</th>
                    <td>
                    	<c:choose>
                    		<c:when test="${articleDTO.file > 0}">
                    			<c:forEach var="file" items="${articleDTO.fileDTOs}">
			                		<p style="margin-top:6px;">
			                			<span>${file.oName}</span>
			                			<!-- 
			                				사용자 정의 데이터 속성
			                				 - 형식 : data-속성명
			                				 - 태그에 특정 데이터값을 속성으로 지정할 때 사용
			                				 - Javascript에서 dataset으로 참조
			                			-->
			                			<a href="#" class="fileDel" data-fno="${file.fno}">[삭제]</a>
			                		</p>
			                	</c:forEach>
                    		</c:when>
                        	<c:otherwise>
                        		<input type="file" name="fname" multiple="multiple"/>
                        	</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </table>
            
            <div>
                <a href="./view.do?no=${articleDTO.no}" class="btn btnCancel">취소</a>
                <input type="submit" value="수정완료" class="btn btnComplete"/>
            </div>
        </form>

    </section>
</main>
<%@ include file="./_footer.jsp" %>