<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category List View</title>
</head>
<body>
<header><%@ include file="../partials/header.jsp" %></header>
	<h2>카테고리 List</h2>
		<table border="1" align="center">
		<a href="NYSCateWriteForm.do"><button>카테고리 등록</button></a>
		<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		<tr>
			<th class="title">No</th>
			<th class="title">카테고리 번호</th>
			<th class="title">카테고리 이름</th>
			<th class="title">상위 카테고리</th>
			<th class="title">공개여부</th>
			<th class="title">분류</th>
			<th class="title">수정/삭제</th>
		</tr>
		<c:if test="${total > 0 }">
			<c:forEach var="cate" items="${NYSCateList}">
				<tr>
					<td>${num}</td>
					<td>${cate.categoryNo}</td>
					<td><c:if test="${cate.division == 1}">└</c:if>${cate.name}</td>
					<td>${cate.parent}</td>
					<td>${cate.isPublic}</td>
					<td>${cate.division}</td>
					<td>
						<input type="button" value="수정" onclick="location.replace('NYSCateUpdate.do?categoryNo=${cate.categoryNo}')">
						<input type="button" value="삭제" onclick="location.replace('NYSCateDelete.do?categoryNo=${cate.categoryNo}')">						
					</td>
				</tr>
				<c:set var="num" value="${num-1}"></c:set>	
			</c:forEach>
		</c:if>
		<c:if test="${total == 0 }">
			<tr>
				<td colspan=7>데이터가 없음</td>
			</tr>
		</c:if>
	</table>

	<div style="text-align: center;">
	<c:if test="${pg.startPage > pg.pageBlock}">
		<a href="NYSCateList.do?currentPage=${pg.startPage - pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
		<a href="NYSCateList.do?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage}">
		<a href="NYSCateList.do?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	</c:if>
	</div>



<footer><%@ include file="../partials/footer.jsp" %></footer>

</body>
</html>