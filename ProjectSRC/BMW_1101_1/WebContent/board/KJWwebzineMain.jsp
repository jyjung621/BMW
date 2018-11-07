
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../SessionCheck.jsp"%>
<%-- <%@ include file="../member/KJWmemberCheck.jsp"%> --%>



<!DOCTYPE html>
<html>
<head>

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<link rel="stylesheet"
	href="http://localhost:8282/BMW/maincss/assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BMW 웹진</title>
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
						<section>
							<header class="major" style="margin-bottom: 0px;">
								<h2>Web-Zine</h2>
							</header>
						</section>
						<!-- 	<section style="margin-bottom: 0px;">
						<tr style="text-align: right;">
									<td>카테고리</td>
									<td><select name="category" required="required">
											<option value="makeup">메이크업</option>
											<option value="hotitem" selected="selected">인기템</option>
											<option value="haircare">헤어케어</option>
											<option value="diet">다이어트</option>
									</select></td>
								</tr>
					</section>	 -->

						<tr>
							<td>
								<!-- 			<a href="KJWwebzineList.do">웹진 리스트보기 (관리자)</a> --> <c:if
									test="${grade == '0'}">
									<tr>
										<td><a href="../board/boardList.do?boardCategory=웹진">웹진
												리스트보기 (관리자)</a></td>
									</tr>
								</c:if>


							</td>
						</tr>
						<!-- 						<form action="KJWwebzineList.do" name="frm" method="post"> -->

					<%-- 	<c:forEach var="board" items="${list }">
							<div class="row">
								<div class="col-6 col-12-small">
									<section class="box">
										<a href='boardContent.do?boardNo=${board.boardNo }&pageNum=${currentPage}'"
											class="image featured"><img
											src="maincss/images/pic08.jpg" alt="" /></a>
										<header>
											<h3>
												<a href='boardContent.do?boardNo=${board.boardNo }&pageNum=${currentPage}'> ${board.title } </a>
												</td>
											</h3>
											<p>${board.memberId }</p>
										</header>

										<a href='boardContent.do?boardNo=${board.boardNo }&pageNum=${currentPage}'>
										<p>${board.content }</p></a>
										<footer>
											<ul class="actions">
												<li><a href='boardContent.do?boardNo=${board.boardNo }&pageNum=${currentPage}'
													class="button icon fa-file-text">Continue Reading</a></li>
												<li><a href="#" class="button alt icon fa-comment">
														comments</a></li>
											</ul>
										</footer>
									</section>
								</div>
							</div>
						</c:forEach> --%>


						<c:forEach var="i" begin ="0" end="5" step="2">
							<div class="row">
								<div class="col-6 col-12-small">
									<section class="box">
										<a href='boardContent.do?boardNo=${list.get(i).getBoardNo() }&pageNum=${currentPage}'
											class="image featured"><img
											src="/BMW${savefiles.get(i).getFilePath() }/${savefiles.get(i).getSavedFileName()}" alt="" width="570" height="272" /></a>
										<header>
											<h3>
												<a href='boardContent.do?boardNo=${list.get(i).getBoardNo() }&pageNum=${currentPage}'>
													${list.get(i).getTitle() } </a>
												</td>
											</h3>
											<p>${list.get(i).getMemberId()}</p>
										</header>
										<a href='boardContent.do?boardNo=${list.get(i).getBoardNo() }&pageNum=${currentPage}'>
										<p>
										${list.get(i).getContent()}
										</p></a>
										<footer>
											<ul class="actions">
												<li><a
													href='boardContent.do?boardNo=${list.get(i).getBoardNo() }&pageNum=${currentPage}'
													class="button icon fa-file-text">Continue Reading</a></li>
												<li><a href="#" class="button alt icon fa-comment">
													comments</a></li>
											</ul>
										</footer>
									</section>
								</div>
								<div class="col-6 col-12-small">
									<section class="box">
										<a href='boardContent.do?boardNo=${list.get(i+1).getBoardNo() }&pageNum=${currentPage}'
											class="image featured"><img
											src="/BMW${savefiles.get(i+1).getFilePath() }/${savefiles.get(i+1).getSavedFileName()}" alt="" width="570" height="272"/></a>
										<header>
											<h3>
												<a href='boardContent.do?boardNo=${list.get(i+1).getBoardNo() }&pageNum=${currentPage}'>
													${list.get(i+1).getTitle() } </a>
												</td>
											</h3>
											<p>${list.get(i+1).getMemberId()}</p>
										</header>
										<a href='boardContent.do?boardNo=${list.get(i+1).getBoardNo() }&pageNum=${currentPage}'><p>${list.get(i+1).getContent()}</p></a>
										<footer>
											<ul class="actions">
												<li><a
													href='boardContent.do?boardNo=${list.get(i+1).getBoardNo() }&pageNum=${currentPage}'
													class="button icon fa-file-text">Continue Reading</a></li>
												<li><a href="#" class="button alt icon fa-comment">
													comments</a></li>
											</ul>
										</footer>
									</section>
								</div>
						</c:forEach>
						<!-- 	</form> -->
		</section>

	</div>
	</div>
	</div>
	</section>
	</div>


	<!-- <footer0></footer0> -->
	<%@ include file="../footer.jsp"%>
</body>
</html>