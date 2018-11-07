<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review List</title>
<style type="text/css">
	table { 
		width: 100%;
	}
	tr {
		background-color: #eee; 
	}
	td {
		text-align: center;
	}
</style>
</head>
<body>
	<h2>리뷰 리스트</h2>
	<table>
		<tr>
			<td><a href="ItemReviewWriteForm.do?itemNo=${itemNo}&pageNum=${pageNum }&pageNumRv=${currentPage}">리뷰 작성</a></td>
		</tr>
		<tr>
			<th>리뷰 번호</th>
			<th>작성자</th>
			<th>내용1</th>
			<th>조회수</th>			
			<th>평점</th>			
			<th>추천수</th>
			<th>공개여부</th>
			<th>작성일자</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="comm" items="${list}">
				<tr>
					<td>${startNum}</td>
					<td>${comm.memberId}</td>
					<td width="50%">
						<a href="ItemReviewContent.do?itemNo=${comm.mainNo}&reviewNo=${comm.subNo }&pageNum=${pageNum }&pageNumRv=${currentPage}">${comm.content}</a>
					</td>
					<td>${comm.hits}</td>
					<td>${comm.rating}</td>
					<td>${comm.likeCnt}</td>
					<td>${comm.isPublic}</td>
					<td>${comm.regDate}</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1}" />
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
			<a href="ItemContent.do?itemNo=${list[0].mainNo}&pageNum=${pageNum}pageNumRv=${startPage-blockSize}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="ItemContent.do?itemNo=${list[0].mainNo}&pageNum=${pageNum}&pageNumRv=${i}">[${i}]</a>
<%-- 			<a href="ItemReviewList.do?pageNumRv=${i}">[${i}]</a> --%>
		</c:forEach>
		<c:if test="${endPage < pageCnt}">
			<a href="ItemContent.do?itemNo=${list[0].mainNo}&pageNum=${pageNum}pageNumRv=${startPage+blockSize}">[다음]</a>
		</c:if>
	</div>
</body>
</html>