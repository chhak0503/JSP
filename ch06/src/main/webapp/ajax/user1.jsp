<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ajax::user1</title>
		<!-- 
			날짜 : 2024/02/15
			이름 : 김철학
			내용 : JSP AJAX 실습하기
		-->
		<script>
			
			window.onload = function(){
				
				const btnUser = document.getElementById('btnUser');
				
				btnUser.onclick = () => {
					
					const xhr = new XMLHttpRequest();
					xhr.open('GET', './proc/user1s.jsp');
					xhr.send();
					
					
					
					
					
				}
				
				
				
			}
		
		</script>
		
		
	</head>
	<body>
		<h3>user1</h3>
		
		<button id="btnUser">데이터 요청하기</button>
		
	</body>
</html>