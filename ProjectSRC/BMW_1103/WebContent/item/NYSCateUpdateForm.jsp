<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="CategoryUpdatePro.do" method="post">
		<input type="hidden" name="pageNumCt" value="${pageNumCt}">
	 	<input type="hidden" name="categoryNo" value="${cate.categoryNo}">

		<table border="1">
			<caption>
				<h2>카테고리 수정</h2>
			</caption>
			<tr>
				<td>카테고리 번호</td>
				<td>${cate.categoryNo}</td>
			</tr>
			<tr>
				<td>카테고리 이름</td>
				<td><input type="text" name="name" value="${cate.name}" required="required"></td>
			</tr>
			<tr>
				<td>상위 카테고리</td>
<%-- 				<td>
  				<select name="parent"  required="required">
				<c:forEach var="cate2" items="${cate2}">
					<option value="${cate2.name}">${cate2.name}</option>
				</c:forEach>
				</select> 
				</td> --%>
				<td><input type="text" name="parent" value="${cate.parent}"></td>
			</tr>
			<tr>
				<td>공개여부</td>
				<td>
					<input type="radio" name="isPublic" value="1" checked="checked">공개
					<input type="radio" name="isPublic" value="0">비공개
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정완료">
				<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>