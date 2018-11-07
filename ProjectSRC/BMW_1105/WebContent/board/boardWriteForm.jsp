<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessionCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성</title>
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
	text-align: left;
	background-color: #eee;
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
						<section>
							<header class="major" style="margin-bottom: 0px;">
								<h2>게시판 글쓰기</h2>
							</header>
						</section>

						<form action="boardWritePro.do?pageNum=${pageNum}" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="boardNo" value="${boardNo}">
							<table>
								<tr>
									<th class="title" width="200">카테고리</th>
									<td><select name="boardCategory">
											<option value="자유">자유</option>
											<option value="정보">정보</option>
											<option value="QnA">QnA</option>
											<c:if test="${sessionScope.grade == 0}">
												<option value="웹진">웹진</option>
											</c:if>
									</select></td>
								</tr>
								<tr>
									<th class="title">제목</th>
									<td><input type="text" name="title" style="width: 100%" required="required">
									</td>
								</tr>
								<tr>
									<th class="title">작성자</th>
									<!-- <td><input type="text" name="memberId" required="required"></td> -->
									<%-- <td>${session.sessionId }</td> --%>
									<td><input type="hidden" name="memberId"
										value="${sessionScope.sessionId}">${sessionScope.sessionId}</td>
								</tr>
								<tr>
									<th class="title">내용</th>
									<td><textarea style="width: 100%; height: 100px;" name="content"
											required="required"></textarea></td>
								</tr>
								<tr>
									<th class="title">공개여부</th>
									<td><input type="radio" name="isPublic" value="1" checked>공개
										<input type="radio" name="isPublic" value="0">비공개</td>
								</tr>
								<tr>
									<th class="title">이미지1</th>
									<td><input type="file" name="saveFiles1"></td>
								</tr>

								<tr>
									<th class="title">이미지2</th>
									<td><input type="file" name="saveFiles2"></td>
								</tr>
								<tr>
									<th class="title">이미지3</th>
									<td><input type="file" name="saveFiles3"></td>
								</tr>
							</table>
							<div align="center">
								<input type="submit" value="확인"> <input type="reset"
									value="다시작성"> <input type="button" value="목록가기"
									onclick="history.go(-1)">
							</div>
						</form>

					</div>
				</div>
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