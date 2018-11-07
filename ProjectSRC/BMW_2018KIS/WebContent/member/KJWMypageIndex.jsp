<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	margin: 0;
}

/* Style the header */
.header {
	background-color: #f1f1f1;
	padding: 20px;
	text-align: center;
}

/* Style the top navigation bar */
.topnav {
	overflow: hidden;
	background-color: #333;
}

/* Style the topnav links */
.topnav a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.photo2 {   /* 직사각형 사진에 적용 */
    width: 100px; height: 100px;
    object-fit: cover;
    object-position: top;
    border-radius: 50%;
}
.photo3 {   /* 정사각형 사진에 적용 */
    width: 100px; height: 100px;
    object-fit: cover;
    border-radius: 50%;
}
</style>
</head>

<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../myHeader.jsp"%>
	<%@ include file="../footer.jsp"%>

</body>
</html>