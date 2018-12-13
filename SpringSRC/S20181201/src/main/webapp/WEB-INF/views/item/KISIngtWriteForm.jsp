<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ingredient Write View</title>
</head>
<body>
<h2>성분 등록</h2>
<header><%@ include file="../partials/header.jsp" %></header>
	<form action="KISIngtWrite.do" method="post">
		<table>
			<!-- <tr>
				<th width="200">성분번호</th>
				<td><input type="text" name="ingredientNo" required="required"></td>
			</tr> -->
			<tr>
				<th width="200">성분명</th>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<th>위험도 등급</th>
				<td><input type="text" name="grade" required="required"></td>
			</tr>
			<tr>
				<th>20가지 주의성분</th>
				<td><input type="text" name="danger20"></td>
			</tr>
			<tr>
				<th>알레르기 주의성분</th>
				<td><input type="text" name="dangerAllergy"></td>
			</tr>
			<tr>
				<th>피부타입별 특이성분</th>
				<td><input type="text" name="specialyType"></td>
			</tr>
			<tr>
				<th>기능성 성분 여부</th>
				<td><input type="text" name="functional"></td>
			</tr>		
			
		</table>
		<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="다시작성">
				<input type="button" value="목록가기" onclick="location.href='KISIngtList.do'">
			</div>
	</form>
<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>