<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="KJWsearchIdPro.do">
		<table width="750px" align="center" border=0;
			style="background-color: white; margin-top: 3%">
			<tr>
				<td>아이디 찾기</td>
				<td><div id="sub-title">| 회원정보에 등록한 정보로 인증.</td>
				<td style="width: 300px"></td>
			</tr>
		</table>
		<table width="600px" height="300px" align="center" border="0"
			style="background-color: none; border: dotted 5px none;">
			<tr>
				<td>
					<table width="400px" border="0" style="margin-top: 3%">
						<tr>
							<td><div id="middle-title">&nbsp;이메일 질문 답변 입력하시오.</div></td>
						</tr>

					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="380px" align="center" border="0"
						style="font-size: 19px">
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" required="required"></td>
						</tr>
						<tr>
							<td>질문</td>
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
							<td>답변</td>
							<td><input type="text" name="answer" required></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="150px" align="center" border="0"
						style="margin-top: 1%">
						<tr>
							<td><input type="submit" name="search" value="아이디찾기"> <input
								type="button" name="cancel" value="비밀번호 찾기"
								onclick="location.href='KJWsearchPwForm.jsp'">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

	</form>

</body>

</html>

