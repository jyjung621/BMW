<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성분 체크 팝업</title>
<style type="text/css">
table {
	width: 100%;
}

th {
	background-color: #ddd;
}

td {
	background-color: #eee;
}
</style>
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url : '/BMW/IngtList.do?PageType=pop',
			dataType : 'html',
			success : function(data) {
				$('#TEST1').html(data);
			}
		});
	});

	function checkClick() {
		if ($("input[name=myChecks]:checkbox").prop("checked") == true) {
			$("input[name=myCheck]:checkbox").prop("checked", "checked");
		} else {
			$("input[name=myCheck]:checkbox").removeProp("checked");
		}
	}

	function saveBtn() {
		var NoArr = new Array();
		var NameArr = new Array();

		$("input:checkbox[name=myCheck]:checked").each(function() {
			NoArr.push($(this).val());
			var data = $(this).val();
			NameArr.push($("#chk_" + data).val());
		});
		var receiveValues = opener.document.getElementById("receiveValues").value;
		var ingtName = opener.document.getElementById("ingtName").value;

		opener.document.getElementById("receiveValues").value = NoArr;
		opener.document.getElementById("ingtName").value = NameArr;
	}
</script>
</head>
<body>

	<h2>해당하는 성분 체크</h2>
	<input type="button" onclick="saveBtn()" value="저장">
	<input type="button" onclick="top.window.close()" value="창닫기">
	<input type="button" value="성분등록"
		onClick="location.href='./PopupWriteForm.do'">
	<table>
		<tr>
			<th><input type="checkbox" name="myChecks"
				onclick="checkClick()"></th>
			<th>번호</th>
			<th>성분명</th>
			<th>위험도 등급</th>
			<th>20가지 주의성분</th>
			<th>알레르기 주의성분</th>
			<th>피부타입별 특이성분</th>
			<th>기능성 성분 여부</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="ingt" items="${list}">
				<tr>
					<td>					
					<input type="checkbox" value="${ingt.ingredientNo}" name="myCheck"
						<c:forEach var="ingtlist" items="${mappList}">
						<c:if test="${ingt.ingredientNo == ingtlist.ingredientNo}">checked="checked"</c:if>
						</c:forEach>>  					 
						<input type="hidden" id="chk_${ingt.ingredientNo}" value="${ingt.name}"></td>
					<td>${ingt.ingredientNo}</td>
					<td>${ingt.name}</td>
					<td>${ingt.grade}</td>
					<td>${ingt.danger20}</td>
					<td>${ingt.dangerAllergy}</td>
					<td>${ingt.specialyType}</td>
					<td>${ingt.functional}</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1}" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0}">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>
	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href="IngtList.do?pageNum=${startPage-blockSize}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="/BMW/PopupList.do?pageNum=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href="/BMW/PopupList.do?pageNum=${startPage+blockSize}">[다음]</a>
		</c:if>
	</div>

</body>
</html>