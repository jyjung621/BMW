<%@page import="dao.KJWMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="KJWError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("memberid");
	String passwd = request.getParameter("passwd");
	KJWMemberDao md = KJWMemberDao.getInstance(); 
	int result = md.check(id, passwd).getResult();
	// id가 존재하면
	if (result == 1) {
		session.setAttribute("memberid", id); //("세션변수명", 값)
		response.sendRedirect("BMW/SDBmainForm.do");
	// id 정상, passwd는 오류
	} else if (result == 0) {
%>
	<script type="text/javascript">
		alert("암호를 틀렸습니다");
		history.go(-1);
	</script>
<% } else { %>
	<script type="text/javascript">
		alert("아이디가 존재하지 않습니다.")
		history.go(-1);
	</script>
<% } %>
</body>
</html>