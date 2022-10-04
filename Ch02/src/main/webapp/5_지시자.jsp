<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page info="ⓒCopyright chhak.or.kr" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>5_지시자</title>
		<!-- 
			날짜 : 2022/10/04
			이름 : 김철학
			내용 : JSP 지시자 실습하기
			
			지시자(Directive)
			 - JSP 페이지에 추가적인 정보를 설정하는 스크립트 문법
			 - 스크립트릿과 함께 JSP 구성요소
			 - 대표적으로 page, include 지시자
			 
			include 지시자
			 - 일반적으로 UI 모듈, 공통 전역 파일을 삽입할 때 사용하는 지시자
			 - 정적타임에 삽입(include 태그는 동적타임에 삽입)
		-->
	</head>
	<body>
		<h3>지시자</h3>
		
		<h4>page 지시자</h4>
		<p>
			page info : <%= getServletInfo() %>
		</p>
		
		<h4>include 지시자</h4>
		<%@ include file="../inc/_header.jsp" %>
		<%@ include file="../inc/_footer.jsp" %>
		
	</body>
</html>