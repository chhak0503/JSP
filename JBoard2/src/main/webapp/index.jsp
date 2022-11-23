<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${empty sessUser}">
		<jsp:forward page="/user/login.do"/>
	</c:when>
	<c:otherwise>
		<jsp:forward page="/list.do"/>
	</c:otherwise>
</c:choose>