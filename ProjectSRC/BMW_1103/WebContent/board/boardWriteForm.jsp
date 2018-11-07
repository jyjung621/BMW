<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성</title>
<link rel="stylesheet" href="../maincss/assets/css/main.css" />

</head>
<body>
	<%@ include file="../header.jsp"%>
	<div id="page-wrapper" align="center">
		<div id="main">
			<form action="boardWritePro.do?boardCategory=${category }&pageNum=${pageNum}" method="post" enctype="multipart/form-data">
			<%-- <form action="boardWritePro.do?category=${board.boardCategory}&pageNum=${pageNum}" method="post" enctype="multipart/form-data"> --%>
				<input type="hidden" name="boardNo" value="${boardNo}">
				<table>
					<caption>
						<h2>게시판 글쓰기</h2>
					</caption>
					<tr>
						<td>카테고리</td>
						<td>
							<select name = "boardCategory">
								<option value="자유">자유</option>
								<option value="정보">정보</option>
								<option value="QnA">QnA</option>
								<c:if test="${sessionScope.grade == 0}">
								<option value="웹진">웹진</option>
								</c:if>
							</select>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" required="required">
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<!-- <td><input type="text" name="memberId" required="required"></td> -->
						<%-- <td>${session.sessionId }</td> --%>
						<td><input type="hidden" name="memberId"
							value="${sessionScope.sessionId}">${sessionScope.sessionId}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="30" name="content"
								required="required"></textarea></td>
					</tr>
					<tr>
						<td>공개여부</td>
						<td><input type="radio" name="isPublic" value="1" checked>공개
							<input type="radio" name="isPublic" value="0">비공개</td>
					</tr>
					<tr>
						<td>이미지1</td>
						<td><input type="file" name="saveFiles1"></td>
					</tr>

					<tr>
						<td>이미지2</td>
						<td><input type="file" name="saveFiles2"></td>
					</tr>
					<tr>
						<td>이미지3</td>
						<td><input type="file" name="saveFiles3"></td>
					</tr>
					<tr>
						<td><input type="submit" value="확인"></td>
						<td><input type="reset" value="다시작성"></td>
					</tr>
				</table>
			</form>
		</div>
		<%@ include file="../footer.jsp"%>
</body>
</html>