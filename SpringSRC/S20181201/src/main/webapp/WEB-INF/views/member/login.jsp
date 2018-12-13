<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="hold-transition login-page">
<div class="login-box">
	<div class="login-logo">
		<a href="${path }/">
			<b>DoubleS</b>&nbsp MVC-BOARD
		</a>
	</div>
	<!-- login-logo -->
	<div class="login-box-body">
		<p class="login-box-msg">로그인 페이지</p>
		
		<form action="KJWlogin.do" method="post">
			<div class="form-group has-feedback">
				<input type="text" name="userId" class="form-control" placeholder="아이디">
				<span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" name="userPw" class="form-control" placeholder="비밀번호">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="row">
				<div class="col-xs-8">
					<div class="checkbox icheck">
						<label>
							<input type="checkbox" name="useCookie"> 로그인유지
						</label>
					</div>
				</div>
			
			<!-- /.col -->
			<div class="col-xs-4">
				<button type="submit" class="btn btn-primary btn-block btn-flat">
					<i class="fa fa-sign-in"></i>로그인
				</button>
			</div>
			<!-- /.col -->
			</div>
		</form>
		
		<div class="social-auth-links text-center">
			<p>-또는-</p>
			<a href="#" class="btn btn-block btn-social btn-facebook btn-flat">
				<i class="fa fa-facebook"></i>페이스북으로 로그인
			</a>
			<a href="#" class="btn btn-block btn-social btn-google btn-flat">
				<i class="fa fa-google-plus"></i>구글 계정으로 로그인
			</a>
		</div>
		<!-- /.social-auth-links -->
		
		<a href="#">비밀번호 찾기</a><br>
		<a href="KJWJoin.do" class="text-center">회원가입</a>
	</div>
	<!-- /. login-box-body -->
</div>
<!-- /. login-box -->

<!-- <script>
	var msg = "${msg}";
	if (msg === "REGISTRED") {
		
	}
</script> -->

</body>
</html>