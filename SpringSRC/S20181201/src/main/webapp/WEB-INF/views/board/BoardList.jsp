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
<title>Insert title here</title></head>
<body>
<header><%@ include file="../partials/header.jsp" %></header>
<div class="container">
	<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
	<a href="BoardWriteForm.do">글쓰기(임시)</a>
	<table>
		<tr>
			<th>번호</th>
			<th>보드넘버</th>
			<th>카테</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="SDBBoard" items="${list }">
			<tr>
				<td>${num }</td>
				<td>${SDBBoard.boardNo }</td>
				<td>${SDBBoard.boardCategory }</td>
				<td><a href="BoardContent.do?boardNo=${SDBBoard.boardNo }">${SDBBoard.title}</a></td>
				<td>${SDBBoard.memberId }</td>
				<td>${SDBBoard.hits }</td>
				<td>${SDBBoard.regDate }</td>
			</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
		<tr>
			<td colspan="8" align="center">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="BoardList.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
					<a href="BoardList.do?currentPage=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="BoardList.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
				</c:if>
			</td>
		</tr>
	</table>
		
</div>

<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>