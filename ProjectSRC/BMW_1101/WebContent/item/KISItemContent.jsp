<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../SessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<title>Item View</title>
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
		$("itemReview").load("ItemReviewList.do?itemNo=${item.itemNo}&pageNum=${pageNum}&pageNumRv=${pageNumRv}");
	});
	
	function del_chk() {
		if (confirm("제품을 삭제 하시겠습니까?") == true) {
			location.href="ItemDeletePro.do?itemNo=${item.itemNo}&pageNum=${pageNum}&cateNum=${item.categoryNo}";
		} else {
			return;
		}
	}
</script>
</head>
<body>
	<table border="1">
		<caption>
			<h2>제품 상세내역</h2>
		</caption>
		<tr>
			<td>사진</td>
			<td>
				<table border="1">
					<c:forEach var="saveFile" items="${item.saveFileList }">
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
			<td>좋아요</td>
			<td>${item.likeCnt}</td>
		</tr>
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
			<c:if test="${grade == '0'}">
				<input type="button" value="수정" onclick="location.href='ItemUpdateForm.do?itemNo=${item.itemNo}&pageNum=${pageNum}'">
				<input type="button" value="삭제" onClick="del_chk()">
			</c:if>
				<input type="button" value="목록가기" onclick="location.replace('ItemCategoryHeader.do?cateNum=${cateNum }&pageNumIC=${pageNum}')">
<%-- 				<input type="button" value="목록가기" onclick="location.replace('ItemCategoryHeader.do?cateNum=${item.categoryNo }&pageNumIC=${pageNum}')"> --%>
			</td>
		</tr>
	</table>
	
	<hr>
	<itemReview></itemReview>

</body>
</html>