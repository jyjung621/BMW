<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>Category Item List</title>
<style type="text/css">
	table { width: 100%;}
	tr{background-color: #eee; }
</style>
</head>
<body>
	<h2>제품 리스트</h2>
	<table>
		<tr>
			<td><a href="ItemWriteForm.do">제품 등록</a></td>
		</tr>
		<tr>
			<th>제품번호</th>
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

			<c:forEach var="cateItem" items="${itemList}">
				<tr>
					<td>${startNo}</td>
					<td>${cateItem.categoryNo}</td>
					<td>${cateItem.brand}</td>
					<td class="left" width="200">
						<a href="ItemContent.do?itemNo=${cateItem.itemNo}&pageNumIC=${pageNumIC}">${cateItem.name}</a>
					</td>
					<td>${cateItem.info}</td>
					<td>${cateItem.price}</td>
					<td>${cateItem.rating}</td>
					<td>${cateItem.hits}</td>
					<td>${cateItem.likeCnt}</td>
					<td>${cateItem.isPublic}</td>
					<td>${cateItem.memberId}</td>
					<td>${cateItem.regDate}</td>
				</tr>
				<c:set var="startNo" value="${startNo + 1}" />
			</c:forEach>

	</table>
	

</body>
</html>