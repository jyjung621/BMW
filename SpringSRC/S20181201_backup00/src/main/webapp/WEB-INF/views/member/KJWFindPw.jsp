<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>비밀번호찾기</title>

<script type="text/javascript">
// 	$(document).ready(function() {
// 		$("#findPw").click(function() {
// 			// 태그.val() : 태그에 입력된 값
// 			// 태그.val("값") : 태그의 값을 변경
// 			/* var email = $("#memberId").val();
// 			var passwd = $("passwd").val();
// 			if (memberId == "") {
// 				alert("아이디를 입력하세요");
// 				$("#memberId").focus(); //입력 포커스 이동
// 				return; // 함수 종료
// 			}
// 			if (passwd == "") {
// 				alert("아이디를 입력하세요.");
// 				$("#passwd").focus();
// 				return;
// 			} */
// 			/* 			// 폼 내부의 데이터를 전송할 주소
// 			 document.form1.action.value="KJWloginCheck";
// 			 // 제출
// 			 document.form1.submit(); */
// 		});

// 	});
	
/* 	function testChk(no) {
		console.log('input no -> ' + no);
		location.replace('test.do?no='+no);
	}
	
	$(function () {
		console.log('msg -> ' + ${msgTest})
		if(${msgTest} != null){
			$('#testest').html(${msgTest})
		}
	});
	 */
	
	
</script>

</head>
<body>

	<!-- Top content -->
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1>
							<strong>Bootstrap</strong> Search Password Form
						</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<h3>Search Password Form</h3>
								<!-- 	<p></p> -->
							</div>
							<!-- <div class="form-top-right">
							<i class="fa fa-lock"></i>
						</div> -->
						</div>
						<div class="form-bottom">
							<form role="form" action="KJWFindPwCheck.do" method="post"
								class="login-form">
								<div class="form-group">
									<label class="sr-only" for="form-username">ID</label> <input
										type="text" name="memberId" placeholder="User Id..."
										class="form-username form-control" id="memberId" required>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">E-Mail</label> <input
										type="text" name="email" placeholder="E-Mail..."
										class="form-username form-control" id="email" required>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">Question</label> <select
										class="form-control" id="question" name="question">
										<option value="0" selected="selected">Select Question...</option>
										<option value="1">아버님은 무슨일 하시니?</option>
										<option value="2">연봉이 어떻게 되니?</option>
										<option value="3">차는 있니?</option>
										<option value="4">문제 있는 장기 있니?</option>
									</select>

									<!-- <input
									type="email" name="question" placeholder="Question..."
									class="form-username form-control" id="question"> -->
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">Answer</label> <input
										type="text" name="answer" placeholder="Answer..."
										class="form-username form-control" id="answer" required>
								</div>
								<button type="submit" class="btn" id="findPw">Search Password</button>
								<c:if test="${msg == 'success' }">
									<div style="color: white">입력하신 이메일로 임시비밀번호를 전송하였습니다.</div>
								</c:if>
								<c:if test="${msg == 'failure' }">
									<div style="color: red">입력한 정보가 맞지 않습니다.</div>
								</c:if>
								<c:if test="${msg == 'mailFailure' }">
									<div style="color: red">메일전송에 실패하였습니다..</div>
								</c:if>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	
<!-- 	<hr>
	<input type="button" value="성공" onclick="return testChk(1);">
	<input type="button" value="실패" onclick="return testChk(0);">
	<span  id="testtest" style="color: red;"></span>
	<hr> -->
	<!-- Javascript -->
	<script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>


</body>
</html>