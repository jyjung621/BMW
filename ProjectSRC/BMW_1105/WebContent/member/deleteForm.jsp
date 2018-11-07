<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 스크랩</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
* {
	box-sizing: border-box;
}

table {
	width: 100%;
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

</style>
</head>

<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../myHeader.jsp"%>
<h2>삭제하려면 아이디와 비밀번호를 입력하세요</h2>
<h4 style="color:red">탈퇴하면 작성한 모든 글이 사라집니다 다시한번 확인해주세요</h4>
<form action="deletePro.do">
	아이디 :  <input type="text" name="memberid"><p>
	비밀번호 : <input type="text" name="passwd"><p>
	<input type="submit" value="확인">
	<input type="button" value="취소" onclick="location.href='/member/myPage.do'">
</form>

	<%@ include file="../footer.jsp"%>
</body>
</html>