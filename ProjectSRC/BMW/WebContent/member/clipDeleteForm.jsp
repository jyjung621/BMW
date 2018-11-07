<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

th {
	background-color: #ddd;
}
th.title {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

td {
	background-color: #eee;
	text-align: center;
	
}
td.align01 {
	display: table-cell;
	vertical-align: middle;
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
	background-color: #d52349;
}

/* Style the topnav links */
.topnav a {
	float: none;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
	background-color: #eee;
	color: black;
}
</style>
<script type="text/javascript">
	function _submit(f)
	{
	    //같이 보낼 값 정리
	    if (typeof(f.elements['mainno'].length) == 'undefined') //단일
	    {
	        if (f.elements['mainno'].checked==false)
	        {
	            f.elements['subno'].disabled=true;
	        }
	    } else { //다중
	        for (i=0; i<f.elements['mainno'].length; i++)
	        {
	            if (f.elements['mainno'][i].checked==false)
	            {
	                f.elements['subno'][i].disabled=true;
	            }
	        }
	    }
	    return true;
	}
</script>
</head>

<body>
	<%@ include file="../header.jsp"%>
	<div id="page-wrapper">

		<!-- Main -->
		<section id="main">
		<div class="container">


			<div class="row">

				<div class="topnav"
							style="padding-left: 0px; padding-top: 40px; padding-bottom: 40px; height: 100%;">
							<a href="clipList.do?view=1">나의 스크랩</a> 
							<a href="/BMW/member/ReviewList.do?memberId=${sessionId}">내가 쓴 리뷰</a> 
							<a href="/BMW/member/CommentsList.do?memberId=${sessionId }">내가 쓴 댓글</a> 
							<a href="/BMW/member/KJWupdateForm.do?memberId=${sessionId }">회원정보수정</a>
						</div>

				<section style="width: 85%;">
				<!-- Blog -->
					<section> <header class="major"
						style="margin-bottom: 0px;">
					<h2>스크랩한 리뷰</h2>
					</header> </section>
	<c:if test="${gubun == 1 }">
	<form action="clipDeletePro.do" method="post" onsubmit="_submit(this);">
		<input type="hidden" name="gubun" value="1">
		<tr>	
			<td><input type="button" value="게시글 보기" onclick="location.replace('clipList.do?view=2')"></td>&nbsp; &nbsp; &nbsp;
			<td>
				<input type="submit" value="삭제">
				<input type="button" value="돌아가기" onclick="location.replace('clipList.do?view=1')">
			</td>
		</tr>
		<table>
			<tr>
				<th>삭제 항목</th>
				<th>제목</th>
				<th>리뷰 번호</th>
				<th>스크랩 일시</th>
			</tr>
			<c:forEach var="clip" items="${list }">
				<tr>
					<td><input type="checkbox" name="mainno" value="${clip.mainNo}" />
						<input type="hidden" name="subno" value="${clip.subNo}" /></td>
					<td>${clip.title}</td>
					<td>${clip.subNo}</td>
					<td>${clip.regDate}</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</table>
	</form>
	
	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='clipList.do?pageNum=${startPage-blockSize}&view=1&gubun=1'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='clipList.do?pageNum=${i}&view=1&gubun=1'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='clipList.do?pageNum=${startPage+blockSize}&view=1&gubun=1'>[다음]</a>
		</c:if>
	</div>
	</c:if>
	
	<c:if test="${gubun == 2 }">
		<h2>스크랩한 게시글</h2>
	<form action="member/clipDeletePro.do" method="post" onsubmit="_submit(this);">
		<input type="hidden" name="gubun" value="2">
		<tr>	
			<td><input type="button" value="리뷰 보기" onclick="location.replace('clipList.do?view=1')"></td>&nbsp; &nbsp; &nbsp;
			<td>
				<input type="submit" value="삭제">
				<input type="button" value="돌아가기" onclick="location.replace('clipList2.do?view=2')">
			</td>
		</tr>
		<table>
			<tr>
				<th>삭제 항목</th>
				<th>제목</th>
				<th>작성자</th>
				<th>스크랩 일시</th>
			</tr>
			<c:forEach var="clip" items="${list }">
				<tr>
					<td><input type="checkbox" name="mainno" value="${clip.mainNo}" />
					<td class="left" width=200>${clip.title}</td>
					<td>${clip.memberId}</td>
					<td>${clip.regDate}</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</table>
	</form>
	
	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='clipList.do?pageNum=${startPage-blockSize}&view=2&gubun=2'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='clipListdo?pageNum=${i}&view=2&gubun=2'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='clipList.do?pageNum=${startPage+blockSize}&view=2&gubun=2'>[다음]</a>
		</c:if>
	</div>
	</c:if>
	<!-- form -->
	</section>
	</div>
	</div>
	</section>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>