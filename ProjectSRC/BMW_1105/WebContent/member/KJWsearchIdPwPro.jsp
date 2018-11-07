<%@page import="dao.KJWMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<script>
	function button1_click() {
		location.replace("KJWloginForm.jsp");
	}
</script>
<c:choose>
	<c:when test="${id != null}">
		<script type="text/javascript">
				alert('당신의 아이디는 ${id } 입니다. ');
				location.replace("KJWloginForm.jsp");
		</script>
		<br> 
		<br>
		<input type="button" id="button1" onclick="button1_click();" value="로그인 페이지로 가기" />
	</c:when>
	<c:when test="${passwd != null }">
		<script type="text/javascript">
			alert('당신의 비밀번호는 ${passwd } 입니다. ');
			location.replace("KJWloginForm.jsp");
		</script>
		<br> 
		<br>
		<input type="button" id="button1" onclick="button1_click();" value="로그인 페이지로 가기" />
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("입력정보가 일치하지 않습니다.");  
			history.back();
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>