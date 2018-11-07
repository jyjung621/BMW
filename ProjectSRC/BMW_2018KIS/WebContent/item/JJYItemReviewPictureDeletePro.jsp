<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String fileName = (String)request.getAttribute("fileName");

	JSONObject jsonObj = new JSONObject();
	PrintWriter pw = response.getWriter();
	jsonObj.put("fileName", fileName);
	pw.println(jsonObj);
%>