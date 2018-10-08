<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ingredient List View</title>
<style type="text/css">
table {
	width: 100%;
}
</style>
</head>
<body>
	<h2>성분 List</h2>
	<table>
		<tr>
			<th>번호</th>
			<th>성분명</th>
			<th>위험도등급</th>
			<th>20가지 주의성분</th>
			<th>알레르기 주의성분</th>
			<th>피부타입별 특이성분</th>
			<th>기능성 성분 여부</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="ingt" items="${list }">
				<tr>
					<td>${startNum }</td>
					<td><a
						href="content.do?num=${ingt.ingredientNo}&pageNum=${currentPage }">${ingt.name }</a>
					</td>
					<td>${ingt.grade }</td>
					<td>${ingt.danger20 }</td>
					<td>${ingt.dangerAllergy }</td>
					<td>${ingt.specialyType }</td>
					<td>${ingt.functional }</td>
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
			<a href="list.do?pageNum=${startPage-blockSize }">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a href="list.do?pageNum=${i }">[${i }]</a>
		</c:forEach>
		<c:if test="${endPage > pagecnt }">
			<a href="list.do?pageNum=${startPage+blockSize }">[다음]</a>
		</c:if>
	</div>

</body>
</html>