<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ingredient View</title>
<script type="text/javascript">
	function del_chk() {
		if (confirm("성분을 삭제 하시겠습니까?") == true) {
			location.href="IngtDeletePro.do?ingredientNo=${ingt.ingredientNo}&pageNum=${pageNum}";
		} else {
			return;
		}
	}
</script>
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
								<h2>성분 상세내역</h2>
							</header>
						</section>
	<table border="1">
		<tr>
			<th width="200">성분 번호</th>
			<td>${ingt.ingredientNo}</td>
		</tr>
		<tr>
			<th>성분명</th>
			<td>${ingt.name}</td>
		</tr>
		<tr>
			<th>위험등급</th>
			<td>${ingt.grade}</td>
		</tr>
		<tr>
			<th>20가지 주의성분</th>
			<td>${ingt.danger20}</td>
		</tr>
		<tr>
			<th>알레르기 주의성분</th>
			<td>${ingt.dangerAllergy}</td>
		</tr>
		<tr>
			<th>피부타입별 특이성분</th>
			<td>${ingt.specialyType}</td>
		</tr>
		<tr>
			<th>기능성 성분 여부</th>
			<td>${ingt.functional}</td>
		</tr>
			<td colspan="2" align="right" style="background-color: #f7f7f7; "><input type="button" value="수정"
				onclick="location.href='IngtUpdateForm.do?ingredientNo=${ingt.ingredientNo}&pageNum=${pageNum}'">
				<input type="button" value="삭제" onClick="del_chk()">
				<input type="button" value="목록"
				onclick="location.href='IngtList.do?pageNum=${pageNum}'"></td>
	</table>
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