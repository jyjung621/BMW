<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ include file="../SessionCheck.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>Item List</title>
<style type="text/css">
table { width: 100%;}
tr{background-color: #eee; }
</style>
</head>
<body>

<div id="searchList">
	 <jsp:include page="JJYItemCategoryHeader.jsp" />
</div>

</body>
</html>