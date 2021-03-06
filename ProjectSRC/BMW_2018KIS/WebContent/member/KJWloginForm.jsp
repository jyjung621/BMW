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
</head>

<body>
	<%@ include file="../header.jsp"%>
	<div id="page-wrapper">

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<form action="KJWloginPro.do" method="POST">
							<table border="1" style="margin: auto;">
								<tr>
									<td>아이디</td>
									<td><input type="text" name="memberId" required="required"></td>
								</tr>
								<tr>
									<td>패스워드</td>
									<td><input type="password" name="passwd"
										required="required"></td>
								</tr>
								<!-- 	아이디저장 아이디/비밀번호 찾기 -->

								<tr>
									<td colspan="2">
										<input type="submit" value="로그인">
										<input type="button" value="회원가입" onclick="location.replace('writeAgree.jsp')"> <br>
										<input type="button" value="아이디/패스워드 찾기" onclick="location.href='KJWsearchIdForm.jsp'">
									</td>
								</tr>
							</table>
						</form>
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