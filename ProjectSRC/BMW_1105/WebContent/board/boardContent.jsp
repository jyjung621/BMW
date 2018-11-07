<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- <link rel="stylesheet" href="../maincss/assets/css/main.css" /> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 내용</title>

<style>
body{
	background-color: #FFFFFF;
}
table {
		width : 100%;
		margin : auto;
		text-align : center;
	}
	th {
		background-color: #ddd;
		text-align: center;
	}
	th.title {
		text-align:center;
		display: table-cell;
		vertical-align: middle;
	}
	td {
		text-align: center;
		background-color: #eee;
	}
	caption {
		text-align: center;
		font-size: x-large;
	}
</style>
<script type="text/javascript">
$(function() {
	$("boardComment").load('SDBCommentContent.do?boardNo=${board.boardNo }');
});
</script>
</head>
<body>
<%@ include file="../header.jsp"%>
<div id="page-wrapper">

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<!-- Blog -->
						<section>
							<header class="major" style="margin-bottom: 0px;">
								<h2>게시글 내용</h2>
							</header>
						</section>
						<table border="1" >
							<tr>
								<th class="title" width="200">번호</th>
								<td>${board.boardNo }</td>
							</tr>
							<tr>
								<th class="title">제목</th>
								<td>${board.title }</td>
							</tr>
							<tr>
								<th class="title">작성자</th>
								<td>${board.memberId }</td>
							</tr>
							<tr>
								<th class="title">작성일</th>
								<td>${board.regDate }</td>
							</tr>
							<tr>
								<th class="title">조회수</th>
								<td>${board.hits }</td>
							</tr>
							<tr>
								<th class="title">내용</th>
								<td>
									<c:if test="${count > 0 }">
								 		<c:forEach var="i" begin = "0" end="${count-1 }" step="1">
								 			<img src ="/BMW${savefiles.get(i).getFilePath() }/${savefiles.get(i).getSavedFileName()}">
								 		</c:forEach>
								 	</c:if>
								 	<br>
								 	<br>
									<p style="line-height: 1.3em;">${board.content }</p>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="right" style="background-color: #f7f7f7;">
									<div style="float: left;">
									<c:choose>
										<c:when test="${sessionScope.sessionId == board.memberId}">
											<input type="button" value="수정" onclick="location.href='boardUpdateForm.do?boardNo=${board.boardNo}&pageNum=${pageNum }'">
											<input type="button" value="삭제" onclick="location.href='boardDeleteForm.do?boardNo=${board.boardNo}&pageNum=${pageNum }&boardCategory=${board.boardCategory }'">	
										</c:when>
										<c:otherwise>
											<c:if test="${sessionScope.grade == 0 }">
												<input type="button" value="삭제" onclick="location.href='boardDeleteForm.do?boardNo=${board.boardNo}&pageNum=${pageNum }&boardCategory=${board.boardCategory }'">
											</c:if>
										</c:otherwise>
									</c:choose>	
									<input type="button" value="목록" onclick="location.replace('boardList.do?boardCategory=${board.boardCategory }')">
									</div>
									<div style="float: right;">
									<form action="SDBBoardClip.do" method="POST">
										<input type="hidden" name="boardNo" value="${board.boardNo }">
										<input type="hidden" name="title" value="${board.title }">
										<input type="hidden" name="writer" value="${board.memberId }">
										<input type="submit" value="스크랩하기">
									</form>
									</div>
								</td>
							</tr>
						</table>
						<div id="commentPlace">			
						</div>
						<boardComment></boardComment>
						
						</div>
<!-- 	</form> -->

	</div>
	</div>
	</section>
	</div>


	<!-- <footer0></footer0> -->
<%@ include file="../footer.jsp"%>
</body>
</html>