<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
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
								<h2>카테고리 수정</h2>
							</header>
						</section>
<form action="CategoryUpdatePro.do" method="post">
		<input type="hidden" name="pageNumCt" value="${pageNumCt}">
	 	<input type="hidden" name="categoryNo" value="${cate.categoryNo}">

		<table border="1">
			<tr>
				<th width="200">카테고리 번호</th>
				<td>${cate.categoryNo}</td>
			</tr>
			<tr>
				<th>카테고리 이름</th>
				<td><input type="text" name="name" value="${cate.name}" required="required"></td>
			</tr>
			<tr>
				<th>상위 카테고리</th>
<%-- 				<td>
  				<select name="parent"  required="required">
				<c:forEach var="cate2" items="${cate2}">
					<option value="${cate2.name}">${cate2.name}</option>
				</c:forEach>
				</select> 
				</td> --%>
				<td><input type="text" name="parent" value="${cate.parent}"></td>
			</tr>
			<tr>
				<th>공개여부</th>
				<td>
					<input type="radio" name="isPublic" value="1" checked="checked">공개
					<input type="radio" name="isPublic" value="0">비공개
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right" style="background-color: #f7f7f7; "><input type="submit" value="수정완료">
				<input type="reset" value="취소" onclick="history.go(-1)"></td>
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