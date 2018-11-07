<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	int result = (int) request.getAttribute("result");
		
    	if (result == 0) {
    		out.println("사용 할 수 있음");
    	} else if (result == 1) {
    		out.println("이미 사용 중임. 다시 입력..");    		
    	}
    %>