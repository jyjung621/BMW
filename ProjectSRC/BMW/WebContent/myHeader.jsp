<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/member/KJWmemberCheck.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<div class="header">
		<h1><%=nick%>님의 <a href="/member/myPage.do"> My Page</a>
		</h1>
		<c:if test="${savefile != null }">
			<label for="file"><img class="photo3" src="/BMW${savefile.getFilePath() }/${savefile.getSavedFileName()}"></label>
		</c:if>
		<!-- <form method="POST" action="urlPrefix/uploadPic"
			enctype="multipart/form-data">
			<label for="file">Upload picture</label> <input type="file"
				name="file" id="file" />
			<p>
				<input type="submit" value="Upload" />
			</p>
		</form> -->

		<form method="POST" action="/BMW/memberPicPro.do" enctype="multipart/form-data">
			<label for="file">Upload picture</label> 
			    <input type="file" name="file" id="file" required/><p>
    			<input type="submit" value="등록"/></p>
			<c:if test="${grade == 0 }">
				<tr>
					<td><input type="button" value="관리자"
						onclick="location.href='/BMW/member/KDWadminListForm.jsp'"></td>
				</tr>
			</c:if>
			<c:if test="${grade == 1 }">
				<strong>판매자</strong>
			</c:if>
			<c:if test="${grade == 2 }">
				<strong>일반회원</strong>
			</c:if>
			<c:if test="${grade == 3 }">
				<strong>가입승인대기 회원</strong>
			</c:if>
				

		</form>

	</div>

	<div class="topnav">
		<a href="/BMW/SDBmainForm.do">홈으로</a> 
		<a href="clipList.do?view=1">나의
			스크랩</a> <a href="#">내가 쓴 리뷰</a> <a
			href="/BMW/member/CommentsList.do?memberId=<%=id%>">내가 쓴 댓글</a> <a
			href="/BMW/member/KJWupdateForm.do?memberId=<%=id%>">회원정보수정</a> <a
			href="deleteForm.do">회원탈퇴</a> <a href="KJWlogout.jsp">로그아웃</a>
	</div>
</body>
</html>