<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Write View</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	var openWin;
	function openChild() {
		window.name = "KISItemWriteForm";
		openWin = window.open("./PopupList.do", "_blank",
				"width=800 height=600");
	}

	function changeSel() {
		$.ajax({
			url : 'ItemCateSel.do',
			data : {
				optionSel : $('#category option:selected').val()
			},
			dataType : 'json',
			success : function(data) {
				console.log("데이터 : " + data);
				let html = "";
				$.each(data, function(index, comm) {
					html += "<option value='" + comm.categoryNo + "'>"
							+ comm.name + "</option>";
				})
				$('#category2').html(html);
			}
		});
	}

	function ingtDel() {
		$("#ingtName").val('');
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
								<h2>제품 등록</h2>
							</header>
						</section>
						<form action="ItemWritePro.do?pageNum=${pageNum}" name="frm"
							method="post" enctype="multipart/form-data">
							<input type="hidden" name="memberId" value="${memberId}">
							<table>
								<tr>
									<th width="200" class="title">카테고리</th>
									<td><label for="category">대분류</label>
									<select	id="category" style="width:100px;height:30px;" onChange="changeSel();" required="required">
											<option value="">대분류</option>
											<c:forEach var="cate" items="${list}">
												<option value="${cate.categoryNo}">${cate.name}</option>
											</c:forEach>
									</select>
									<label for="category2">소분류</label>
									<select id="category2" style="width:100px;height:30px;" name="category2">
									</select>
									</td>
								</tr>
								<tr>
									<th class="title">브랜드</th>
									<td><input type="text" name="brand" required="required"></td>
								</tr>
								<tr>
									<th class="title">제품명</th>
									<td><input type="text" name="name" required="required"></td>
								</tr>
								<tr>
									<th class="title">제품정보</th>
									<td><textarea rows="10" cols="40" name="info"></textarea></td>
								</tr>
								<tr>
									<th class="title">가격</th>
									<td><input type="text" name="price" value="0"></td>
								</tr>
								<tr>
									<th class="title">공개여부</th>
									<td><input type="radio" name="isPublic" checked="checked"
										value="1" required="required">공개 <input type="radio"
										name="isPublic" value="0" required="required">비공개</td>
								</tr>
								<!-- 성분등록하기 -->
								<tr>
									<th class="title">성분등록</th>
									<td>
										<!-- 체크한 성분번호  --> <input type="hidden" name="receiveValue"
										id="receiveValues" value="0"> <input type="button"
										value="성분등록하기" onclick="openChild()"> <input
										type="button" value="성분삭제" onclick="ingtDel()"><br>
										<!-- 체크한 성분명 --> <textarea rows="3" cols="40" name="ingtName"
											id="ingtName" readonly="readonly"></textarea>
									</td>
								</tr>
								<!-- 제품사진 -->
								<tr>
									<th class="title">사진1</th>
									<td><input type="file" name="saveFiles1"></td>
								</tr>
								<tr>
									<th class="title">사진2</th>
									<td><input type="file" name="saveFiles2"></td>
								</tr>
								<tr>
									<th class="title">사진3</th>
									<td><input type="file" name="saveFiles3"></td>
								</tr>
								<td colspan="2" align="right" style="background-color: #f7f7f7; ">
									<input type="submit" value="확인">
									<input type="button" value="취소" onclick="history.go(-1)">
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