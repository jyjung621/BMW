<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 스크랩</title>
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
</head>

<body>
<header><%@ include file="../partials/header.jsp" %></header>
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
								<section>
									<header class="major" style="margin-bottom: 0px;">
										<h2>스크랩</h2>
									</header>
								</section>
								<c:if test="${view == 1 }">
									<h2>스크랩한 리뷰</h2><br>
									<tr>
										<td><input type="button" value="게시글 보기" onclick="location.replace('clipList.do?view=2')"></td>
										<c:if test="${totCnt > 0 }">
											<td><input type="button" value="편집" onclick="location.replace('clipList.do?pageNum=${currentPage}&view=1&gubun=1')"></td>
										</c:if>
									</tr>
									<table>
										<tr>
											<th class="title" width="50">제품번호</th>
											<th class="title">제목</th>
											<th class="title" width="80">리뷰 번호</th>
											<th class="title" width="120">스크랩 일시</th>
										</tr>
										<c:if test="${totCnt > 0 }">
											<c:forEach var="clip" items="${list }">
												<tr>
													<td>${clip.mainNo }</td>
													<td class="left" width=200>
													<a href='/BMW/item/ItemReviewContent.do?itemNo=${clip.mainNo}&reviewNo=${clip.subNo }'>${clip.title}</a>
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

								<c:if test="${view == 2 }">
									<h2>스크랩한 게시글</h2><br>
									<tr>
										<td><input type="button" value="리뷰 보기" onclick="location.replace('clipList.do?view=1')"></td>
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
													<a href='/BMW/board/boardContent.do?boardNo=${clip.mainNo }'>${clip.title}</a>
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
								<!-- 	</form> -->
							</div>
						</section>

					</div>
				</div>
		</section>
	</div>


	<!-- <footer0></footer0> -->
<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>