<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="userDTO" class="sub1.UserDTO">
	<jsp:setProperty property="uid" name="userDTO"/>
	<jsp:setProperty property="name" name="userDTO"/>
	<jsp:setProperty property="age" name="userDTO"/>
	<jsp:setProperty property="addr" name="userDTO"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>userProc</title>
	</head>
	<body>
		<h3>전송 데이터 출력</h3>
		<p>
			아이디 : <%= userDTO.getUid() %><br>
			이름 : <%= userDTO.getName() %><br>
			나이 : <%= userDTO.getAge() %><br>
			주소 : <%= userDTO.getAddr() %><br>
		</p>
	</body>
</html>