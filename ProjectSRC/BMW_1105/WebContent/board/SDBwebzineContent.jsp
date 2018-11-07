
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessionCheck.jsp"%>
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

<style type="text/css">
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
</style>

<title>BMW 웹진</title>
</head>
<body>
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
								<c:if test="${grade == '0'}">
									<tr>
										<th><a href="../board/boardList.do?boardCategory=웹진">웹진 리스트보기 (관리자)</a></th>
									</tr>
								</c:if>

						<c:forEach var="i" begin="0" end="5" step="2">
							<div class="row">
								<div class="col-6 col-12-small">
									<section class="box">
										<a
											href='boardContent.do?boardNo=${list.get(i).getBoardNo() }&pageNum=${currentPage}'
											class="image featured"><img
											src="/BMW${savefiles.get(i).getFilePath() }/${savefiles.get(i).getSavedFileName()}"
											alt="" width="570" height="272" /></a>
										<header>
											<h3>
												<a href='boardContent.do?boardNo=${list.get(i).getBoardNo() }&pageNum=${currentPage}'>
													${list.get(i).getTitle() } </a>
											</h3>
											<p>${list.get(i).getMemberId()}</p>
										</header>
										<a href='boardContent.do?boardNo=${list.get(i).getBoardNo() }&pageNum=${currentPage}'>
											<p>${list.get(i).getContent()}</p>
										</a>
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
										<a
											href='boardContent.do?boardNo=${list.get(i+1).getBoardNo() }&pageNum=${currentPage}'
											class="image featured"><img
											src="/BMW${savefiles.get(i+1).getFilePath() }/${savefiles.get(i+1).getSavedFileName()}"
											alt="" width="570" height="272" /></a>
										<header>
											<h3>
												<a href='boardContent.do?boardNo=${list.get(i+1).getBoardNo() }&pageNum=${currentPage}'>
													${list.get(i+1).getTitle() } </a>
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
							</div>
						</c:forEach>
						<!-- 	</form> -->

	</div>
	</div>
	</div>
	</section>
	</div>

</body>
</html>