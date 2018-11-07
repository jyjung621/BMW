<%
	//String id = (String) session.getAttribute("memberId");
	String id = (String) session.getAttribute("sessionId");
	String pwd = (String)session.getAttribute("passwd");
	String nick = (String)session.getAttribute("nickname");
	System.out.println("test id->" + id);
	if (id == null || id.equals("")) {
		response.sendRedirect("KJWloginForm.jsp");
	}
%>