<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/form-elements.css">
<link rel="stylesheet" href="assets/css/style.css">
<title>회원정보수정</title>
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
							<strong>Bootstrap</strong> 회원정보수정
						</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<h3>회원정보수정</h3>
								<!-- 	<p></p> -->
							</div>
							<!-- <div class="form-top-right">
							<i class="fa fa-lock"></i>
						</div> -->
						</div>
						<div class="form-bottom">
							<form role="form" action="KJWUpdateMember.do" method="post"
								class="login-form">
								<div class="form-group">
									<label class="sr-only" for="form-username">memberId</label>
									<input name="memberId" value="${member.memberId }" readonly="readonly" 
									class="form-username form-control" width="80%">
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">Password</label>
									<input type="password" name="passwd" value="${member.passwd }" class="form-username form-control" required>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">Name</label>
									<input name="name" value="${member.name }" class="form-username form-control" required>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">Address</label>
									<input name="address" value="${member.address }" class="form-username form-control" required>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">Phone</label>
									<input name="phone" value="${member.phone }" class="form-username form-control" required>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">Email</label>
									<input name="email" value="${member.email }" class="form-username form-control" required>
								</div>
								
								
								<%-- <div class="form-group">
									<label class="sr-only" for="form-username">ID</label> 
									<input
										type="text" name="memberId" placeholder="${member.memberId }"
										class="form-username form-control" id="memberId" readonly="readonly">
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">password</label> <input
										type="text" name="passwd" placeholder="password..."
										class="form-username form-control" id="passwd" required>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">name</label> <input
										type="text" name="name" placeholder="name..."
										class="form-username form-control" id="name" required>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">address</label> <input
										type="text" name="address" placeholder="address..."
										class="form-username form-control" id="address" required>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">phone</label> <input
										type="text" name="phone" placeholder="phone..."
										class="form-username form-control" id="phone" required>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">E-Mail</label> <input
										type="text" name="email" placeholder="E-Mail..."
										class="form-username form-control" id="email" required>
								</div> --%>
								<button type="submit" class="btn" id="update">수정하기</button>
								<c:if test="${msg == 'updateOK' }">
								<div style="color: white">회원정보가 수정되었습니다.
								</div>
								</c:if>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div> 
	
		<!-- Javascript -->
<!-- 	<script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	 -->
	
	<footer><%@ include file="../partials/footer.jsp" %></footer>
	
</body>
</html>