<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 댓글</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css" type="text/css">
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
</style>


<script type="text/javascript">
function del_chk(a, b, c) {
	document.write(c);
	if (confirm("정말 삭제 하시겠습니까?") == true) {
		location.href="CommentsDeletePro.do?mainNo="+a+"&subNo="+b+"&ref_Table="+c+"&pageNum=${pageNum}";
	} else {
	 	return;
	}
}

/*
 	function del_chk(a, b) {
		if (confirm("정말 삭제 하시겠습니까?") == true) {
			location.href="CommentsDeletePro.do?mainNo="+a+"&subNo="+b+"&pageNum=${pageNum}";
		} else {
		 	return;
		}
	}*/ 
</script>

</head>

<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../myHeader.jsp"%>
	<h2>댓글 목록</h2>
	<table>
		<tr>
			<th>번호</th>
			<th>내용</th>
			<th>참조 테이블</th>
			<th>리뷰 번호</th>
			<th>댓글 일시</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="comments" items="${list }">
				<tr>
					<td>${startNum }</td>
					<%-- <td class="left" width=200><a
						href='content.do?num=${comments.mainNo}&pageNum=${currentPage}'>${comments.title}</a>
														글내용.do? num=${clip.mainno}</td> --%>
					<td>${comments.content }</td>
					<td>${comments.ref_Table }</td>
					<td>${comments.subNo}</td>
					<td>${comments.regDate}<input type="button" value="삭제"
						onClick="del_chk(${comments.mainNo}, ${comments.subNo}, '${comments.ref_Table }')"></td>
				</tr>
				<c:set var="startNum" value="${startNum + 1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>댓글을 입력한 게시물이 없습니다</td>
			</tr>
		</c:if>
	</table>

	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='CommentsList.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='CommentsList.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='CommentsList.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div> 
	<%@ include file="../footer.jsp"%>
</body>
</html>
