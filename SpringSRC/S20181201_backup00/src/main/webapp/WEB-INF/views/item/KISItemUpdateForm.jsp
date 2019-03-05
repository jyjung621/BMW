<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Item Update View</title>
<script type="text/javascript">
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
	<h2>제품 수정</h2>
	<header><%@ include file="../partials/header.jsp" %></header>
	<form id="frm" name="frm" action="KISItemUpdate.do" method="post">
		<!-- 제품정보의 카테고리 부모이름 -->
		<input type="hidden" name="itemCatregoryParentName"
			value="${cateInfo.parent == null ? cateInfo.name : cateInfo.parent}">
		<input type="hidden" name="itemNo" value="${item.itemNo}">
		<input type="hidden" name="pageNum" value="${pageNum}"> <input
			type="hidden" name="memberId" value="${memberId}"> <input
			type="hidden" name="categoryNo" value="${item.categoryNo}">
		<table border="1">
			<tr>
				<th class="title" width="200">제품번호</th>
				<td>${item.itemNo}</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
<!-- 기존에 등록한 카테고리 선택되어 있게 수정해야함 -->
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
				<td><input type="text" name="brand" value="${item.brand}"
					required="required"></td>
			</tr>
			<tr>
				<th class="title">제품명</th>
				<td><input type="text" name="name" value="${item.name}"
					required="required"></td>
			</tr>
			<tr>
				<th class="title">재고</th>
				<td><input type="number" name="itemStock" value="${item.itemStock}"></td>
			</tr>
			<tr>
				<th class="title">제품정보</th>
				<td><textarea rows="10" cols="40" name="info">${item.info}
									</textarea></td>
			</tr>
			<tr>
				<th class="title">가격</th>
				<td><input type="text" name="price" value="${item.price}"></td>
			</tr>
			<tr>
				<th class="title">공개여부</th>
				<td><input type="radio" name="isPublic" value="1"
					checked="checked" required="required">공개 <input
					type="radio" name="isPublic" value="0" required="required">비공개
				</td>
			</tr>
			<tr>
				<th class="title">등록된 성분</th>
				<td>
					<c:forEach var="mapp" items="${mapplist}">
						${mapp.name} /
					</c:forEach>
				</td>
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
<!-- 			<tr> -->
<!-- 				<th class="title">제품사진</th> -->
<!-- 				<td> -->
<!-- 					<table border="1"> -->
<!-- 						<tr align="left"> -->
<%-- 							<c:forEach var="saveFile" items="${item.saveFileList }"> --%>
<%-- 								<c:set var="startNum" value="${startNum + 1 }"></c:set> --%>
<%-- 								<td id="picture${startNum }"><img --%>
<%-- 									title="${saveFile.savedFileName }" --%>
<%-- 									src="/BMW/${saveFile.filePath }/${saveFile.savedFileName}"><br> --%>
<%-- 									<input type="button" name="deleteFiles${startNum }" --%>
<%-- 									value="파일삭제${startNum }" --%>
<%-- 									onclick="deleteFile('#picture${startNum}',${saveFile.filesNo})"></td> --%>
<%-- 							</c:forEach> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><input type="file" name="saveFiles1"></td> -->
<!-- 							<td><input type="file" name="saveFiles2"></td> -->
<!-- 							<td><input type="file" name="saveFiles3"></td> -->
<!-- 						</tr>	 -->
<!-- 					</table> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<td colspan="2">
					<input type="submit" value="수정하기">
					<input type="button" class="btn1" value="취소" onclick="history.go(-1)"></td>
			</tr>
		</table>
<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>