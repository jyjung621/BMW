<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Item Write View</title>
<script type="text/javascript">
// 	function changeSel() {
// 		$.ajax({
// 			url : 'KISItemCateSel.do',
// 			data : {
// 				optionSel : $('#category option:selected').val()
// 			},
// 			dataType : 'json',
// 			success : function(data) {
// 				console.log("데이터 : " + data);
// 				let html = "";
// 				$.each(data, function(index, comm) {
// 					html += "<option value='" + comm.name + "'>"
// 							+ comm.name + "</option>";
// 				})
// 				$('#category2').html(html);
// 			}
// 		});
// 	}

// 	function ingtDel() {
// 		$("#ingtName").val('');
// 	}

	// 등록할 성분 선택하는 팝업 띄움
	function openPop() {
		$.ajax({
			url : "KISPopIngtList.do",
			dataType : "html",
			error : function() {
				alert("통신실패!!");
			},
			success : function(data) {
				$('#poplist').html(data);
			}
		});
	}
	
	function saveBtn() {
		var NoArr = new Array();
		var NameArr = new Array();

		$("input:checkbox[name=myCheck]:checked").each(function() {
			NoArr.push($(this).val());
			var data = $(this).val();
			NameArr.push($("#chk_" + data).val());
		});
		var receiveValues = document.getElementById("receiveValues").value;
		var ingtName = document.getElementById("ingtName").value;

		document.getElementById("receiveValues").value = NoArr;
		document.getElementById("ingtName").value = NameArr;
	}
</script>
<style type="text/css">
	.modal-title{
		float : left;
	}
	#modal-content {
		position: relative;
		margin-left: -35%;
		margin-top : 15%;
		overflow : auto;
		width: 950;		
	}
</style>
</head>
<body>
	<h2>제품 등록</h2>
	<header><%@ include file="../partials/header.jsp" %></header>
	<form action="KISItemWrite.do" name="frm" method="post">
<%-- 	<input type="hidden" name="regDate" value="${regDate}"> --%>
		
		<!-- memberId값 받아오는 걸로 변경할것 -->
		<input type="hidden" name="memberId" value="kis">
		<table>
			<tr>
				<%-- <th width="200" class="title">카테고리</th>
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
				</td> --%>
				<th width="200">카테고리</th>
				<td>
					<select id="parentCate" name="categoryNo" required="required" onChange="changeSel()">
						<c:forEach var="cate" items="${catelist}">
							<option value="${cate.categoryNo}">${cate.name}</option>
						</c:forEach>
					</select>
					<%-- <select id="childCate">
						<c:forEach var="child" items="${childCate}">
							<option value="${child.categoryNo}">${child.name}</option>
						</c:forEach>
					</select> --%>
					
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
				<th class="title">재고</th>
				<td><input type="number" name="itemStock" required="required"></td>
			</tr>
			<tr>
				<th class="title">제품정보</th>
				<td><textarea rows="10" cols="40" name="info"></textarea></td>
			</tr>
			<tr>
				<th class="title">가격</th>
				<td><input type="text" name="price" value="0"></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th class="title">평점</th> -->
<!-- 				<td><input type="text" name="rating" value="0"></td> -->
<!-- 			</tr> -->
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
					<input type="hidden" name="receiveValue" id="receiveValues" value="0">					
					<div class="container">
					<!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" onClick="openPop(); return false;">성분 등록</button>
					<!-- Modal -->
				    <div class="modal fade" id="myModal" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      <div id="modal-content" class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title" >성분 리스트</h4>
					        </div>
					        <div id="poplist" class="modal-body">
					          <p>Some text in the modal.</p>
					        </div>
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default" onclick="saveBtn()">저장</button>
					          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					        </div>
					      </div>
					      
					    </div>
					  </div>					  
					</div>
										
					<br>
					<textarea rows="3" cols="40" name="ingtName" id="ingtName" readonly="readonly"></textarea>
				</td>
			</tr>
			<tr>
				<th class="title">해시태그</th>
				<td><input type="text" name="htag"></td>
			</tr>
			<!-- 제품사진 -->
			<!-- <tr>
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
			</tr> -->
			<td colspan="2">
				<input type="submit" value="확인">
				<input type="button" value="취소" onclick="history.go(-1)">
			</td>
		</table>
	</form>
<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>