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
<link rel="stylesheet" href="assets/css/main.css" />
<style type="text/css">
table {
	width: 100%;
	margin: auto;
	text-align: center;
}

th {
	background-color: #ddd;
	text-align: center;
}

th.title {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

td {
	text-align: center;
	background-color: #eee;
}
td.writeBtn {
	align: left;
}
td.cate {
	align: right;
}

caption {
	text-align: center;
	font-size: x-large;
}
</style>
</head>
<body>

	<%@ include file="../header.jsp"%>
	<div id="page-wrapper">

		<!-- Main -->
		<section id="main">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Blog -->
					<section> <header class="major"
						style="margin-bottom: 0px;">
					<h2>${boardCategory } 게시판 목록</h2>
					</header> </section>
					<table>
						<tr>
							<div class="writeBtn" style="float:left;">
							<c:if test="${grade < 3 }">
							 	<a href="boardWriteForm.do?boardCategory=${boardCategory }"><button>글쓰기</button></a>
							 </c:if>
							</div>
							<div style="float:right;">
								<form action="boardList.do">
									<select id="boardCategory" name="boardCategory" style="width: 100px; height: 30px;">
										<option value="free" <c:if test="${boardCategory == '자유' }">selected</c:if>>자유</option>
										<option value="info" <c:if test="${boardCategory == '정보' }">selected</c:if>>정보</option>
										<option value="QnA" <c:if test="${boardCategory == 'QnA'}">selected</c:if>>QnA</option>
									</select>
									<input type="submit" value="이동" style="font-size: 0.8em;">
								</form>
							</div>
						</tr>

						<tr>
							<th class="title" width="150">번호</th>
							<th class="title">제목</th>
							<th class="title">작성자</th>
							<th class="title">작성일</th>
							<th class="title">조회수</th>
						</tr>
						<c:if test="${totCnt > 0 }">
							<c:forEach var="board" items="${list}">
								<tr>
									<td>${startNum}</td>
									<td><a
										href='boardContent.do?boardNo=${board.boardNo }&pageNum=${currentPage}'>
											${board.title } </a></td>
									<td>${board.memberId }</td>
									<td>${board.regDate }</td>
									<td>${board.hits }</td>
								</tr>
								<c:set var="startNum" value="${startNum -1 }" />
							</c:forEach>
						</c:if>
						<c:if test="${totCnt == 0 }">
							<tr>
								<td colspan=7>게시글이 없습니다</td>
							</tr>
						</c:if>
					</table>


					<div style="text-align: center;">
						<c:if test="${startPage > blockSize }">
							<a href='boardList.do?pageNum=${startPage-blockSize }&boardCategory=${boardCategory}'>[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<a href='boardList.do?pageNum=${i}&boardCategory=${boardCategory}'>[${i}]</a>
						</c:forEach>

						<c:if test="${endPage > pageCnt }">
							<a href='boardList.do?pageNum=${startPage+blockSize }&boardCategory=${boardCategory}'>[다음]</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<!-- 	</form> -->
		</section>
	</div>

	<%@ include file="../footer.jsp"%>
</body>
</html>