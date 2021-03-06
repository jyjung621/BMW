<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
    <%@ include file="../SessionCheck.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>Item List</title>
<style type="text/css">
table { width: 100%;}
tr{background-color: #eee; }
</style>
</head>
<body>
<h2>제품 리스트</h2>
	<table>
		<c:if test="${grade == '0'}">
		<tr>
			<td>
				<a href="ItemWriteForm.do">제품 등록</a>
			</td>
		</tr>
		</c:if>
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>브랜드</th>
			<th>제품명</th>
			<th>제품정보</th>
			<th>가격</th>
			<th>평점</th>
			<th>조회수</th>
			<th>좋아요</th>
			<th>공개여부</th>
			<th>작성자</th>
			<th>등록일자</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${startNum}</td>
					<td>
						<c:forEach var="cate2" items="${cateAll}">
							<c:if test="${item.categoryNo == cate2.categoryNo}">${cate2.name}</c:if>
						</c:forEach>
					</td>
					<td>${item.brand}</td>
					<td class="left" width="200">
						<a href="ItemContent.do?itemNo=${item.itemNo}&pageNum=${currentPage}">${item.name}</a>
					</td>
					<td>${item.info}</td>
					<td>${item.price}</td>
					<td>${item.rating}</td>
					<td>${item.hits}</td>
					<td>${item.likeCnt}</td>
					<td>${item.isPublic}</td>
					<td>${item.memberId}</td>
					<td>${item.regDate}</td>
				</tr>
				<c:set var="startNum" value="${startNum + 1}" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0}">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>
	<div style="text-align: center;">
		<c:if test="${startPage > blockSize}">
			<a href="#" onclick="changPage(${categoryNo},${startPage-blockSize}); return false;">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="#" onclick="changPage(${categoryNo},${i}); return false;">[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt}">
			<a href="#" onclick="changPage(${categoryNo},${startPage+blockSize}); return false;">[다음]</a>
		</c:if>
	</div>

</body>
</html>