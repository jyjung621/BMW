<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 리뷰</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
* {
	box-sizing: border-box;
}

table {
		width : 100%;
		margin : auto;
		text-align : center;
	}
	th {
		background-color: #ddd;
		text-align: center;
	}
	th.title {
		text-align:center;
		display: table-cell;
		vertical-align: middle;
	}
	td {
		text-align: left;
		background-color: #eee;
	}
	caption {
		text-align: center;
		font-size: x-large;
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
	background-color: #d52349;
}

/* Style the topnav links */
.topnav a {
	float: none;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
	background-color: #eee;
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
</script>

</head>

<body>
<%@ include file="../header.jsp"%>
<div id="page-wrapper">
		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="topnav"
						style="padding-left: 0px; padding-bottom: 40px; padding-top: 40px; height: 100%;">
						<a href="clipList.do?view=1">나의 스크랩</a> 
							<a href="/BMW/member/ReviewList.do?memberId=${sessionId}">내가 쓴 리뷰</a> 
							<a href="/BMW/member/CommentsList.do?memberId=${sessionId }">내가 쓴 댓글</a> 
							<a href="/BMW/member/KJWupdateForm.do?memberId=${sessionId }">회원정보수정</a>
					</div>
					<section style="width: 85%;">
		<!-- Blog -->
		<section>
			<header class="major" style="margin-bottom: 0px;">
				<h2>내가 쓴 리뷰</h2>
			</header>
		</section>
	<table>
		<tr>
			<th>번호</th>
			<th>내용</th>
			<th>제품 정보</th>
			<th>리뷰 번호</th>
			<th>작성 일시</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="comments" items="${list }">
				<tr>
					<td>${startNum }</td>
					<td>${comments.content }</td>
					<td>${comments.itemName }</td>
					<td>${comments.subNo}</td>
					<td>${comments.regDate}<input type="button" value="삭제"
						onClick="del_chk(${comments.mainNo}, ${comments.subNo}, '${comments.ref_Table }')"></td>
				</tr>
				<c:set var="startNum" value="${startNum + 1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>작성한 리뷰가 없습니다</td>
			</tr>
		</c:if>
	</table>

	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='ReviewList.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='ReviewList.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='ReviewList.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div> 
<!-- 	</form> -->
	</div>
	</div>
	</div>
	</section>
	</div>
	<!-- <footer0></footer0> -->
<%@ include file="../footer.jsp"%>
</body>
</html>
