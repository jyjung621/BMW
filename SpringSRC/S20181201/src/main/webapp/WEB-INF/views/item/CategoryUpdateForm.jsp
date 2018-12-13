<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../partials/head.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<header><%@ include file="../partials/header.jsp" %></header>
	<h2>카테고리 수정</h2>
	<form action="CategoryUpdatePro.do" method="post">
<%-- 		<input type="hidden" name="categoryNo" value="${cate.categoryNo}"> --%>
		<table>
			<tr>
				<th>카테고리 번호</th>
				<td>${cate.categoryNo}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required="required" value="${cate.name}"></td>
			</tr>
			<tr>
				<th>상위 카테고리</th>
				<td><c:if test="${!empty list}">
						<select name="parent">
							<option value="" selected="selected" disabled="disabled">선택</option>
							<c:forEach var="list" items="${list}">
								<option value="${list.name}">${list.name}</option>
							</c:forEach>
						</select>
				</c:if>
				</td>
			</tr>
			<tr>
				<th>공개 여부</th>
				<td><input type="radio" name="isPublic" value="0">비공개
					<input type="radio" name="isPublic" value="1">공개</td>
			</tr>
			<tr>
				<th>분류</th>
				<td><input type="radio" name="division" value="0">상위카테고리
					<input type="radio" name="division" value="1">하위카테고리</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"></td>
			</tr>
		</table>		
	</form>
</body>
</html>
