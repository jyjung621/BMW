
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int likeCnt = (int)request.getAttribute("likeCnt");
	//String likeCnt = "A";
	JSONObject jsonObj = new JSONObject();
	PrintWriter pw = response.getWriter();
	jsonObj.put("likeCnt", likeCnt);
	pw.println(jsonObj);
%>