<%@page import="dao.Category"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%
		List<Category> list2 = (List)request.getAttribute("list2");
		JSONArray jsonArr = new JSONArray(list2);
		PrintWriter pw1 = response.getWriter(); 
		pw1.println(jsonArr);
		
		System.out.println("list2출력되나 " + list2);
		System.out.println("jsonArr출력되나 " + jsonArr);
	%>