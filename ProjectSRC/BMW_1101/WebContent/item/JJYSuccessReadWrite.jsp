<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="dao.Comments"%>
<%@page import="java.util.List"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.io.PrintWriter"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	int ReadWrite = (int) request.getAttribute("ReadWrite");
	

	if (ReadWrite == 0) {
		HashMap<String, Object> result = (HashMap)request.getAttribute("result");
		JSONObject jsonObj = new JSONObject(result);
		PrintWriter pw = response.getWriter();
		pw.println(jsonObj);

		System.out.println("result -> " + result);
		System.out.println("JSONObj -> " + jsonObj);

	} else if(ReadWrite == 1) {
		List<Comments> comms = (List)request.getAttribute("comms");
		JSONArray jsonArr = new JSONArray(comms);
		PrintWriter pw1 = response.getWriter(); 
		pw1.println(jsonArr);

		System.out.println("comms -> " + comms);
		System.out.println("jsonArr -> " + jsonArr);
	}
%>