<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Write View</title>
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript">
	var openWin;
	function openChild() {
		window.name = "KISItemWriteForm";
		openWin = window.open("./PopupList.do", "_blank", "width=800 height=600");
	}
	
	function changeSel() {
		$.ajax({
			url : '/BMW/ItemCateSel.do',
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
</script>
</head>
<body>
	<form action="ItemWritePro.do?pageNum=${pageNum}" name="frm" method="post">
	<input type="hidden" name="memberId" value="kis">
		<table>
			<caption>
				<h2>제품 등록</h2>
			</caption>
			<tr>
				<td>카테고리</td>
				<td>
					<label for="category">대분류</label>
					<select id="category" onChange="changeSel();" required="required">
						<option value="">대분류</option>
						<c:forEach var="cate" items="${list}">							
							<option value="${cate.categoryNo}" >${cate.name}</option>
						</c:forEach>
					</select>
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
				<td><input type="text" name="price"></td>
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
					<input type="hidden" name="receiveValue" id="receiveValues">
					<input type="button" value="성분등록하기" onclick="openChild()"><br>
					<!-- 체크한 성분명 -->
<!-- 					<input type="text" name="ingtName" id="ingtName"> -->
					<textarea rows="3" cols="40" name="ingtName" id="ingtName" readonly="readonly"></textarea>
					</td>
			</tr>
			<!-- 제품사진 -->
			<tr>
				<td>제품사진</td>
				<td><input type="text"><input type="button" value="파일첨부"></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
				<td><input type="button" value="목록가기"
				onclick="location.href='ItemList.do?pageNum=${pageNum}'"></td>
			</tr>
		</table>
	</form>
</body>
</html>