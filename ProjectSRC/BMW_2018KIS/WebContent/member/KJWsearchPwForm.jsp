<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<meta charset="UTF-8">
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
								<h2>비밀번호 찾기</h2>
							</header>
						</section>
						<form action="KJWsearchPwPro.do">
							<table>
								<tr>
									<th class="title" width="200" rowspan="2">비밀번호 찾기</th>
									<td>회원정보에 등록한 정보로 인증</td>
								</tr>
								<tr>
									<td>아이디를 입력하고 가입시 선택한 질문에 답변해주세요.</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td><input type="text" name="memberId" required="required"></td>
								</tr>
								<tr>
									<th>질문</th>
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
									<th>답변</th>
									<td><input type="text" name="answer" required="required"></td>
								</tr>
								<tr>
									<td style="background-color: #f7f7f7;"><input type="submit" name="search" value="찾기"></td>
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
