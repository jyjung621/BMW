<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 100%;
	margin: 0 auto;
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
	text-align: left;
	background-color: #eee;
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
								<h2>아이디 찾기</h2>
							</header>
						</section>
						<form action="KJWsearchIdPro.do">
							<table>
								<tr>
									<th class="title" width="200" rowspan="2">아이디 찾기</th>
									<td>회원정보에 등록한 정보로 인증.</td>
								</tr>
								<tr>
									<td>이메일 질문 답변 입력하시오.</td>
								</tr>
								<tr>
									<th class="title">이메일</th>
									<td><input type="text" name="email" required="required"></td>
								</tr>
								<tr>
									<th class="title">질문</th>
									<td>
										<select name="question">
												<option value="0" selected="selected">질문을 선택하세요</option>
												<option value="1">아버님은 무슨일 하시니?</option>
												<option value="2">연봉이 어떻게 되니?</option>
												<option value="3">차는 있니?</option>
												<option value="4">문제 있는 장기 있니?</option>
										</select>
									</td>
								</tr>
								<tr>
									<th class="title">답변</th>
									<td><input type="text" name="answer" required></td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="background-color: #f7f7f7;">
										<input type="submit" name="search" value="아이디찾기">
										<input type="button" name="cancel" value="비밀번호 찾기" onclick="location.href='KJWsearchPwForm.jsp'">
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

