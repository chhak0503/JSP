<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3.반복문</title>
		<%--
			날짜 : 2024/01/29
			이름 : 김철학
			내용 : 3.반복문
		--%>
	</head>
	<body>
		<h3>3.반복문</h3>
		
		<h4>for</h4>
		<%
			for(int i=1 ; i<=5 ; i++){
				out.println("<p>i : " + i + "</p>");
			}
		%>
		
		<% for(int k=1 ; k<=5 ; k++){ %>
			<p>k : <%= k %></p>
		<% } %>
		
		
		<h4>while</h4>
		<%
			int j = 1;
			while(j <= 5){
		%>
			<p>j : <%= j %></p>			
		<%
				j++;
			}
		%>
		
		<h4>구구단</h4>
		<table border="1">
			<% for(int x=1 ; x<=9 ; x++){ %>
			<tr>
				<% for(int y=2 ; y<=9 ; y++){ %>
				<td><%= y %> x <%= x %> = <%= x*y %></td>
				<% } %>		
			</tr>
			<% } %>
		</table>
		
		
		
		
		
		
	</body>
</html>