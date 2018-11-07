
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="dao.Comments"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int UpdateDelete = (int) request.getAttribute("UpdateDelete");
	int commPageNum = (int) request.getAttribute("commPageNum");

	if (UpdateDelete == 0) { /* UpdateDelete == 0 Delete */
		PrintWriter pw = response.getWriter();
		pw.println(commPageNum);
	} else if (UpdateDelete == 1) { /* UpdateDelete == 1 UpdateForm */
		String trId = request.getParameter("trId");
		Comments comm = (Comments) request.getAttribute("comm");
		JSONObject jsonObj = new JSONObject(comm);
		JSONArray jsonArr = new JSONArray();
		jsonArr.put(jsonObj);
		jsonArr.put(trId);
		jsonArr.put(commPageNum);
		
		System.out.println("success jsonObj -> " + jsonArr);
/* 		System.out.println("success jsonObj -> " + jsonArr);
		System.out.println("success jsonObj.get(1) -> " + jsonArr.get(1)); */
		
		PrintWriter pw1 = response.getWriter();
		pw1.println(jsonArr);

		
/* 		Comments comm1 = (Comments)jsonArr.get(0);
		System.out.println("success comm1 -> " + comm1.getContent());
		String trId1 = (String)jsonArr.get(1);
		System.out.println("success trId1 -> " + trId1); */
		
	} else if (UpdateDelete == 2) { /* UpdateDelete == 1 UpdatePro */
		PrintWriter pw2 = response.getWriter();
		pw2.println(commPageNum);
	}
%>