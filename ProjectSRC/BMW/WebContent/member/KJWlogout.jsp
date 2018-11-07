<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% session.invalidate(); %>
	<!-- 수정 부분 시작-->
	<script type="text/javascript">
		alert("로그아웃 되었습니다.");  
		location.href="/BMW/index.jsp";
	</script>
	<!-- 수정 부분 끝-->
	<!-- <p>로그아웃 되었습니다. </p> -->
	<!--  <a href="KJWloginForm.jsp">메인으로 가기</a>-->
</body>
</html>