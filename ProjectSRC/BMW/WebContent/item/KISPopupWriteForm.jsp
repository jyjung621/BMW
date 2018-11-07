<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ingredient Write View(Pop-up)</title>
<script type="text/javascript">
	function goBack() {
		history.go(-1);
	}
</script>
<link rel="stylesheet" href="/BMW/maincss/assets/css/main.css" />
</head>
<body>
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
	<form action="PopupWritePro.do?pageNum=${pageNum}" method="post">
		<table>
			<tr>
				<td>성분명</td>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<td>위험도 등급</td>
				<td><input type="text" name="grade" required="required"></td>
			</tr>
			<tr>
				<td>20가지 주의성분</td>
				<td><input type="text" name="danger20"></td>
			</tr>
			<tr>
				<td>알레르기 주의성분</td>
				<td><input type="text" name="dangerAllergy"></td>
			</tr>
			<tr>
				<td>피부타입별 특이성분</td>
				<td><input type="text" name="specialyType"></td>
			</tr>
			<tr>
				<td>기능성 성분 여부</td>
				<td><input type="text" name="functional"></td>
			</tr>		
			<tr>
				<td>
					<input type="submit" value="확인">
					<input type="reset" value="다시작성">
					<input type="button" value="뒤로가기" onclick="goBack();">
				</td>
			</tr>
		</table>
	</form>
	<!-- 	</form> -->

	</div>
	</div>
	</div>
	</section>
	</div>
</body>
</html>