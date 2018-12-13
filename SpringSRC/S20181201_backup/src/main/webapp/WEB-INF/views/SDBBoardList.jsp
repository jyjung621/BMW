<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="partials/head.jsp" %>

<title>Insert title here</title></head>
<body>
<h2>게시글 목록</h2>
<header><%@ include file="partials/header.jsp" %></header>



<c:forEach var="i" begin="1" end="10">
	<p>a</p>
</c:forEach>
<!-- <a href="">입력</a> -->

<%--< c:set var="num" value="${pg.total-pg.start+1}"></c:set>
<table>
	<tr><th >번호</th><th>카테</th><th>제목</th><th>내용</th><th>작성자</th></tr>
	<c:forEach var="emp" items="${list }">
		<tr><td>${num }</td><td>${board.Category }</td>
		<td><a href="">${board.title}</a></td>
			<td>${board.content }</td><td>${board.memberId }</td></tr>
		<c:set var="num" value="${num - 1 }"></c:set>
	</c:forEach>
</table>
<c:if test="${pg.startPage > pg.pageBlock }">
	<a href="">[이전]</a>
</c:if>
<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
	<a href="">[${i}]</a>
</c:forEach>
<c:if test="${pg.endPage < pg.totalPage }">
	<a href="">[다음]</a>
</c:if> --%>

<footer><%@ include file="partials/footer.jsp" %></footer>
</body>
</html>