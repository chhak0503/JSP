<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1.ELTest</title>
		<!-- 
			날짜 : 2024/02/20
			이름 : 김철학
			내용 : JSP 표현언어 실습하기
		-->
	</head>
	<body>
		<h3>1.표현언어</h3>
		<%
			int num1 = 1;
			int num2 = 2;
			
			String str1 = "hello";
			String str2 = "welcome";
			
			// 표현언어로 출력하기 위해 내장 객체 스코프 저장
			pageContext.setAttribute("num1", num1);
			request.setAttribute("num2", num2);
			session.setAttribute("str1", str1);
			session.setAttribute("num1", "100");
			application.setAttribute("str2", str2);
		%>
		
		<h4>표현식</h4>
		<p>
			num1 : <%= num1 %><br>
			num2 : <%= num2 %><br>
			str1 : <%= str1 %><br>
			str2 : <%= str2 %><br>
		</p>
		
		<h4>표현언어</h4>
		<p>
			num1 : ${num1}<br>
			num2 : ${num2}<br>
			str1 : ${str1}<br>
			str2 : ${str2}<br>	
		</p>
		
		<h4>표현언어 내장객체</h4>
		<p>
			num1 : ${pageScope.num1}<br>
			num2 : ${requestScope.num2}<br>
			str1 : ${sessionScope.str1}<br>
			session num1 : ${sessionScope.num1}<br>
			str2 : ${applicationScope.str2}<br>	
		</p>
		
		<h4>표현언어 연산자</h4>
		<p>
			num1 + num2 = ${num1 + num2}<br>
			num1 - num2 = ${num1 - num2}<br>
			num1 * num2 = ${num1 * num2}<br>
			num1 / num2 = ${num1 / num2}<br>
			num1 % num2 = ${num1 % num2}<br><br>
			
			num1 > num2 = ${num1 > num2}<br>
			num1 < num2 = ${num1 < num2}<br>
			num1 >= num2 = ${num1 >= num2}<br>
			num1 <= num2 = ${num1 <= num2}<br>
			num1 == num2 = ${num1 == num2}<br>
			num1 != num2 = ${num1 != num2}<br><br>
			
			num1 gt num2 = ${num1 gt num2}<br>
			num1 lt num2 = ${num1 lt num2}<br>
			num1 ge num2 = ${num1 ge num2}<br>
			num1 le num2 = ${num1 le num2}<br>
			num1 eq num2 = ${num1 eq num2}<br>
			num1 ne num2 = ${num1 ne num2}<br><br>
		</p>
		
	</body>
</html>















