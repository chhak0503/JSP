<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// xml 생성
	String xml  = "<user>";
	       xml += "<uid>a101</uid>";
	       xml += "<name>홍길동</name>";
	       xml += "<hp>010-1234-1001</hp>";
	       xml += "<age>25</age>";
	       xml += "</user>";

	out.print(xml);
%>