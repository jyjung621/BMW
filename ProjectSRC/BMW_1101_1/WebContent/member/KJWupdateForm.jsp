<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<%@ include file="../header.jsp"%>
<body>
	<form action="KJWupdatePro.do" method="post">
		<!-- 수정완료 submit 하면 updatePro로 감 -->
		<table border="1">
			<caption>
				<h2>회원정보수정</h2>
			</caption>
			<tr>
				<td>아이디</td>
				<td><input type="hidden" name="memberId" required="required"
					value="${memberId}">${memberId}</td>

			</tr>
			<tr>
				<td>암호</td>
				<td><input type="text" name="passwd" required="required"
					value="${passwd}"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required="required"
					value="${name}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" required="required"
					value="${address}"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" name="phone" value="${phone}"></td>
			</tr>
			<tr>
				<td>수정날짜</td>
				<td><input type="hidden" name="joinDate" required="required"
					value="${joinDate}">${joinDate}</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정완료"></td>
			</tr>
		</table>
	</form>
	<%@ include file="../footer.jsp"%>
</body>
</html>