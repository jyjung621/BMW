<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../partials/head.jsp" %>
<style>
	.container{
		margin: 0 auto;
	}
</style>
<title>BMW 이벤트</title></head>
<body>
<header><%@ include file="../partials/header.jsp" %></header>
<div class="container">
	<table>
		<tr>
			<td>
			<c:if test="${list.size() != 0 }">
				<c:forEach var="i" begin = "${currentPage-1 }" end = "${currentPage-1 }">
					<a href="BoardContent.do?boardNo=${list.get(i).getBoardNo() }">
						<img src="/bmw/img/${saveFiles.get(i).getSavedFileName()}" alt="" width="800" height="800" />
					</a>
				</c:forEach>
			</c:if>
			<c:if test="${list.size() == 0 }">
				<h1>진행중인 이벤트가 없습니다. ㅠㅠ</h1>
			</c:if>
			</td>
		</tr>
		<tr>
			<td align="center">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="EventList.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
					<a href="EventList.do?currentPage=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="EventList.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
				</c:if>
			</td>
		</tr>
	</table>
</div>


<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>