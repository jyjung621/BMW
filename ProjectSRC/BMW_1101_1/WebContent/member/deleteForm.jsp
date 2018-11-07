<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ include file="KJWmemberCheck.jsp"%>
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
<div class="header">
		<h1><%=id %>님의 My Page</h1>
		<p> 프로필 사진 업로드 </p>
	
	<form method="POST" action="urlPrefix/uploadPic" enctype="multipart/form-data">
    <label for="file">Upload picture</label>
    <input type="file" name="file" id="file" />
    <p><input type="submit" value="Upload"/></p>
	</form>
		
</div>





	<div class="topnav">
		<a href="clipList.do">나의 스크랩</a>
		<a href="#">내가 쓴 리뷰</a> 
		<a href="#">내가 쓴 댓글</a>
		<a href="#">회원정보 수정</a>
		<a href="deleteForm.do">회원탈퇴</a>
		<a href="logout.jsp">로그아웃</a>
	</div> 
<h2>삭제하려면 아이디와 비밀번호를 입력하세요</h2>
<h4 style="color:red">탈퇴하면 작성한 모든 글이 사라집니다 다시한번 확인해주세요</h4>
<form action="deletePro.do">
	아이디 :  <input type="text" name="memberid"><p>
	비밀번호 : <input type="text" name="passwd"><p>
	<input type="submit" value="확인">
	<input type="button" value="취소" onclick="location.href='mypageIndex.jsp'">
</form>
</body>
</html>