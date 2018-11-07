<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>

<style type="text/css">
	table {
		width : 60%;
		margin : auto;
		text-align : center;
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
	$(function() {
		$("reviewComment").load('ItemCommentContent.do?itemNo=${comm.mainNo}&reviewNo=${comm.subNo }');
	});
	
	function reviewUpdate() {
		location.replace('ItemReviewUpdateForm.do?itemNo=${comm.mainNo}&reviewNo=${comm.subNo }&pageNum=${pageNum }&pageNumRv=${pageNumRv}');
	}
	
	function del_chk() {
		if (confirm("리뷰를 삭제 하시겠습니까?") == true) {
			location.replace("ItemReviewDeletePro.do?itemNo=${comm.mainNo}&reviewNo=${comm.subNo}&pageNum=${pageNum}&pageNumRv=${pageNumRv}");
		} else {
			return;
		}
	}
	
	function listView() {
		location.replace('ItemContent.do?itemNo=${comm.mainNo}&pageNum=${pageNum}&pageNumRv=${pageNumRv}');		
	}
	
	$.ajaxSetup({
		type : "POST",
		async : true,
		dataType : "JSON",
		error : function(xhr) {
			console.log("error html = " + xhr.statusText);
		}
	});
	
	function likeCnt() {
		$.ajax({
			url : 'ItemReviewLike.do',
			data : {
				mainNo : "${comm.mainNo}",
				reviewNo : "${comm.subNo}"
			},
			beforeSend : function() {
				console.log("likeCnt 전...");
			},
			complete : function() {
				console.log("likeCnt 완료...!");
			},
			success : function(data) {
				var data = JSON.parse(data);
				console.log("likeCnt()를 정상적으로 성공!!");
				console.log("data -> " + data.likeCnt);
				$("#likeChk").html(data.likeCnt);
				
			}
		});
	};
	
</script>
</head>
<body>
	<table border="1">
		<caption>리뷰 상세내용</caption>
		<tr>
			<td width="100">제품 정보</td>
			<td>${comm.mainNo }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${comm.memberId }</td>
		</tr>
		<tr>
			<td>작성일자</td>
			<td>${comm.regDate }</td>
		</tr>
		<tr>
			<td>평점</td>
			<td>${comm.rating }</td>
		</tr>
		<tr>
			<td>추천수</td>
			<td id="likeChk">${comm.likeCnt }</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${comm.hits }</td>
		</tr>
		<tr>
			<td>좋았던 점</td>
			<td>${comm.content }</td>
		</tr>
		<tr>
			<td>아쉬웠던 점</td>
			<td>${comm.content2 }</td>
		</tr>
		<tr>
			<td>꿀 Tip</td>
			<td>${comm.content3 }</td>
		</tr>
		<tr>
			<td>사진</td>
			<td>
				<table border="0">
					<c:forEach var="saveFile" items="${comm.saveFileList }">
<%-- 						<c:set var="startNum" value="${startNum + 1 }"/> --%>
						<tr>
<%-- 							<td>파일명 ${startNum }</td> --%>
<%-- 							<td>${saveFile.originFileName }</td> --%>
<%-- 							<td>${saveFile.filePath }</td> --%>
							<td><img title="${saveFile.savedFileName }" src="/BMW/${saveFile.filePath }/${saveFile.savedFileName}"></td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="Like" onclick="likeCnt()">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="reviewUpdate()">
				<input type="button" value="삭제" onClick="del_chk()">
				<input type="button" value="목록" onclick="listView()"></td>
		</tr>
	</table>
	<hr>

	<reviewComment></reviewComment>
	
</body>
</html>