<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/form-elements.css">
<link rel="stylesheet" href="assets/css/style.css">

<title>로그인페이지</title>
<!-- Favicon and touch icons -->
<link rel="shortcut icon" href="assets/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="assets/ico/apple-touch-icon-57-precomposed.png">

<script>
	$(document).ready(function() {
		$("#btnLogin").click(function() {
			// 태그.val() : 태그에 입력된 값
			// 태그.val("값") : 태그의 값을 변경
			var memberId = $("#memberId").val();
			var passwd = $("passwd").val();
			if (memberId == "") {
				alert("아이디를 입력하세요");
				$("#memberId").focus(); //입력 포커스 이동
				return; // 함수 종료
			}
			if (passwd == "") {
				alert("아이디를 입력하세요.");
				$("#passwd").focus();
				return;
			}
			/* 			// 폼 내부의 데이터를 전송할 주소
			 document.form1.action.value="KJWloginCheck";
			 // 제출
			 document.form1.submit(); */
		});

	});
</script>
</head>
<body>
<header><%@ include file="../partials/header.jsp" %></header>
<!-- Top content -->
<div class="top-content">

	<div class="inner-bg">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2 text">
					<h1>
						<strong>Bootstrap</strong> Login Form
					</h1>
					<!-- <div class="description">
						<p>
							This is a free responsive login form made with Bootstrap.
							Download it on <a href="http://azmind.com"><strong>AZMIND</strong></a>,
							customize and use it as you like!
						</p>
					</div> -->
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3 form-box">
					<div class="form-top">
						<div class="form-top-left">
							<h3>Login to our site</h3>
							<p>BMW에서 다양한 혜택을 받아보세요!</p>
						</div>
						<!-- <div class="form-top-right">
							<i class="fa fa-lock"></i>
						</div> -->
					</div>
					<div class="form-bottom">
						<form role="form" action="KJWloginCheck.do" method="post"
							class="login-form">
							<div class="form-group">
								<label class="sr-only" for="form-username">USER ID</label> <input
									type="text" name="memberId" placeholder="USER ID..."
									class="form-username form-control" id="memberId">
							</div>
							<div class="form-group">
								<label class="sr-only" for="form-password">Password</label> <input
									type="password" name="passwd" placeholder="Password..."
									class="form-password form-control" id="passwd">
							</div>
							<button type="submit" class="btn" id="btnlogin">Sign in!</button>
							<c:if test="${msg == 'failure' }">
								<div style="color: red">아이디 또는 비밀번호가 일치하지 않습니다.</div>
							</c:if>


							<div class="form-bottom-left">
								<p>
									<a href="KJWFindId.do">아이디/비밀번호 찾기</a>
								</p>
							</div>
							<div class="form-bottom-right">
								<p>
									<a href="#">회원가입</a>
								</p>
							</div>
						</form>


						<!-- <form role="form" action="KJWloginCheck.do" method="post" class="login-form">
							<div class="form-group">
								<label class="sr-only" for="form-username">Username</label> <input
									type="text" name="form-username" placeholder="Username..."
									class="form-username form-control" id="form-username">
							</div>
							<div class="form-group">
								<label class="sr-only" for="form-password">Password</label> <input
									type="password" name="form-password" placeholder="Password..."
									class="form-password form-control" id="form-password">
							</div>
							<button type="submit" class="btn">Sign in!</button>
						</form> -->
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3 social-login">
					<h3>...or login with:</h3>
					<div class="social-login-buttons">
						<a class="btn btn-link-2" href="#"> <i class="fa fa-facebook"></i>
							Facebook
						</a> <a class="btn btn-link-2" href="#"> <i class="fa fa-twitter"></i>
							Twitter
						</a> <a class="btn btn-link-2" href="#"> <i
							class="fa fa-google-plus"></i> Google Plus
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>


<!-- 
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="#"> <b>BMW</b>환영합니다
			</a>
		</div>
		login-logo
		<div class="login-box-body">
			<p class="login-box-msg">로그인 페이지</p>
			<form action="KJWloginCheck.do" name="form1" method="post">
				<div class="form-group has-feedback">
					<input type="text" name="memberId" id="memberId"
						class="form-control" placeholder="아이디"> <span
						class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="passwd" id="passwd"
						class="form-control" placeholder="비밀번호"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>

				/.col
				<div class="col-xs-4">
					<button type="submit" class="btn btn-primary btn-block btn-flat">
						<i class="fa fa-sign-in"></i>로그인
					</button>
				</div>

				/.col
			</form>
		</div>

		<div class="social-auth-links text-center">
			<p>-또는-</p>
			<a href="#" class="btn btn-block btn-social btn-facebook btn-flat">
				<i class="fa fa-facebook"></i>페이스북으로 로그인
			</a> <a href="#" class="btn btn-block btn-social btn-google btn-flat">
				<i class="fa fa-google-plus"></i>구글 계정으로 로그인
			</a>
		</div>
		/.social-auth-links

		<a href="#">비밀번호 찾기</a><br> <a href="KJWJoin.do"
			class="text-center">회원가입</a>
	</div>
 -->


<%-- <header><%@ include file="../partials/header.jsp" %></header>

<h2>로그인</h2>
	<form action="KJWloginCheck.do" name="form1" method="post">
		<table border="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input name="memberId" id="memberId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd" id="passwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" id="btnLogin">로그인</button>
				<c:if test="${msg == 'failure' }">
					<div style="color:red">
						아이디 또는 비밀번호가 일치하지 않습니다.
					</div>
				</c:if>
				<c:if test="${msg == 'logout' }">
					<div style="color:red">
					로그아웃 되었습니다
					</div>
				</c:if>
				</td>
			</tr>
		</table>
	</form>
--%>
<!-- Javascript -->
<script src="assets/js/jquery-1.11.1.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.backstretch.min.js"></script>
<script src="assets/js/scripts.js"></script>

<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>