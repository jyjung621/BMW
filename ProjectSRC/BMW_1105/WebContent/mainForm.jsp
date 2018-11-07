<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMW에 오신 것을 환영합니다.</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	/* $(function() {
	// header class에 상단페이지 붙이기
		$("header0").load('./main/header.jsp');
	// footer class에 하단페이지 붙이기
	$("footer0").load('../footer.jsp');
	}); */
</script>
<link rel="stylesheet"
	href="http://localhost:8282/BMW/maincss/assets/css/main.css" />

<style type="text/css">
</style>
</head>
<body>
	<!-- <header0></header0> -->
	<div>
		<%@ include file="header.jsp"%>
	</div>

	<div id="page-wrapper">

		<!-- Banner -->
		<section id="banner" style="margin-top: 0px;">
			<header>
				<h2>유저들이 뽑은 랭킹</h2>
				<p>A responsive template by HTML5 UP</p>
			</header>
		</section>
		<!-- Main -->
		<section id="main">
	<%-- 		<jsp:include page="/board/SDBwebzineGo.jsp"/> --%>
		</section>
		<%-- 	<div id="header"><jsp:include page="KJWheader.jsp" /></div>  --%>

		<%-- 	<div id="main" style="padding-top: 0px; padding-bottom: 0px;">
			<!-- contentPage가 없을 경우 body.jsp를 보여준다. -->
 			<c:set var="contentPage" value="${param.contentPage}" />
			<c:if test="${contentPage==null}">
			<jsp:include page="body.jsp" />
			</c:if> 
			<jsp:include page="KJWbody.jsp" />
		</div> --%>

		<%-- 		<div id="footer" style="background-color: white;
		padding-top: 10px;padding-bottom: 10px; background-color: white;">
			<jsp:include page="KJWfooter.jsp" />
		</div>  --%>


	</div>


	<!-- <footer0></footer0> -->
	<div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>