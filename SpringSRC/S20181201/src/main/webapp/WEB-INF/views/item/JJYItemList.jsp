<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ItemList View</title>
</head>
<body>
	<header> <%@ include file="../partials/header.jsp"%>
	</header>

	<h2>Item List</h2>
	<table border="1" align="center">
		<button onclick="location.replace('JJYItemWriteForm.do')">제품 등록</button>
		<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		<tr>
			<td>
				<table>
					<tr>
					</tr>
				</table>
			</td>
			<td></td>
			<td></td>
		</tr>
		<c:if test="${total > 0 }">
			<c:forEach var="cate" items="${NYSCateList}">
				
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


	<footer> <%@ include file="../partials/footer.jsp"%>
	</footer>
</body>
</html>