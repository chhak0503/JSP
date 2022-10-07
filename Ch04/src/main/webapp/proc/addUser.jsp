<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addUser</title>
	</head>
	<body>
		<h3>사용자 확인</h3>
		
		<jsp:useBean id="u2b" class="bean.User2Bean">
			<jsp:setProperty property="name" name="u2b"/>
			<jsp:setProperty property="age" name="u2b"/>
			<jsp:setProperty property="hp" name="u2b"/>
			<jsp:setProperty property="addr" name="u2b"/>		
		</jsp:useBean>
		
		<p>
			이름 : <%= u2b.getName() %><br/>
			나이 : <%= u2b.getAge() %><br/>
			휴대폰 : <%= u2b.getHp() %><br/>
			주소 : <%= u2b.getAddr() %><br/>		
		</p>
		
		<a href="../3_useBean 액션태그.jsp">뒤로가기</a>
		
		
	</body>
</html>