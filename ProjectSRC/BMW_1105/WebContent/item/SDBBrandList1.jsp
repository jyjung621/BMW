<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>브랜드 제품</title>

<style type="text/css">
table {
	width: 100%;
}

th {
	background-color: #ddd;
}
.title {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

td {
	background-color: #eee;
	text-align: center;
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
					<h2>${brand }의제품들</h2>
					</header> </section>

					<table border="1" style="margin: auto;">
						<tr>
							<th colspan=3>${brand }의제품들</th>
						</tr>
						<tr>
							<td colspan=3>제품 ${totCnt }개</td>

						</tr>
						<tr>
							<th class="title" width="200">상품별 이미지</th>
							<th class="title">제품명</th>
							<th class="title">가격</th>
						</tr>
						<c:forEach var="itemInfo" items="${list }">
							<tr>
								<td id="img1" >
									<img width="50%" height="auto" alt="${itemInfo.name }" src="/BMW${itemInfo.file }">
								</td>
								<td class="title"><a href='ItemContent.do?itemNo=${itemInfo.itemNo }'>${itemInfo.name }</a></td>
								<td class="title">${itemInfo.price }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		</section>
	</div>

	<!-- <footer0></footer0> -->
	<%@ include file="../footer.jsp"%>

</body>
</html>