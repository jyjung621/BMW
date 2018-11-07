<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BMW</title>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- <link rel="stylesheet" href="maincss/assets/css/main.css" /> -->
<%
	// String siteUrl = "http://localhost:8282/BMW/";
	String siteUrl = request.getServletContext().getContextPath() + "/";
%>
</head>

<body class="homepage is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">

		<h1>
			<a href="/BMW/index.jsp">BMW</a>
		</h1>

		<!-- Nav --> <nav id="nav">

		<ul>
			<c:choose>
				<c:when test="${empty sessionScope.sessionId}">
					<li class="current"><a href="<%=siteUrl%>member/KJWloginForm.jsp">LOGIN</a>
						<%-- <ul>
							<li style="text-align: center;"><a
								href="<%=siteUrl%>member/KJWloginForm.jsp">LOGIN</a></li>
							<li style="text-align: center;"><a
								href="<%=siteUrl%>member/writeForm.jsp">SIGN UP</a></li>
						</ul> --%>
					</li>
				</c:when>

				<c:otherwise>
					<li class="current"><a href="#">OUT!</a>
						<ul>
							<li style="text-align: center;"><a
								href="<%=siteUrl%>/member/KJWlogout.jsp">LOGOUT</a></li>
							<li style="text-align: center;"><a
								href="<%=siteUrl%>member/KJWMypageIndex.jsp">MY PAGE</a></li>
						</ul>
					</li>
				</c:otherwise>
			</c:choose>

			<li><a href="#">제품</a>
				<ul>
					<li style="text-align: center;"><a href="/BMW/item/itemIndex.jsp">제품 리스트</a></li>
					<li style="text-align: center;"><a href="/BMW/item/IngtList.do">성분 리스트</a></li>
					<li style="text-align: center;"><a href="/BMW/item/CategoryList.do">카테고리 리스트</a></li>
					<li style="text-align: center;"><a href="/BMW/ItemCategoryHeader.do">아이템 카테고리 헤더</a></li>
					<ul>
						<li><a href="#">Magna phasellus</a></li>
						<li><a href="#">Etiam dolore nisl</a></li>
						<li><a href="#">Veroeros feugiat</a></li>
						<li><a href="#">Nisl sed aliquam</a></li>
						<li><a href="#">Dolore adipiscing</a></li>
					</ul>
				
			</li>
			<li style="text-align: center;"><a href="#">Veroeros feugiat</a></li>
		</ul>
		</li>
		<li><a href="/BMW/item/brandList.do">브랜드</a></li>
		<li><a href="/BMW/board/SDBWebzineMain.do">웹진</a></li>
		<li><a href="<%=siteUrl%>board/boardList.do?boardCategory=자유">게시판</a></li>
		</ul>
		</nav> </section>
	</div>

	<!-- Scripts -->
	<script src="maincss/assets/js/jquery.min.js"></script>
	<script src="maincss/assets/js/jquery.dropotron.min.js"></script>
	<script src="maincss/assets/js/browser.min.js"></script>
	<script src="maincss/assets/js/breakpoints.min.js"></script>
	<script src="maincss/assets/js/util.js"></script>
	<script src="maincss/assets/js/main.js"></script>

</body>
</html>
