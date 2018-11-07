<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ingredient Update View</title>
</head>
<body>
	<form action="IngtUpdatePro.do" method="post">
	<input type="hidden" name="ingredientNo" value="${ingt.ingredientNo}"> <input
			type="hidden" name="pageNum" value="${pageNum}">
		<table border="1">
			<caption>
				<h2>성분 수정</h2>
			</caption>
			<tr>
				<td>성분번호</td>
				<td>${ingt.ingredientNo}</td>
			</tr>
			<tr>
				<td>성분명</td>
				<td><input type="text" name="name" required="required"
					value="${ingt.name}"></td>
			</tr>
			<tr>
				<td>위험도</td>
				<td><input type="text" name="grade" required="required"
					value="${ingt.grade}"></td>
			</tr>
			<tr>
				<td>20가지 주의성분</td>
				<td><input type="text" name="danger20" 
					value="${ingt.danger20}"></td>
			</tr>
			<tr>
				<td>알레르기 주의성분</td>
				<td><input type="text" name="dangerAllergy"
					value="${ingt.dangerAllergy}"></td>
			</tr>
			<tr>
				<td>피부타입별 특이성분</td>
				<td><input type="text" name="specialyType"
					value="${ingt.specialyType}"></td>
			</tr>
			<tr>
				<td>기능성 성분</td>
				<td><input type="text" name="functional"
					value="${ingt.functional}"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정완료"></td>
			</tr>
		</table>
	</form>
</body>
</html>