<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../SessionCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<!-- <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css"> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"> -->
<link rel="stylesheet" type="text/css" href="../main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>Item View</title>

<script type="text/javascript">

	$(function() {
		$("itemReview").load("ItemReviewList.do?itemNo=${item.itemNo}&pageNum=${pageNum}&pageNumRv=${pageNumRv}");
	});
	
	function del_chk() {
		if (confirm("제품을 삭제 하시겠습니까?") == true) {
			location.href="ItemDeletePro.do?itemNo=${item.itemNo}&pageNum=${pageNum}";
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
	

	// Slideshows
	var slideIndex = 1;

	function plusDivs(n) {
	slideIndex = slideIndex + n;
	showDivs(slideIndex);
	}

	function showDivs(n) {
	  var x = document.getElementsByClassName("mySlides");
	  if (n > x.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = x.length} ;
	  for (i = 0; i < x.length; i++) {
	     x[i].style.display = "none";  
	  }
	  x[slideIndex-1].style.display = "block";  
	}

	$(function () {
		showDivs(1);
	});

</script>
<style type="text/css">
img {
		width: 100px;
		height: auto;
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
								<h2>제품 상세내역</h2>
							</header>
						</section>
						


<!-- <img class="mySlides w3-animate-opacity" src="/w3images/snow.jpg" style="width:100%"> -->
<!-- <img class="mySlides w3-animate-opacity" src="/w3images/lights.jpg" style="width:100%"> -->
<!-- <img class="mySlides w3-animate-opacity" src="/w3images/mountains.jpg" style="width:100%"> -->
<!-- <img class="mySlides w3-animate-opacity" src="/w3images/forest.jpg" style="width:100%"> -->

<!-- <a class="w3-button w3-hover-dark-grey" style="position:absolute;top:45%;left:0;" onclick="plusDivs(-1)">❮</a> -->
<!-- <a class="w3-button w3-hover-dark-grey" style="position:absolute;top:45%;right:0;" onclick="plusDivs(+1)">❯</a>						 -->
						
				
						
			
		<div class="w3-content" style="max-width:800px;position:relative">
		<c:forEach var="saveFile" items="${item.saveFileList }">
			<img class="mySlides w3-animate-opacity" style="width:90%; margin: 0 auto" title="${saveFile.savedFileName }" src="/BMW/${saveFile.filePath }/${saveFile.savedFileName}">
		</c:forEach>
		<a class="w3-button w3-hover-dark-grey" style="position:absolute;top:45%;left:0;" onclick="plusDivs(-1)">❮</a>
		<a class="w3-button w3-hover-dark-grey" style="position:absolute;top:45%;right:0;" onclick="plusDivs(+1)">❯</a>

		</div>
	<table border="1">

		<tr>
			<td width="50">제품 번호</td>
			<td>${item.itemNo}</td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td>
				<c:forEach var="cate2" items="${cateAll}">
							<c:if test="${item.categoryNo == cate2.categoryNo}">${cate2.name}</c:if>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td>브랜드</td>
			<td>${item.brand}</td>
		</tr>
		<tr>
			<td>제품명</td>
			<td>${item.name}</td>
		</tr>
		<tr>
			<td>제품정보</td>
			<td>${item.info}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>${item.price}</td>
		</tr>
		<tr>
			<td>성분정보</td>
			<td>
				<c:forEach var="ingt" items="${list}">
					${ingt.name}
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td>평점</td>
			<td>${item.rating}</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${item.hits}</td>
		</tr>
		<tr>
			<td rowspan="2">좋아요</td>
			<td id="likeChk">${item.likeCnt}</td>			
		</tr>
		<c:if test="${grade == 0 || grade == 1 }">
		<tr>
			<td colspan="2">
				<input type="button" value="Like" onclick="likeCnt()">
<!-- 				<a class="w3-button w3-circle w3-large w3-black"><i class="fa fa-plus"></i></a> -->
			</td>
		</tr>
		</c:if>
		<tr>
			<td>공개여부</td>
			<td>${item.isPublic}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${item.memberId}</td>
		</tr>
		<tr>
			<td>등록일</td>
			<td>${item.regDate}</td>
		</tr>
		<tr>
			<td colspan="2">
			<c:if test="${grade == 0 }">
				<input type="button" value="수정" onclick="location.href='ItemUpdateForm.do?itemNo=${item.itemNo}&pageNum=${pageNum}'">
				<input type="button" value="삭제" onClick="del_chk()">
			</c:if>
				<input type="button" value="목록가기" onclick="location.replace('ItemCategoryHeader.do?cateNum=${cateNum}&pageNumIC=${pageNum}')">
			</td>
		</tr>
	</table>
	
	<hr>
	<itemReview></itemReview>
	<!-- 	</form> -->
		</section>

	</div>
	</div>
	</div>
	</section>
	</div>


	<!-- <footer0></footer0> -->
<%@ include file="../footer.jsp"%>
</body>
</html>