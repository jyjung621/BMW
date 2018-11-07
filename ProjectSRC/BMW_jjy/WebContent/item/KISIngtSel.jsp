<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ingredient Select View</title>
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
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
/* 			url : '/BMW/IngtList.do?PageType=pop', */
	$(document).ready(function() {
		$.ajax({
			url : '/BMWITEM/IngtList.do?PageType=pop',
			dataType : 'html',
			success : function(data) {
				$('#TEST1').html(data);
			}
		});
	});

	function checkClick() {
		if ($("input[name=myCheck]:checkbox").prop("checked") == true) {
			$("input[name=myCheck]:checkbox").prop("checked", "checked");
		} else {
			$("input[name=myCheck]:checkbox").removeProp("checked");
		}
	}

	function saveBtn() {
		var arr = new Array();
		$("input:checkbox[name=myCheck]:checked").each(function () {
			arr.push($(this).val());
			console.log(arr);

		});		
		opener.document.getElementById("receiveValues").value = arr;
	}
		/* $.ajax({
			url : '/BMW/ChkInsert.do',
			dataType : 'json',
			data : JSON.stringfy(arr), //arrayData, 
			success : function(data) {
				alert("성공");
			},
			error : function(data) {
				alert("실패");
			}
		}); 
	} */

	//KISingList.jsp에 check태그 있음
	// 체크박스 value들을 배열로 담아서 가져와야함
	// 배열데이터를 ajax로 insert.do 
	//저장이 완료되면 리턴값을 1이면 성공 0이면 실패 해서 alert띄워
	// var Array =  {Key(ingt) : value(성분번호)},{Key : value},{Key : value},{Key : value} 
	//$.ajax({ url:'/BMW/InsertCheck.do',
	// 	 dataType:'json',
	//	 data : arrayData, 
	// 	 success:function(data) {
	// 		data가 1이면 성공 메시지
	//		0이면 실패메시지하고 확인누르면 제품정보 목록으로 이동 (location.href)
	// 	 }
	// });

	// 1. 제품정보를 먼저 등록한다. 
	// 2. 성분목록에 저장할때 1에서 insert한 No를 가져와서 성분번호와 같이 저장
	// Bak : 성분목록용  dao insert 및 update만들어야함
	// insertCheck.do 성분목록 저장용 서비스도 만들어야함
</script>
</head>
<body>
	
	<div id="TEST1"></div>
</body>
</html>