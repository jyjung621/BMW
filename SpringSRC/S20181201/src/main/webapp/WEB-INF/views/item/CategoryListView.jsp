<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category List View</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

	 $(function(){
	        $('#delete').click(function() {
	            
	        	var categoryNo = $('#cateNum').val();
	        	var sendData = "categoryNo=" + categoryNo;

	            console.log('sendData -> ' + sendData);
	            
	            $.post('CategoryDelete.do', sendData, function(msg){

	            	console.log('msg1 -> ' + msg);
	            	
	                if(msg == 1) {
			            // 부모창 리프레시 시켜주기
			            window.location.reload();
	                };
	            });
	    	});
 		 });

	 function del(cateNum) {
		
		console.log('test -> ' + cateNum);
		$(".modal-body #cateNum").val(cateNum);
	 }
	 
</script>
</head>
<body>
<header><%@ include file="../partials/header.jsp" %></header>
	<h2>카테고리 List</h2>
		<table border="1" align="center">
		<a href="CategoryWriteForm.do"><button>카테고리 등록</button></a>
		<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		<tr>
			<th class="title">카테고리 번호</th>
			<th class="title">카테고리 이름</th>
			<th class="title">상위 카테고리</th>
			<th class="title">공개여부</th>
			<th class="title">분류</th>
			<th class="title">수정/삭제</th>
		</tr>
		<c:if test="${total > 0 }">
			<c:forEach var="cate" items="${CategoryListView}">
				<tr>
					<td>${cate.categoryNo}</td>
					<td><c:if test="${cate.division == 1}"> ─ </c:if>${cate.name}</td>
					<td>${cate.parent}</td>
					<td>${cate.isPublic}</td>
					<td>${cate.division}</td>
					<td>
						<input type="button" value="수정" onclick="location.href='CategoryUpdateForm.do?categoryNo=${cate.categoryNo}'">
<%-- 						<input type="button" value="삭제" onclick="location.href='NYSCateDelete.do?categoryNo=${cate.categoryNo}'">						 --%>

						<div class="container">
							<!-- Trigger the modal with a button -->
							<button type="button" class="btn btn-info btn-sm"
								data-toggle="modal" data-target="#myModal" onclick="del(${cate.categoryNo})">카테고리 삭제</button>

							<!-- Modal -->
							<div class="modal fade" id="myModal" role="dialog">
								<div class="modal-dialog">

									<!-- Modal content -->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">카테고리 삭제</h4>
										</div>
										
										<div class="modal-body">
											<h2>정말 삭제하시겠습니까?</h2>
											<input type="hidden" id="cateNum">
										</div>
										
										<div class="modal-footer">
											<input type="button" class="btn btn-default"
												data-dismiss="modal" id="delete" value="삭제">											
											<button type="button" class="btn btn-default"
												data-dismiss="modal">취소</button>
										</div>
									</div>
								</div>
							</div>
						</div>

					</td>
				</tr>
			<c:set var="num" value="${num-1}"></c:set>	
			</c:forEach>
		</c:if>
		<c:if test="${total == 0 }">
			<tr>
				<td colspan=7>데이터가 없음</td>
			</tr>
		</c:if>
	</table>

	<div style="text-align: center;">
	<c:if test="${pg.startPage > pg.pageBlock}">
		<a href="CategoryListView.do?currentPage=${pg.startPage - pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
		<a href="CategoryListView.do?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage}">
		<a href="CategoryListView.do?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	</c:if>
	</div>



<footer><%@ include file="../partials/footer.jsp" %></footer>

</body>
</html>