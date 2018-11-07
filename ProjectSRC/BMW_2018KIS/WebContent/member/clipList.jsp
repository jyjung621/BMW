<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 스크랩</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css" type="text/css">
<!-- <link rel="stylesheet" href="maincss/assets/css/main.css" /> -->
<style type="text/css">
* {
	box-sizing: border-box;
}

table {
	width: 100%;
}

body {
	margin: 0;
}

/* Style the header */
.header {
	background-color: #f1f1f1;
	padding: 20px;
	text-align: center;
}

/* Style the top navigation bar */
.topnav {
	overflow: hidden;
	background-color: #333;
}

/* Style the topnav links */
.topnav a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.photo2 {   /* 직사각형 사진에 적용 */
    width: 100px; height: 100px;
    object-fit: cover;
    object-position: top;
    border-radius: 50%;
}
.photo3 {   /* 정사각형 사진에 적용 */
    width: 100px; height: 100px;
    object-fit: cover;
    border-radius: 50%;
}
</style>
</head>

<body>
<%@ include file="../header.jsp"%>
<%@ include file="../myHeader.jsp" %>
	<c:if test="${gubun == 1 }">
		<h2>스크랩한 리뷰</h2>
	<tr>	
		<td><input type="button" value="게시글 보기" onclick="location.replace('clipList.do?view=2')"></td>&nbsp; &nbsp; &nbsp;
		<c:if test="${totCnt > 0 }">
			<td><input type="button" value="편집" onclick="location.replace('clipList.do?pageNum=${currentPage}&view=1&gubun=1')"></td>
		</c:if>

	</tr>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>리뷰 번호</th>
			<th>스크랩 일시</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="clip" items="${list }">
				<tr>
					<td>${startNum }</td>
					<td class="left" width=200>
						<a href='content.do?num=${clip.mainNo}&pageNum=${currentPage}'>${clip.title}</a>
<%-- 								글내용.do? num=${clip.mainno} --%>
					</td>
					<td>${clip.subNo}</td>
					<td>${clip.regDate}</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>스크랩한 리뷰가 없습니다</td>
			</tr>
		</c:if>
	</table>

	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='clipList.do?pageNum=${startPage-blockSize}&view=1'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='clipList.do?pageNum=${i}&view=1'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='clipList.do?pageNum=${startPage+blockSize}&view=1'>[다음]</a>
		</c:if>
	</div>
	</c:if>
	
	<c:if test="${gubun == 2 }">
		<h2>스크랩한 게시글</h2>
	<tr>	
		<td><input type="button" value="리뷰 보기" onclick="location.replace('clipList.do?view=1')"></td>&nbsp; &nbsp; &nbsp;
		<c:if test="${totCnt > 0 }">
			<td><input type="button" value="편집" onclick="location.replace('clipList.do?pageNum=${currentPage}&view=2&gubun=2')"></td>
		</c:if>
	</tr>
	<table>
		<tr>
			<th>게시글 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>스크랩 일시</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="clip" items="${list }">
				<tr>	
					<td>${clip.mainNo }</td>
					<td class="left" width=200>
						<a href='content.do?num=${clip.mainNo}&pageNum=${currentPage}'>${clip.title}</a>
					</td>
					<td>${clip.memberId}</td>
					<td>${clip.regDate}</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>스크랩한 게시글이 없습니다</td>
			</tr>
		</c:if>
	</table>
	
	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='clipList2.do?pageNum=${startPage-blockSize}&view=2'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='clipList2.do?pageNum=${i}&view=2'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='clipList2.do?pageNum=${startPage+blockSize}&view=2'>[다음]</a>
		</c:if>
	</div>
	</c:if>
	<%@ include file="../footer.jsp"%>
</body>
</html>