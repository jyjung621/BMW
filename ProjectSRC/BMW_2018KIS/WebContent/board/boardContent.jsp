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

<script type="text/javascript">
	/* $(function() {
	 $("#commentPlace").load('SDBCommentContent.do?boardNo=${board.boardNo }');
	 }); */
	$(function() {
		$("boardComment")
				.load('SDBCommentContent.do?boardNo=${board.boardNo }');
	});
	/* function writeCmt() {
		var xhttp = new XMLHttpRequest();
		var form = document.getElementById("writeCommentForm");
		var memberId = form.memberId.value;
		var content = form.content.value;
		var boardNo = form.boardNo.value;
		
		document.write(memberId, "<br>");
		document.write(content, "<br>");
		document.write(boardNo, "<br>");
		
		if(!content)
			{
				alert("내용을 입력하세요.");
				return false;
		}
		else{
			var param = "memberId=" + memberId + "&content=" + content + "&boardNo=" + boardNo;
			/* document.getElementById("commentPlace").innerHTML = */
	/* 	xhttp.open("POST", "SDBCommentWriteAct.do", true);
		xhttp.send(param); 			
	}	
	}  */
</script>
<style type="text/css">
table {
	width: 100%;
	margin: auto;
	text-align: center;
}

th {
	background-color: #ddd;
	text-align: center;
}

th.title {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

td {
	text-align: left;
	background-color: #eee;
}

img {
	width: 100px;
	height: auto;
}

caption {
	text-align: center;
	font-size: x-large;
}
</style>
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
					<section> <header class="major"
						style="margin-bottom: 0px;">
					<h2>게시글 내용</h2>
					</header> </section>
					<table border="1">
						<tr>
							<th class="title" widtb="200">번호</th>
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
							<td height="100"><c:if test="${count > 0 }">
									<c:forEach var="i" begin="0" end="${count-1 }" step="1">
										<img
											src="/BMW${savefiles.get(i).getFilePath() }/${savefiles.get(i).getSavedFileName()}">
									</c:forEach>
								</c:if> ${board.content }</td>
						</tr>
						<tr>
							<td colspan="2" align="right" style="background-color: #f7f7f7;">
								<c:if
									test="${sessionScope.sessionId == board.memberId or sessionScope.grade == 0}">
									<input type="button" value="수정"
										onclick="location.href='boardUpdateForm.do?boardNo=${board.boardNo}&pageNum=${pageNum }'">
									<input type="button" value="삭제"
										onclick="location.href='boardDeleteForm.do?boardNo=${board.boardNo}&pageNum=${pageNum }&boardCategory=${board.boardCategory }'">
								</c:if> <input type="button" value="목록"
								onclick="location.href='boardList.do?boardCategory=${board.boardCategory }'">
								<input type="button" value="스크랩"
								onclick="location.href='SDBBoardClip.do?boardNo=${board.boardNo}&title=${board.title }'">
							</td>
						</tr>
					</table>
					<%-- <table>
		<tr>
			<form id="writeCommentForm">
			<td><input type="text" name="boardNo" value="${board.boardNo }"></td>
			<td colspan="2"><textarea rows="5" cols="10" name="memberId"
					required="required"></textarea></td>
			<td colspan="2"><textarea rows="8" cols="100" name="content"
					required="required" placeholder="댓글을 입력하세요."></textarea></td>
			<td colspan="2">
				<div id="btn" style="text-align: center;">
					<input type="button" value="댓글달기" onclick="writeCmt()">
				</div>
			</td>
			</form>
		</tr>
	</table> --%>
					<div id="commentPlace">
						<%-- <jsp:include page="../comments/JJYItemContent.jsp" /> --%>
						<%-- <jsp:include page="SDBCommentContent.do?boardNo=${board.boardNo }"> --%>

					</div>
					<boardComment></boardComment>
					<!-- 	</form> -->

				</div>
			</div>
		</div>
		</section>
	</div>


	<!-- <footer0></footer0> -->
	<%@ include file="../footer.jsp"%>
</body>
</html>