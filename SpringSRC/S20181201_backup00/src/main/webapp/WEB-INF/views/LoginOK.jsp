<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="partials/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<header><%@ include file="partials/header.jsp" %></header>
	<c:if test="${msg == 'success' }">
		<h2>
			메인페이지로 들어갈거라눙 
			
			<button type="submit" id="btnLogin"><a href="KJWlogout.do">로그아웃<a></button>	
			<input type="button" id="btnUpdate"/><a href="KJWUpdateForm.do?memberId=${memberId }">회원정보수정</a>
		</h2>
	</c:if>

<footer><%@ include file="partials/footer.jsp" %></footer>
</body>
</html>