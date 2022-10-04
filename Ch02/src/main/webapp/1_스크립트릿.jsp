<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_스크립트릿</title>
		<!-- 
			날짜 : 2022/10/04
			이름 : 김철학
			내용 : JSP 스크립트릿(Scriptlet) 실습하기
			
			스크립트릿(Scriptlet)
			 - 정적문서(HTML)에 프로그래밍 코드를 삽입하기 위한 코드영역
			 - 동적문서(JSP) 스크립트릿을 실행해서 정적문서로 변환
			 		
			표현식(Expression)
			 - 변수의 값을 출력을 위한 스크립트
			 - 간단한 값, 식 결과를 출력
		-->
	</head>
	<body>
		<h3>스크립트릿 실습</h3>
		<%
			// 스크립트릿(Java 프로그래밍 코드 영역)
			int 	var1 = 1;
			boolean var2 = true;
			double 	var3 = 3.14;
			String 	var4 = "Hello";
		
			out.print("<h4>var1 : "+var1+"</h4>");
			out.print("<h4>var2 : "+var2+"</h4>");		
		%>
		
		<!-- 표현식(Expression) 출력 -->
		<h4>var3 : <%= var3 %></h4>	
		<h4>var4 : <%= var4 %></h4>		
		
	</body>
</html>