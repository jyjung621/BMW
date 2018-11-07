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
<title>브랜드 리스트</title>
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
								<h2>브랜드별 제품을 확인해 보세요!</h2>
							</header>
						</section>
	<table border="1" style="margin: auto;">
		<c:forEach var="itemInfo" items="${list }">
			<tr>
				<td><img src="/BMW/images/${itemInfo.brand }.jpg" width="100" height="100"></td>
				<td><a href='/BMW/item/brandList1.do?brand=${itemInfo.brand }'>${itemInfo.brand }</a></td>
			</tr>
		</c:forEach>

	</table>
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