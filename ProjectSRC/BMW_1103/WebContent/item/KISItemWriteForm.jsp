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
		openWin = window.open("./PopupList.do", "_blank", "width=800 height=600");
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
					html += "<option value='" + comm.categoryNo + "'>" + comm.name + "</option>";					
				})
				$('#category2').html(html);
			}
		});
	}
	
	function ingtDel() {
		$("#ingtName").val('');
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
					<div class="col-12">
						<!-- Blog -->
						<section>
							<header class="major" style="margin-bottom: 0px;">
								<h2>제품 등록</h2>
							</header>
						</section>
	<form action="ItemWritePro.do?pageNum=${pageNum}" name="frm" method="post" enctype="multipart/form-data">
	<input type="hidden" name="memberId" value="${memberId }">
		<table>
			<tr>
				<td>카테고리</td>
				<td colspan="1">
					<label for="category">대분류</label>
					<select id="category" onChange="changeSel();" required="required">
						<option value="">대분류</option>
						<c:forEach var="cate" items="${list}">							
							<option value="${cate.categoryNo}" >${cate.name}</option>
						</c:forEach>
					</select>
				</td>
				<td colspan="1">
					<label for="category2">소분류</label>
					<select id="category2" name="category2">	
					</select>					
				</td>
			</tr>
			<tr>
				<td>브랜드</td>
				<td><input type="text" name="brand" required="required"></td>
			</tr>
			<tr>
				<td>제품명</td>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<td>제품정보</td>
				<td><textarea rows="10" cols="40" name="info"></textarea></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="0"></td>
			</tr>	
			<tr>
				<td>공개여부</td>
				<td>
					<input type="radio" name="isPublic" checked="checked" value="1" required="required">공개
					<input type="radio" name="isPublic" value="0" required="required">비공개
				</td>
			</tr>
			<!-- 성분등록하기 -->
			<tr>
				<td>성분등록</td>
				<td>
					<!-- 체크한 성분번호  -->
					<input type="hidden" name="receiveValue" id="receiveValues" value="0">
					<input type="button" value="성분등록하기" onclick="openChild()">
					<input type="button" value="성분삭제" onclick="ingtDel()"><br>
					<!-- 체크한 성분명 -->
					<textarea rows="3" cols="40" name="ingtName" id="ingtName" readonly="readonly"></textarea>
					</td>
			</tr>
			<!-- 제품사진 -->
			<tr>
				<td>사진1</td>
				<td><input type="file" name="saveFiles1"></td>
			</tr>
			<tr>
				<td>사진2</td>
				<td><input type="file" name="saveFiles2"></td>
			</tr>
			<tr>
				<td>사진3</td>
				<td><input type="file" name="saveFiles3"></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
				<td><input type="button" value="취소"
				onclick="history.go(-1)"></td>
			</tr>
		</table>
	</form>
		<!-- 	</form> -->
		</section>

	</div>
	</div>
	</div>
	</section>
	</div>


	<!-- <footer0></footer0> -->
<%@ include file="../footer.jsp"%>
</body>
</html>