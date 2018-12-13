<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ingredient Update View</title>
</head>
<body>
	<h2>성분 수정</h2>
	<header><%@ include file="../partials/header.jsp" %></header>
	<form action="KISIngtUpdate.do" method="post">
	<input type="hidden" name="ingredientNo" value="${ingt.ingredientNo}">
		<table border="1">
			<tr>
				<th width="200">성분번호</th>
				<td>${ingt.ingredientNo}</td>
			</tr>
			<tr>
				<th>성분명</th>
				<td><input type="text" name="name" required="required"
					value="${ingt.name}"></td>
			</tr>
			<tr>
				<th>위험도</th>
				<td><input type="text" name="grade" required="required"
					value="${ingt.grade}"></td>
			</tr>
			<tr>
				<th>20가지 주의성분</th>
				<td><input type="text" name="danger20" 
					value="${ingt.danger20}"></td>
			</tr>
			<tr>
				<th>알레르기 주의성분</th>
				<td><input type="text" name="dangerAllergy"
					value="${ingt.dangerAllergy}"></td>
			</tr>
			<tr>
				<th>피부타입별 특이성분</th>
				<td><input type="text" name="specialyType"
					value="${ingt.specialyType}"></td>
			</tr>
			<tr>
				<th>기능성 성분</th>
				<td><input type="text" name="functional"
					value="${ingt.functional}"></td>
			</tr>
		</table>
		<div align="center">
			<input type="submit" value="수정완료">
			<input type="button" value="뒤로가기" onclick="history.go(-1)">				
		</div>
	</form>
<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>