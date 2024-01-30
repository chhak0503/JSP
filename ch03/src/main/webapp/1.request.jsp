<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1.request</title>
		<!-- 
			날짜 : 2024/01/30
			이름 : 김철학
			내용 : 내장객체 request 실습
			
			request 내장객체
			 - 클라이언트 요청 정보를 갖는 객체(header + body 구성)
			 - 클라이언트 전송 데이터를 수신하는 기능
			 
			GET 방식
			 - 기본 데이터 전송 방식
			 - 전송 데이터가 주소에 노출
			 - 보안에 취약하고 POST 대비 빠른 전송 
			 
			POST 방식
			 - 전송 데이터를 요청 객체 body에 기록되어 전송되는 방식
			 - 보안에 유리하고 대량 데이터 전송에 적합 
		 -->
	</head>
	<body>
		<h3>1.request 내장객체</h3>
		
		<h4>GET 방식</h4>
		<form action="./proc/resultGet.jsp" method="get">
			<input type="text" name="uid"/><br>
			<input type="text" name="name"/><br>
			<input type="number" name="age"/><br>	
			<input type="submit" value="전송"/><br>
		</form>
		
		<h4>POST 방식</h4>
		<form action="./proc/resultPost.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pass"></td>
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
					<td>성별</td>
					<td>
						<label><input type="radio" name="gender" value="M">남</label>
						<label><input type="radio" name="gender" value="F">여</label>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<select name="addr">
							<option>서울</option>
							<option>대전</option>
							<option>대구</option>
							<option>부산</option>
							<option>광주</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>취미</td>
					<td>
						<label><input type="checkbox" name="hobby" value="등산">등산</label>
						<label><input type="checkbox" name="hobby" value="여행">여행</label>
						<label><input type="checkbox" name="hobby" value="독서">독서</label>
						<label><input type="checkbox" name="hobby" value="영화">영화</label>
						<label><input type="checkbox" name="hobby" value="운동">운동</label>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right"> 
						<input type="submit" value="전송"/>
					</td>
				</tr>
			</table>
		</form>
		
		<h4>request 기타</h4>
		<p>
			헤더정보#1 : <%= request.getHeader("User-Agent") %><br>
			헤더정보#2 : <%= request.getHeader("referer") %><br>
			헤더정보#3 : <%= request.getHeader("cookie") %><br>
			프로토콜 : <%= request.getProtocol() %><br>
			서버이름 : <%= request.getServerName() %><br>
			요청주소 : <%= request.getRequestURL() %><br>
			요청경로 : <%= request.getRequestURI() %><br>
			IP 주소 : <%= request.getRemoteAddr() %><br>		
		</p>
	
	</body>
</html>








