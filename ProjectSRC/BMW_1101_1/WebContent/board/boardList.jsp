<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="maincss/assets/css/main.css" />

</head>
<body>

	<%@ include file="../header.jsp"%>
	<div id="page-wrapper" align="center">
		<div id="main">
			<h2>게시판</h2>
			<table>
				<tr>
					<td><a href="boardWriteForm.do">글쓰기</a></td>
				</tr>
			</table>
			<form action="boardList.do" method="post" name="frm">
				<select name="boardCategory">
					<option value="free">자유</option>
					<option value="info">정보</option>
					<option value="QnA">QnA</option>
				</select>
				<input type="submit" value="바로가기">
			</form>
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>카테고리</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
		
				<c:if test="${totCnt > 0 }">
					<c:forEach var="board" items="${list}">
						<tr>
							<td>${startNum}</td>
							<td class="left" width="200"><a
								href='boardContent.do?boardNo=${board.boardNo }&pageNum=${currentPage}'>
									${board.title } </a></td>
							<td>${board.boardCategory }</td>
							<td>${board.memberId }</td>
							<td>${board.regDate }</td>
							<td>${board.hits }</td>
						</tr>
						<c:set var="startNum" value="${startNum -1 }" />
					</c:forEach>
				</c:if>
				<c:if test="${totCnt == 0 }">
					<tr>
						<td colspan=7>데이터가 없네</td>
					</tr>
				</c:if>
			</table>
			<div style="text-align: center;">
				<c:if test="${startPage > blockSize }">
					<a href='boardList.do?pageNum=${startPage-blockSize }'>[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<%-- <a href='boardList.do?pageNum=${i}'>[${i}]</a> --%>
					<a href='boardList.do?boardCategory=${boardCategory }&pageNum=${i}'>[${i}]</a>
				</c:forEach>

				<c:if test="${endPage > pageCnt }">
					<a href='boardList.do?pageNum=${startPage+blockSize }'>[다음]</a>
				</c:if>
			</div>
		</div>
		<%@ include file="../footer.jsp"%>
</body>
</html>