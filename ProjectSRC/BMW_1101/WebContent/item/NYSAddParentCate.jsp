<%@page import="dao.NYSCateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Category</title>	
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	
	$(function() {
		$('#chk').click(function() {
			var id = $('#name').val();
			//console.log('id -> ' + id);
			var sendData = "name=" + id;
			//console.log('sendData -> ' + sendData);
			
			$.post('../CategoryConfirmName.do', sendData, function(msg) {
// 				console.log("도착...");
// 				console.log("msg -> " + msg);
 				$('#msg').html(msg);
 		    });
		});
	});
	
 	 $(function(){
	        $('#save').click(function() {
	            //중복 check된 value를 가지고 오고
	            var id = $('#name').val();
	            console.log('id -> ' + id);
	            var isPublic = $('input:radio[name=isPublic]').val();
	            console.log('isPublic -> ' + isPublic);
	            var sendData = "name=" + id +"&isPublic=" + isPublic;
	            console.log('sendData -> ' + sendData);
	            
	            $.post('../CategoryAddParent.do', sendData, function(msg){
	            	//문자열 공백 제거
	            	var msg1=msg.replace(/(\s*)/g,"");
	            	
		            alert("msg->**"+msg1 +"**");
	                if(msg1 == 1) {
			            alert("if msg1->"+msg1);
			            // 부모창 리프레시 시켜주기
			            window.opener.location.reload();
	                    self.close();
	                };
	            });
	    	});
 	 });
	

</script>
</head>
<body>	
<%-- <form action="cateWriteForm.do?pageNum=${pageNum}" method="post" name="frm"> --%>
	<h2>카테고리 추가</h2>
	<form method="post">
	<p>
		카테고리명 : <input type="text" name="name" id="name" required="required">
			<input type="button" value="중복체크" id="chk">
			<span id="msg"></span>
	</p>
	<p>공개여부 
		<input type="radio" name="isPublic" value="1" checked="checked">공개
		<input type="radio" name="isPublic" value="0">비공개
	</p>
		<input type="button" value="확인" id="save">
		<input type="button" value="취소" onclick="self.close()">
	</form>
</body>
</html>