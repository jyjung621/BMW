<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="KJWmemberCheck.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가 쓴 댓글</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

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

th {
	background-color: #ddd;
}
th.title {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

td {
	background-color: #eee;
	text-align: center;
	
}
td.align01 {
	display: table-cell;
	vertical-align: middle;
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
	function del_chk(a, b) {
		if (confirm("정말 삭제 하시겠습니까?") == true) {
			location.href="CommentsDeletePro.do?mainNo="+a+"&subNo="+b+"&pageNum=${pageNum}";
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
							style="padding-left: 0px; padding-top: 40px; padding-bottom: 40px; height: 100%;">
							<a href="clipList.do?view=1">나의 스크랩</a> 
							<a href="/BMW/member/ReviewList.do?memberId=${sessionId}">내가 쓴 리뷰</a> 
							<a href="/BMW/member/CommentsList.do?memberId=${sessionId }">내가 쓴 댓글</a> 
							<a href="/BMW/member/KJWupdateForm.do?memberId=${sessionId }">회원정보수정</a>
						</div>

				<section style="width: 85%;">
				<div>
					<!-- Blog -->
					<section> <header class="major"
						style="margin-bottom: 0px;">
					<h2>내가 쓴 댓글</h2>
					</header> </section>

											
						<table>
							<tr>
								<th class="title" witdh="50">번호</th>
								<th class="title">내용</th>
								<th class="title" witdh="50">분류</th>
								<th class="title" witdh="50">리뷰 번호</th>
								<th class="title" witdh="120">댓글 일시</th>
							</tr>
							<c:if test="${totCnt > 0 }">
							
								<c:forEach var="comments" items="${list }">
								<c:if test="${comments.ref_Table != 'ITEMINFO' }">
									<tr>
										<td class="align01">${startNum }</td>
										<td class="align01">${comments.content }</td>
										<td class="align01">
											<c:choose>
												<c:when test="${comments.ref_Table eq 'REVIEW'}">리뷰</c:when>
												<c:when test="${comments.ref_Table eq 'BOARD'}">게시글</c:when>
											</c:choose>
										</td>
										<td class="align01">${comments.subNo}</td>
										<td class="align01">${comments.regDate}
										<input type="button" value="삭제"  onClick="del_chk(${comments.mainNo}, ${comments.subNo})" style="float: right; padding: 10px 20px;"></td>
									</tr>
									<c:set var="startNum" value="${startNum + 1 }" />
								</c:if>
								
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
				</div>
				</section>
			</div>
		</div>
		</section>
	</div>

	<%@ include file="../footer.jsp"%>
</body>
</html>
