<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ingredient View</title>
</head>
<body>
	<h2>성분 상세내역</h2>
	<header><%@ include file="../partials/header.jsp" %></header>
	<table border="1">
		<tr>
			<th width="200">성분 번호</th>
			<td>${ingt.ingredientNo}</td>
		</tr>
		<tr>
			<th>성분명</th>
			<td>${ingt.name}</td>
		</tr>
		<tr>
			<th>위험등급</th>
			<td>${ingt.grade}</td>
		</tr>
		<tr>
			<th>20가지 주의성분</th>
			<td>${ingt.danger20}</td>
		</tr>
		<tr>
			<th>알레르기 주의성분</th>
			<td>${ingt.dangerAllergy}</td>
		</tr>
		<tr>
			<th>피부타입별 특이성분</th>
			<td>${ingt.specialyType}</td>
		</tr>
		<tr>
			<th>기능성 성분 여부</th>
			<td>${ingt.functional}</td>
		</tr>

	</table>
	<div align="center">
		<input type="button" value="수정"
			onclick="location.href='KISIngtUpdateForm.do?ingredientNo=${ingt.ingredientNo}'">
		<input type="button" value="삭제" onClick="location.href='KISIngtDelete.do?ingredientNo=${ingt.ingredientNo}'"> <input
			type="button" value="목록"
			onclick="location.href='KISIngtList.do'">
	</div>
<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>