<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Review Update View</title>
<script type="text/javascript">
	function updateCancle() {
		history.go(-1);		
/* 		location.replace('ItemList.do?pageNum=${pageNum}');		 */
	}
	
	$.ajaxSetup({
		type : "POST",
		async : true,
		dataType : "JSON",
		error : function(xhr) {
			console.log("error html = " + xhr.statusText);
		}
	});
	
	function deleteFile(tdId, filesNo) {
		$.ajax({
			url : 'ItemReviewPictureDelete.do',
			data : {
				mainNo : "${comm.mainNo}", 
				subNo : "${comm.subNo}",
				ref_Table : "COMMENTS",
				filesNo : filesNo
			},
			beforeSend : function() {
				console.log("deleteFile 전...");
			},
			complete : function() {
				console.log("deleteFile 완료...!");
			},
			success : function(data) {
				console.log("deleteFile()를 정상적으로 성공!!");
// 				var data = JSON.parse(data);
				
				console.log("data -> " + data.fileName);
				if(data.fileName === "DBerror1" || data.fileName === "DBerror2") {
					console.log("삭제중 이상발생 -> " + data.fileName);
				} else {
					$(tdId).html(data.fileName + " >> 삭제완료");		
				}
			}
		});
	}
</script>
<style type="text/css">
table {
	width: 100%;
	margin: auto;
	text-align: center;
}

th {
	background-color: #ddd;
	text-align: center;
}

th.title {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

td {
	text-align: left;
	background-color: #eee;
}


caption {
	text-align: center;
	font-size: x-large;
}
</style>
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
								<h2>리뷰 수정</h2>
							</header>
						</section>
						<form action="ItemReviewUpdatePro.do" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="isPublic" value="1">
							<input type="hidden" name="mainNo" value="${comm.mainNo}">
							<input type="hidden" name="subNo" value="${comm.subNo}">
							<input type="hidden" name="ref_Table" value="${comm.ref_Table}">
							<input type="hidden" name="pageNum" value="${pageNum}"> <input
								type="hidden" name="pageNumRv" value="${pageNumRv}">
							<!-- memverId 받아와야함 -->
							<input type="hidden" name="memberId" value="jjy">

							<table border="1">
								<tr>
									<th class="title" width="200">제품정보</th>
									<td>${comm.mainNo }</td>
								</tr>
								<tr>
									<th class="title">평점</th>
									<td colspan="3"><select name="rating" style="width:100px;height:30px;">
											<option value="1">1점</option>
											<option value="2">2점</option>
											<option value="3" selected>3점</option>
											<option value="4">4점</option>
											<option value="5">5점</option>
									</select></td>
								</tr>
								<tr>
									<th class="title">좋았던 점</th>
									<td><textarea rows="5" cols="60" name="content">${comm.content }</textarea>
									</td>
								</tr>
								<tr>
									<th class="title">아쉬웠던 점</th>
									<td><textarea rows="5" cols="60" name="content2">${comm.content2 }</textarea>
									</td>
								</tr>
								<tr>
									<th class="title">꿀 Tip</th>
									<td><textarea rows="5" cols="60" name="content3">${comm.content3 }</textarea>
									</td>
								</tr>
								<tr>
									<th class="title">사진</th>
									<td>
										<table border="1">
											<tr align="left">
												<c:forEach var="saveFile" items="${comm.saveFileList }">
													<c:set var="startNum" value="${startNum + 1 }"></c:set>
													<td id="picture${startNum }"><img style="width: 500px; height: 450px;"
														title="${saveFile.savedFileName }"
														src="/BMW/${saveFile.filePath }/${saveFile.savedFileName}"><br>
														<input type="button" name="deleteFiles${startNum }" value="파일삭제${startNum }" onclick="deleteFile('#picture${startNum}',${saveFile.filesNo})"></td>
												</c:forEach>
											</tr>
											<!-- 제품사진 -->
												<tr>
												<td><input type="file" name="saveFiles1"></td>
												<td><input type="file" name="saveFiles2"></td>
												<td><input type="file" name="saveFiles3"></td>
												</tr>
										</table>
									</td>
								</tr>							
								
							</table>
							<div align="center">
								<input type="submit" value="수정완료">
								<input type="button" value="취소" onclick="updateCancle()">
							</div>
						</form>
						<!-- 	</form> -->

	</div>
	</div>
	</div>
	</section>
	</div>


	<!-- <footer0></footer0> -->
	<%@ include file="../footer.jsp"%>
</body>
</html>