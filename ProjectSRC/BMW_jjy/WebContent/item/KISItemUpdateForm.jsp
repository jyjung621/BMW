<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Update View</title>
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		selectedBigCategory();
	});
	var openWin;
	
	function openChild() {
		window.name = "KISItemUpdateForm";
		openWin = window.open("./PopupList.do?itemNo=${item.itemNo}", "_blank", "width=800 height=600");		
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
	
	function selectedBigCategory(){
		//name : 대분류 카테고리 이름
		var name = $('#frm [name="itemCatregoryParentName"]').val();

		//jquery에서 text값으로 선택하기
		 $("#category option:contains('"+name+"')").attr("selected", "selected");
	}
	

</script>
</head>
<body>
	<form id="frm" name="frm" action="ItemUpdatePro.do" method="post" onsubmit="return saveClick();">
		<!-- 제품정보의 카테고리 부모이름 -->
		<input type="hidden" name="itemCatregoryParentName" value="${cateInfo.parent == null ? cateInfo.name : cateInfo.parent}"> 
			<input type="hidden" name="itemNo" value="${item.itemNo}"> <input
			type="hidden" name="pageNum" value="${pageNum}"> <input
			type="hidden" name="memberId" value="kis">
			<input type="hidden" name="categoryNo" value="${item.categoryNo}">
		<table border="1">
			<caption>
				<h2>제품 수정</h2>
			</caption>
			<tr>
				<td>제품번호</td>
				<td>${item.itemNo}</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<label for="category">대분류</label>
					<select id="category" onChange="changeSel();">
						<option value="">대분류</option>
						<c:forEach var="cate" items="${list2}">	
							<option value="${cate.categoryNo}" >${cate.name}</option>
						</c:forEach>
						
					</select>
					<label for="category2">소분류</label>
			
					<select id="category2" name="category2">
						<option value="">소분류</option>
						<c:forEach var="childList" items="${childList}">
							<option value="${childList.categoryNo}" <c:if test="${childList.categoryNo == cateInfo.categoryNo}"> selected="selected"</c:if>>${childList.name}</option>
						</c:forEach>
					</select>					
				</td>
			</tr>
			<tr>
				<td>브랜드</td>
				<td><input type="text" name="brand" value="${item.brand}"
					required="required"></td>
			</tr>
			<tr>
				<td>제품명</td>
				<td><input type="text" name="name" value="${item.name}"
					required="required"></td>
			</tr>
			<tr>
				<td>제품정보</td>
				<td><textarea rows="10" cols="40" name="info"></textarea></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="${item.price}"></td>
			</tr>
			<tr>
				<td>공개여부</td>
				<td><input type="radio" name="isPublic" value="1"
					checked="checked" required="required">공개 <input
					type="radio" name="isPublic" value="0" required="required">비공개
				</td>
			</tr>
			<tr>
				<td>등록된 성분</td>
				<td><c:forEach var="ingt" items="${list}">
						${ingt.name}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>성분등록</td>
				<td>
					<!-- 체크한 성분번호  -->
					<input type="hidden" readonly="readonly" name="receiveValue" id="receiveValues">
					<input type="button" value="성분등록하기" onclick="openChild()"><br>
					<!-- 체크한 성분명 -->
<!-- 					<input type="text" readonly="readonly" name="ingtName" id="ingtName"> -->
					<textarea rows="3" cols="40" readonly="readonly" name="ingtName" id="ingtName"></textarea>
				</td>
			</tr>
			<!-- 제품사진 -->
			<tr>
				<td>제품사진</td>
				<td><input type="text"><input type="button" value="파일첨부"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정하기">
					<input type="button" value="취소" onclick="history.go(-1)">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>