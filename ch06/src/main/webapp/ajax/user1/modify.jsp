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
				
				// 현재 페이지 url에서 파라미터 추출
				const url = location.href;
				const params = url.split('?')[1];
				const value = params.split('=')[1];
				
				console.log(value);
				
				// 서버요청
				const xhr = new XMLHttpRequest();
				xhr.open('GET', './proc/getUser1.jsp?uid='+value);
				xhr.send();
				
				// 응답처리
				xhr.onreadystatechange = function(){
					
					// 응답완료
					if(xhr.readyState == XMLHttpRequest.DONE){
						
						// 요청 성공
						if(xhr.status == 200){
							const resData = JSON.parse(xhr.responseText);
							console.log(resData);
							
						}else{
							// 요청 실패
							console.log('요청 실패...');
						}
					}
				}
			}
		</script>
	</head>
	<body>
		<h3>user1 수정</h3>
		<a href="./list.jsp">목록이동</a>
		<form action="#"> 
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" name="birth"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" name="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>
		
	</body>
</html>




