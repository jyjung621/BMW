<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
	table {
		width : 100%;
		margin : 0 auto;
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
	td .searchBtn{
		align-items: center;
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
								<h2>아이디 찾기</h2>
							</header>
						</section>
				<a href="KJWsearchPwForm.jsp"><button>비밀번호 찾기</button></a>
				<form action="KJWsearchIdPwPro.do" method="POST">
					<input type="hidden" name="gubun" value="1">
					<table width="380px" align="center" border="0" style="font-size: 19px">
						<tr>
							<th width="200" class="title">이메일</th>
							<td><input type="email" name="email" required></td>
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
								</select><br>
							</td>
						</tr>
						<tr>
							<th class="title">답변</th>
							<td><input type="text" name="answer" required></td>
						</tr>
						
					</table>
							<div align="center">
								<input type="submit" value="찾기">
							</div>	
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

