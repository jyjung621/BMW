<%@page import="dao.KJWMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${passwd != null }">
		<script type="text/javascript">
			document.write('당신의 비밀번호는 ${passwd } 입니다. ');
		</script> 

		<br>
		<br>


		<input type="button" id="button1" onclick="button1_click();"
			value="로그인 페이지로 가기" />
		<script>
			function button1_click() {
				location.href = "KJWloginForm.jsp";
			}
		</script>


	</c:if>
	<c:if test="${passwd == null}">
		<script type="text/javascript">
			document.write(' 비밀번호를 찾을 수 없습니다.');
		</script>

		<br>
		<br>

		<input type="button" id="button1" onclick="button1_click();"
			value="이전 페이지로 가기" />
		<script>
			function button1_click() {
				window.history.back();
			}
		</script>
	</c:if>

</body>
</html>