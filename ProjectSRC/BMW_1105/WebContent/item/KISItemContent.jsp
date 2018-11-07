<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Item View</title>

<script type="text/javascript">
$(function() {
	$("itemReview").load("ItemReviewList.do?itemNo=${item.itemNo}&pageNum=${pageNum}&pageNumRv=${pageNumRv}");
	showDivs(1);
});

//Slideshows
var slideIndex = 1;

function plusDivs(n) {
	slideIndex = slideIndex + n;
	showDivs(slideIndex);
}

function showDivs(n) {
	var x = document.getElementsByClassName("mySlides");
	if (n > x.length) {
		slideIndex = 1
	}
	if (n < 1) {
		slideIndex = x.length
	}
	;
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";
	}
	x[slideIndex - 1].style.display = "block";
}




function del_chk() {
	if (confirm("제품을 삭제 하시겠습니까?") == true) {
		location.href = "ItemDeletePro.do?itemNo=${item.itemNo}&pageNum=${pageNum}";
	} else {
		return;
	}
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
		url : 'ItemLike.do',
		data : {
			itemNo : "${item.itemNo}"
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
				<div class="row" style="max-width: 100%; margin: 0 auto;">
					<div class="col-12">
						<!-- Blog -->
						<section>
							<header class="major" style="margin-bottom: 0px;">
								<h2>제품 상세내역</h2>
							</header>
						</section>
						<div class="w3-content"
							style="max-width: 400px; position: relative; left: 350px;">
							<c:forEach var="saveFile" items="${item.saveFileList }">
								<img class="mySlides w3-animate-opacity"
									style="width: 90%; margin: 0 auto"
									title="${saveFile.savedFileName }"
									src="/BMW/${saveFile.filePath }/${saveFile.savedFileName}">
									
								<a style="position: absolute; top: 45%; left: 0;" onclick="plusDivs(-1)">❮</a> 
								<a style="position: absolute; top: 45%; right: 0;" onclick="plusDivs(+1)">❯</a>
							</c:forEach>

						</div><br><br>
						<table>
							<tr>
								<th class="title" width="200">제품 번호</th>
								<td>${item.itemNo}</td>
							</tr>
							<tr>
								<th class="title">카테고리</th>
								<td><c:forEach var="cate2" items="${cateAll}">
										<c:if test="${item.categoryNo == cate2.categoryNo}">${cate2.name}</c:if>
									</c:forEach></td>
							</tr>
							<tr>
								<th class="title">브랜드</th>
								<td>${item.brand}</td>
							</tr>
							<tr>
								<th class="title">제품명</th>
								<td>${item.name}</td>
							</tr>
							<tr>
								<th class="title">제품정보</th>
								<td>${item.info}</td>
							</tr>
							<tr>
								<th class="title">가격</th>
								<td>${item.price}</td>
							</tr>
							<tr>
								<th class="title">성분정보</th>
								<td><c:forEach var="ingt" items="${list}">
					${ingt.name} /
				</c:forEach></td>
							</tr>
							<tr>
								<th class="title">평점</th>
								<td>${item.rating}</td>
							</tr>
							<tr>
								<th class="title">조회수</th>
								<td>${item.hits}</td>
							</tr>
							<tr>
								<th class="title" rowspan="2"
									style="display: table-cell; vertical-align: middle;">좋아요</th>
								<td id="likeChk">${item.likeCnt}</td>
							</tr>
							<tr>
								<c:if test="${grade < 3}">
									<td colspan="2"><input type="button" value="Like"
										onclick="likeCnt()"></td>
								</c:if>
							</tr>
							<tr>
								<th class="title">공개여부</th>
								<td>${item.isPublic}</td>
							</tr>
							<tr>
								<th class="title">작성자</th>
								<td>${item.memberId}</td>
							</tr>
							<tr>
								<th class="title">등록일</th>
								<td>${item.regDate}</td>
							</tr>
							<tr>
								<td colspan="2" align="right" style="background-color: #f7f7f7;">
									<c:if test="${grade == 0}">
										<input type="button" value="수정"
											onclick="location.href='ItemUpdateForm.do?itemNo=${item.itemNo}&pageNum=${pageNum}'">
										<input type="button" value="삭제" onClick="del_chk()">
									</c:if> <input type="button" value="목록가기"
									onclick="location.replace('ItemCategoryHeader.do?cateNum=${cateNum}&pageNumIC=${pageNum}')">
								</td>
							</tr>
						</table>

						<hr>
						<itemReview></itemReview>
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