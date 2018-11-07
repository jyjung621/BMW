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

th {
	background-color: #ddd;
}

td {
	background-color: #eee;
}
</style>
<script>
	function searchCheck(frm) {
		if (frm.keyWord.value == "") {
			alert("검색 단어를 입력하세요.");
			frm.keyWord.focus();
			return;
		}
		frm.submit();
	}
</script>
</head>
<body>
	<h2>성분 리스트</h2>
	<table>
	<tr>
	<td><a href="IngtWriteForm.do">성분 등록</a></td>
		<td colspan="7" align="center">
			<form name="search" method="post">
				<input type="text" name="keyWord" /> <input type="button"
					value="검색" onclick="searchCheck(form)" />
			</form>
		</td>
	</tr>
		<tr>
			<th>번호</th>
			<th>성분명</th>
			<th>위험도 등급</th>
			<th>20가지 주의성분</th>
			<th>알레르기 주의성분</th>
			<th>피부타입별 특이성분</th>
			<th>기능성 성분 여부</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="ingt" items="${list}">
				<tr>
					<td>${startNum }</td>
					<td class="left" width="200"><a
						href="IngtContent.do?ingredientNo=${ingt.ingredientNo}&pageNum=${currentPage}">${ingt.name}</a>
					</td>
					<td>${ingt.grade}</td>
					<td>${ingt.danger20}</td>
					<td>${ingt.dangerAllergy}</td>
					<td>${ingt.specialyType}</td>
					<td>${ingt.functional}</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1}" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0}">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>
	<div style="text-align: center;">
		<c:choose>
			<c:when test="${keyWord != null}">
				<c:if test="${startPage > blockSize}">
					<a
						href="IngtList.do?pageNum=${startPage-blockSize}&keyWord=${keyWord}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="IngtList.do?pageNum=${i}&keyWord=${keyWord}">[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<a
						href="IngtList.do?pageNum=${startPage+blockSize}&keyWord=${keyWord}">[다음]</a>
				</c:if>
			</c:when>
			<c:otherwise>
				<c:if test="${startPage > blockSize}">
					<a href="IngtList.do?pageNum=${startPage-blockSize}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="IngtList.do?pageNum=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<a href="IngtList.do?pageNum=${startPage+blockSize}">[다음]</a>
				</c:if>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>