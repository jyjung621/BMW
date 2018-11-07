<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="KJWError.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="maincss/assets/css/main.css" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 화면</title>
<style type="text/css">
table {
	width: 70%;
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
	text-align: center;
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
								<h2>로그인</h2>
							</header>
						</section>


						<form action="KJWloginPro.do">
							<section id="login">
								<table align="center" border="0"
									style="background-color: none; border: dotted 5px none; margin: auto;">
									<tr colspan="2">

										<div id="middle-title" style="text-align: center;">아이디와
											패스워드를 입력하세요.</div>
									</tr>
									<tr>

										<th width="200" class="title">아이디</th>
										<td align="left"><input type="text" name="memberId"
											required="required"></td>
									</tr>
									<tr>
										<th class="title">패스워드</th>
										<td><input type="password" name="passwd"
											required="required"></td>
									</tr>
								</table>
								<div style="text-align: center;">

									<input type="submit" value="로그인"> <input type="button"
										value="회원가입" onclick="location.href='writeAgree.jsp'">
									<input type="button" value="아이디/패스워드 찾기"
										onclick="location.href='KJWsearchIdForm.jsp'">
								</div>
							</section>
						</form>
					</div>
				</div>
			</div>
		</section>

	</div>

	<div id="footer">
		<jsp:include page="../footer.jsp" />
	</div>


</body>
</html>