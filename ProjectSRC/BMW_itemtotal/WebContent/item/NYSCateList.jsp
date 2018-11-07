<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category List View</title>
<style type="text/css">
table {
	width: 70%;
	text-align: center;
}
</style>
</head>
<body>
	<h2 style="text-align: center;">카테고리 List</h2>
	<table border="1" align="center">
		<tr>
			<td><a href="CategoryWriteForm.do?pageNumCt=${pageNumCt }">카테고리 등록</a></td>
		</tr>
		<tr>
			<th>No</th>
			<th>카테고리 번호</th>
			<th>카테고리 이름</th>
			<th>상위 카테고리</th>
			<th>공개여부</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="cate" items="${list}">
				<tr>
					<td>${startNum}</td>
					<td>${cate.categoryNo}</td>
					<td>${cate.name}</td>
					<td>${cate.parent }</td>
					<td>${cate.isPublic }</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }"></c:set>
			</c:forEach>
		</c:if>
		<c:if test="${totcnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없음</td>
			</tr>
		</c:if>
	</table>

	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href="CategoryList.do?pageNumCt=${startPage-blockSize }">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a href="CategoryList.do?pageNumCt=${i }">[${i }]</a>
		</c:forEach>
		<c:if test="${endPage > pagecnt }">
			<a href="CategoryList.do?pageNumCt=${startPage+blockSize }">[다음]</a>
		</c:if>
	</div>

</body>
</html>