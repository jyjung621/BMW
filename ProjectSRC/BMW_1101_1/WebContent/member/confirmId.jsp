<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*" errorPage="Error.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
</script>
<%   // 아이디가 존재하는지 않는지 체크
	HWKMemberDao md = HWKMemberDao.getInstance();
	String id = request.getParameter("memberId"); 
	int re = md.confirm(id); 	// 기존재 하지 않으면 result == 0, 나머지는 1
%>
<body><%=re%></body>
 