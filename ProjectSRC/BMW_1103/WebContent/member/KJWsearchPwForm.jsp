<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="KJWsearchPwPro.do">
		<table width="750px" align="center" border=0;
			style="background-color: white; margin-top: 3%">
			<tr>
				<td>비밀번호 찾기</td>
				<td><div id="sub-title">| 회원정보에 등록한 정보로 인증</td>
				<td style="width: 300px"></td>
			</tr>
		</table>
		<table width="600px" height="300px" align="center" border="0"
			style="background-color: none; border: dotted 5px none;">
			<tr>
				<td>
					<table width="400px" border="0" style="margin-top: 3%">
						<tr>
							<td><div id="middle-title">아이디를 입력하고 가입시 선택한 질문에 답변해주세요.</div></td>
						</tr>

					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="380px" align="center" border="0"
						style="font-size: 19px">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="memberId" required="required"></td>
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
								</select>
						<tr>
							<td>답변</td>
							<td><input type="text" name="answer" required="required"></td>
						</tr>
								
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="150px" align="center" border="0"
						style="margin-top: 1%">
						<tr>
							<td><input type="submit" name="search" value="찾기"> 
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

	</form>

</body>

</html>
