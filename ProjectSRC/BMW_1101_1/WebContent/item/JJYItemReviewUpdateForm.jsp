<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Review Update View</title>

<style type="text/css">
	table {
		width: 60%;
		margin: auto;
		text-align: center;
	}
	
	td {
		text-align: center;
	}
	
	img {
		width: 100px;
		height: auto;
	}
	
	caption {
		text-align: center;
		font-size: x-large;
	}
</style>

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
</head>
<body>
	<form action="ItemReviewUpdatePro.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mainNo" value="${comm.mainNo}"> 
		<input type="hidden" name="subNo" value="${comm.subNo}"> 
		<input type="hidden" name="ref_Table" value="${comm.ref_Table}"> 
		<input type="hidden" name="pageNum" value="${pageNum}"> 
		<input type="hidden" name="pageNumRv" value="${pageNumRv}"> 
		<!-- memverId 받아와야함 -->
		<input type="hidden" name="memberId" value="jjy">
		
		<table border="1">
			<caption>리뷰 수정</caption>
			<tr>
				<td>제품정보</td>
				<td>${comm.mainNo }</td>
			</tr>
			<tr>
				<td>평점</td>
				<td colspan="3">
					<select name="rating">
						<option value="1">1점</option>
						<option value="2">2점</option>
						<option value="3" selected>3점</option>
						<option value="4">4점</option>
						<option value="5">5점</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>좋았던 점</td>
				<td>
					<textarea rows="5" cols="60" name="content">${comm.content }</textarea> 
				</td>
			</tr>
			<tr>
				<td>아쉬웠던 점</td>
				<td>
					<textarea rows="5" cols="60" name="content2">${comm.content2 }</textarea> 
				</td>
			</tr>
			<tr>
				<td>꿀 Tip</td>
				<td>
					<textarea rows="5" cols="60" name="content3">${comm.content3 }</textarea> 
				</td>
			</tr>
			<tr>
				<td>사진</td>
				<td>
					<table border="1">
						<tr align="left">
						<c:forEach var="saveFile" items="${comm.saveFileList }">
							<c:set var="startNum" value="${startNum + 1 }"></c:set>						
								<td id="picture${startNum }"><img title="${saveFile.savedFileName }" src="/BMW/${saveFile.filePath }/${saveFile.savedFileName}"><br>
									<input type="button" name="deleteFiles${startNum }" value="파일삭제${startNum }" onclick="deleteFile('#picture${startNum}',${saveFile.filesNo})"></td> 												
						</c:forEach>
						</tr>
						<tr>
							<td><input type="file" name="saveFiles1"></td>
							<td><input type="file" name="saveFiles2"></td>
							<td><input type="file" name="saveFiles3"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>사진</td>
				<td>
					<img src="./images/cosmetic01.jpg">
					<img src="./images/cosmetic02.jpg">
				</td>
			</tr>
			<tr>
				<td>공개여부</td>
				<td>
					<input type="radio" name="isPublic" value="1" checked="checked" required="required">공개
					<input type="radio" name="isPublic" value="0" required="required">비공개
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정완료">
					<input type="button" value="취소" onclick="updateCancle()">
				</td>
			</tr>	
		</table>
	</form>
</body>
</html>