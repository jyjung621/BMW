<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1">
<title>Item View</title>
<script type="text/javascript">
// //Slideshows
// var slideIndex = 1;

// function plusDivs(n) {
// 	slideIndex = slideIndex + n;
// 	showDivs(slideIndex);
// }

// function showDivs(n) {
// 	var x = document.getElementsByClassName("mySlides");
// 	if (n > x.length) {
// 		slideIndex = 1
// 	}
// 	if (n < 1) {
// 		slideIndex = x.length
// 	}
// 	;
// 	for (i = 0; i < x.length; i++) {
// 		x[i].style.display = "none";
// 	}
// 	x[slideIndex - 1].style.display = "block";
// }

// $.ajaxSetup({
// 	type : "POST",
// 	async : true,
// 	dataType : "JSON",
// 	error : function(xhr) {
// 		console.log("error html = " + xhr.statusText);
// 	}
// });

// function likeCnt() {
// 	$.ajax({
// 		url : 'ItemLike.do',
// 		data : {
// 			itemNo : "${item.itemNo}"
// 		},
// 		beforeSend : function() {
// 			console.log("likeCnt 전...");
// 		},
// 		complete : function() {
// 			console.log("likeCnt 완료...!");
// 		},
// 		success : function(data) {
// 			var data = JSON.parse(data);
// 			console.log("likeCnt()를 정상적으로 성공!!");
// 			console.log("data -> " + data.likeCnt);
// 			$("#likeChk").html(data.likeCnt);

// 		}
// 	});
// };
</script>
</head>
<body>
	<h2>제품 상세내역</h2>
	<header><%@ include file="../partials/header.jsp" %></header>
	<%-- <div class="w3-content"
		style="max-width: 400px; position: relative; left: 350px;">
		<c:forEach var="saveFile" items="${item.saveFileList }">
			<img class="mySlides w3-animate-opacity"
				style="width: 90%; margin: 0 auto"
				title="${saveFile.savedFileName }"
				src="/BMW/${saveFile.filePath }/${saveFile.savedFileName}">
				
			<a style="position: absolute; top: 45%; left: 0;" onclick="plusDivs(-1)">❮</a> 
			<a style="position: absolute; top: 45%; right: 0;" onclick="plusDivs(+1)">❯</a>
		</c:forEach>

	</div><br><br> --%>
	<table>
		<tr>
			<th class="title" width="200">제품 번호</th>
			<td>${item.itemNo}</td>
		</tr>
		<tr>
			<th class="title">카테고리</th>
			<td><c:forEach var="cate" items="${catelist}">
					<c:if test="${item.categoryNo == cate.categoryNo}">${cate.name}</c:if>
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
			<th class="title">재고</th>
			<td>${item.itemStock}</td>
		</tr>
		<tr>
			<th class="title">제품정보</th>
			<td><a href="${item.info}" target="_blank">제품정보 보러가기</a></td>
		</tr>
		<tr>
			<th class="title">가격</th>
			<td>${item.price}</td>
		</tr>
		<tr>
			<th class="title">성분정보</th>
			<td><c:forEach var="mapp" items="${mapplist}">
					${mapp.name} /
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
			<!-- 권한체크 넣기 -->
			<td colspan="2"><input type="button" value="Like"
				onclick="likeCnt()"></td>
		</tr>
		<tr>
			<th class="title">해시태그</th>
			<td>${item.htag}</td>
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
			<td colspan="2">
			<!-- 권한체크 넣기 -->
			<input type="button" value="수정"
				onclick="location.href='KISItemUpdateForm.do?itemNo=${item.itemNo}'">
			<input type="button" value="삭제" onClick="location.href='KISItemDelete.do?itemNo=${item.itemNo}'">
			<input type="button" value="목록가기" onclick="location.replace('KISItemList.do')">
			</td>
		</tr>
	</table>

	<hr>
	<section>
		<header class="major" style="margin-bottom: 0px;">
			<h2>리뷰 리스트</h2>
		</header>
	</section>
	<table>
<%-- 		<c:if test="${grade < 3}"> --%>
<%-- 			<a href="ItemReviewWriteForm.do?itemNo=${itemNo}&pageNum=${pageNum }&pageNumRv=${currentPage}"><button>리뷰 작성</button></a> --%>
<%-- 		</c:if> --%>
		<input type="button" value="리뷰 작성" onclick="location.replace('JJYItemReviewWriteForm.do?itemNo=${item.itemNo}&currentPage=${currentPage }&currentPageRv=${pgRv.currentPage}')">
		<tr>
			<th>리뷰 번호</th>
			<th>작성자</th>
			<th>내용</th>
			<th>조회수</th>			
			<th>평점</th>			
			<th>추천수</th>
			<th>작성일자</th>
		</tr>
		<c:set var="num" value="${pgRv.total-pgRv.start+1}"></c:set>
		<c:if test="${reviewTotal > 0 }">
			<c:forEach var="comm" items="${comms}">
				<tr>
					<td>${num}</td>
					<td>${comm.memberId}</td>
					<td width="50%">
						<a href="JJYItemReviewContent.do?itemNo=${comm.mainNo}&reviewNo=${comm.subNo }&currentPage=${currentPage }&currentPageRv=${pgRv.currentPage}">${comm.content}</a>
					</td>
					<td>${comm.hits}</td>
					<td>${comm.rating}</td>
					<td>${comm.likeCnt}</td>
					<td>${comm.regDate}</td>
				</tr>
				<c:set var="num" value="${num - 1}" />
			</c:forEach>
		</c:if>
		<c:if test="${reviewTotal == 0}">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>
	
	
	<div style="text-align: center;">
		<c:if test="${pgRv.startPage > pgRv.pageBlock}">
			<a href="KISItemContent.do?itemNo=${item.itemNo}&currentPage=${currentPage}&currentPageRv=${pgRv.startPage - pgRv.pageBlock}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pgRv.startPage}" end="${pgRv.endPage}">
			<a href="KISItemContent.do?itemNo=${item.itemNo}&currentPage=${currentPage}&currentPageRv=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${pgRv.endPage < pgRv.totalPage}">
			<a href="KISItemContent.do?itemNo=${item.itemNo}&currentPage=${currentPage}&currentPageRv=${pgRv.startPage + pgRv.pageBlock}">[다음]</a>
		</c:if>
	</div>
<footer><%@ include file="../partials/footer.jsp" %></footer>	
</body>
</html>