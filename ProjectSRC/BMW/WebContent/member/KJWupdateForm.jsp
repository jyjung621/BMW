<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessionCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

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
						<a href="/BMW/member/CommentsList.do?memberId=<%=sessionId%>">내가 쓴 댓글</a> 
						<a href="/BMW/member/KJWupdateForm.do?memberId=<%=sessionId%>">회원정보수정</a>
					</div>

					<section style="width: 85%;">

						<form action="KJWupdatePro.do" method="post">
							<!-- 수정완료 submit 하면 updatePro로 감 -->

							<!-- Blog -->
							<section>
								<header class="major" style="margin-bottom: 0px;">
									<h2>회원정보수정</h2>
								</header>
							</section>

							<table border="1">
								<tr>
									<th class="title" width="200">아이디</th>
									<td><input type="hidden" name="memberId"
										required="required" value="${memberId}">${memberId}</td>

								</tr>
								<tr>
									<th class="title">암호</th>
									<td><input type="text" name="passwd" required="required"
										value="${passwd}"></td>
								</tr>
								<tr>
									<th class="title">이름</th>
									<td><input type="text" name="name" required="required"
										value="${name}"></td>
								</tr>
								<tr>
									<th class="title">주소</th>
									<td><input type="text" name="address" required="required"
										value="${address}"></td>
								</tr>
								<tr>
									<th class="title">전화번호</th>
									<td><input type="tel" name="phone" value="${phone}"></td>
								</tr>
								<tr>
									<th class="title">수정날짜</th>
									<td><input type="hidden" name="joinDate"
										required="required" value="${joinDate}">${joinDate}</td>
								</tr>
							</table>
							<div align="center">
								<input type="submit" value="수정완료">
							</div>
						</form>
						</section>
						</div>
						</div>
						</section>
						</div>
			
						<%@ include file="../footer.jsp"%>
</body>
</html>