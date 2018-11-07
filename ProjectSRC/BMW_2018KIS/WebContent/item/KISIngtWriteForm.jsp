<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ingredient Write View</title>
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
						<section>
							<header class="major" style="margin-bottom: 0px;">
								<h2>성분 등록</h2>
							</header>
						</section>
	<form action="IngtWritePro.do?pageNum=${pageNum}" method="post">
		<table>
			<tr>
				<th width="200">성분명</th>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<th>위험도 등급</th>
				<td><input type="text" name="grade" required="required"></td>
			</tr>
			<tr>
				<th>20가지 주의성분</th>
				<td><input type="text" name="danger20"></td>
			</tr>
			<tr>
				<th>알레르기 주의성분</th>
				<td><input type="text" name="dangerAllergy"></td>
			</tr>
			<tr>
				<th>피부타입별 특이성분</th>
				<td><input type="text" name="specialyType"></td>
			</tr>
			<tr>
				<th>기능성 성분 여부</th>
				<td><input type="text" name="functional"></td>
			</tr>		
			<td colspan="2" align="right" style="background-color: #f7f7f7; ">
				<input type="submit" value="확인">
				<input type="reset" value="다시작성">
				<input type="button" value="목록가기" onclick="location.href='IngtList.do?pageNum=${pageNum}'">
			</td>
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