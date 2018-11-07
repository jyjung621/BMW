<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../MAIN/assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div id="page-wrapper">

		<div id="main">
			<form action="boardUpdatePro.do" method="post">
				<input type="hidden" name="boardNo" value="${board.boardNo }">
				<input type="hidden" name="pageNum" value="${pageNum }">
				<input type="hidden" name="boardCategory" value="${board.boardCategory }">
				<table border="1">
					<caption>
						<h2>게시글 수정</h2>
					</caption>
					<tr>
						<td>번호</td>
						<td>${board.boardNo }</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" required="required"
							value="${board.title }"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${board.memberId }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td><pre>
								<textarea rows="10" cols="40" name="content" required="required">${board.content }</textarea>
							</pre></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="수정완료"></td>
					</tr>
				</table>
			</form>
		</div>
		<%@ include file="../footer.jsp"%>
</body>
</html>