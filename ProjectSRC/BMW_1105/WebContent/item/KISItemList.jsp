<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ include file="../sessionCheck.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="maincss/assets/css/main.css" />
<title>Item List</title>
<style type="text/css">
	table {
		width : 100%;
		margin : auto;
		text-align : center;
	}
	th {
		background-color: #ddd;
		text-align: center;
	}
	th.title {
		text-align:center;
		display: table-cell;
		vertical-align: middle;
	}
	td {
		text-align: center;
		background-color: #eee;
	}
	caption {
		text-align: center;
		font-size: x-large;
	}
</style>
</head>
<body>

	<table>
	<tr>
		<c:choose>
			<c:when test="${grade == 0}">
				<td><a href="ItemWriteForm.do"><button>제품등록</button></a></td>	
			<td colspan="7" align="center">
				<form name="searchFrm">
					<input type="text" id="keyWord" style="width:300px;height:30px;"> <input type="button"
						value="확인" onclick="searchCheck(form)">
				</form>
			</td>
			</c:when>		
			<c:otherwise>
				<td colspan="8" align="center">
					<form name="searchFrm">
						<input type="text" id="keyWord" style="width:300px;height:30px;"> <input type="button"
							value="확인" onclick="searchCheck(form)">
					</form>
				</td>
			</c:otherwise>
		</c:choose>
	</tr>
		<tr>
			<th class="title" widht="150">번호</th>
			<th class="title">카테고리</th>
			<th class="title">브랜드</th>
			<th class="title">제품명</th>
			<th class="title">평점</th>
			<th class="title">조회수</th>
			<th class="title">좋아요</th>
			<th class="title">등록일자</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${startNum}</td>
					<td><c:forEach var="cate2" items="${cateAll}">
							<c:if test="${item.categoryNo == cate2.categoryNo}">${cate2.name}</c:if>
						</c:forEach></td>
					<td>${item.brand}</td>
					<td><a
						href="ItemContent.do?itemNo=${item.itemNo}&cateNum=${categoryNo }&pageNum=${currentPage}">${item.name}</a>
						<%-- 						<a href="ItemContent.do?itemNo=${item.itemNo}&pageNum=${currentPage}">${item.name}</a> --%>
					</td>
					<td>${item.rating}</td>
					<td>${item.hits}</td>
					<td>${item.likeCnt}</td>
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
		<!-- 	키워드가 있을 때 보여주는 리스트페이징 -->
		<c:choose>
			<c:when test="${keyword != null}">
				<c:if test="${startPage > blockSize}">
					<a href="#"
						onclick="changPage(${categoryNo},${startPage-blockSize},${keyword}); return false;">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="#"
						onclick="changPage(${categoryNo},${i},'${keyword}'); return false;">[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<a href="#"
						onclick="changPage(${categoryNo},${startPage+blockSize},${keyword}); return false;">[다음]</a>
				</c:if>
			</c:when>
			<c:otherwise>
				<c:if test="${startPage > blockSize}">
					<a href="#"
						onclick="changPage(${categoryNo},${startPage-blockSize}); return false;">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="#" onclick="changPage(${categoryNo},${i}); return false;">[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<a href="#"
						onclick="changPage(${categoryNo},${startPage+blockSize}); return false;">[다음]</a>
				</c:if>
			</c:otherwise>
		</c:choose>
	</div>
	
</body>
</html>