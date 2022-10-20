<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// Java Json 데이터 생성
	String jsonData = "{\"uid\":\"a101\", \"name\":\"홍길동\", \"hp\":\"010-1234-1001\", \"age\":25}";

	// Json 데이터 출력
	out.print(jsonData);
%>