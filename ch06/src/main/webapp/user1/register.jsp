<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1::register</title>
	</head>
	<body>
		<h3>user1 등록</h3>
		
		<a href="../1.Jdbc.jsp">처음으로</a>
		<a href="./list.jsp">목록보기</a>
		<form action="./registerProc.jsp" method="post">
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
						<input type="submit" value="등록하기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>