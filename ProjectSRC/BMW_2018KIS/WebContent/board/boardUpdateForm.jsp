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
					<h2>게시글 수정</h2>
					</header> </section>
					<form action="boardUpdatePro.do" method="post">
						<input type="hidden" name="boardNo" value="${board.boardNo }">
						<input type="hidden" name="pageNum" value="${pageNum }"> <input
							type="hidden" name="boardCategory"
							value="${board.boardCategory }">
						<table border="1">
							<tr>
								<th class="title" widtb="200">번호</th>
								<td>${board.boardNo }</td>
							</tr>
							<tr>
								<th class="title">제목</th>
								<td><input type="text" name="title" required="required"
									value="${board.title }"></td>
							</tr>
							<tr>
								<th class="title">작성자</th>
								<td>${board.memberId }</td>
							</tr>
							<tr>
								<th class="title">내용</th>
								<td><textarea rows="10" cols="40" name="content"
										required="required">${board.content }</textarea></td>
							</tr>
							<tr>
								<td colspan="2" align="right" style="background-color: #f7f7f7;"><input
									type="submit" value="수정완료"></td>
							</tr>
						</table>
					</form>
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