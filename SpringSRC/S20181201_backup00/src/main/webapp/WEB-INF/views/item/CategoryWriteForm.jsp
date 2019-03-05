<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

	function chk() {
		if(!frm.name.value) {
			alert("이름을 입력한 후에 확인하세요");
			frm.name.focus();
			return false;
		} else {
			location.replace("CategoryNameConfirm.do?name=" + frm.name.value);
		}
	}
	
	$(document).ready(function() {
		$.ajax({
			url : "CategoryAddParent.do",
			dataType : "html",
			error : function() {
				alert("안되 다시햇");
			},
			success : function(data) {
				$('#CategoryAddParent').html(data);
			}
		});
	});
	
	
</script>
</head>
<body>
<header><%@ include file="../partials/header.jsp" %></header>
	<h2>카테고리 추가</h2>
	
	<form action="CategoryWritePro.do" method="post" name="frm">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required="required" value="${name}">
					<input type="button" value="중복확인" onclick="chk()">
					<span style="color: red;"><c:if test="${msg != null}">${msg}</c:if></span>
					
					<div class="container">
					<!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">부모 카테고리 생성</button>
					
				  	<!-- Modal -->
				  	<div class="modal fade" id="myModal" role="dialog">
				  		<div class="modal-dialog">
				  		
				  		<!-- Modal content -->
				  		<div class="modal-content">
				  			<div class="modal-header">
				  				<button type="button" class="close" data-dismiss="modal">&times;</button>
				  				<h4 class="modal-title">부모 카테고리 생성</h4>
				  			</div>
				  			<div class="modal-body" id="CategoryAddParent">
				  				
				  			</div>
				  			<div class="modal-footer">
				  				<button type="button" class="btn btn-default" data-dismiss="modal" id="save">저장</button>
				  				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
					</div>
										
<!-- 					<input type="button" value="부모카테고리 생성" onclick="window.open('NYSAddParentCate.do','', 'width=482, height=252')"></td> -->
				</td>
			</tr>
			<tr>
				<th>상위 카테고리</th>
				<td><c:if test="${!empty list}">
						<select name="parent" value="${parent}">
							<option value="" selected="selected" disabled="disabled">선택</option>
							<c:forEach var="list" items="${list}">
								<option value="${list.name}">${list.name}</option>
							</c:forEach>
						</select>
				</c:if>
				</td>
			</tr>
			<tr>
				<th>공개 여부</th>
				<td><input type="radio" name="isPublic" value="0">비공개
					<input type="radio" name="isPublic" value="1" required="required">공개</td>
			</tr>
			<tr>
				<th>분류</th>
				<td>
<!-- 				<input type="hidden" name="division" value="0">상위카테고리 -->
				<input type="hidden" name="division" value="1">하위카테고리</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>



</body>
</html>