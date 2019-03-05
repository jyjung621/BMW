<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item List</title>
</head>
<body>
<h2>성분 리스트</h2>
<header><%@ include file="../partials/header.jsp" %></header>
	<table>
	<tr>
		<!--  권한체크 넣기 -->
		<td><a href="KISItemWriteForm.do"><button>제품등록</button></a></td>	
		<td colspan="7" align="center">
			<form name="searchFrm">
				<input type="search" id="keyWord" style="width:300px;height:30px;"> <input type="button"
					value="확인" onclick="searchCheck(form)">
			</form>
		</td>
	</tr>
		<tr>
			<th class="title" width="50">번호</th>
			<th class="title" width="100">카테고리</th>
			<th class="title">브랜드</th>
			<th class="title">제품명</th>
			<th class="title">평점</th>
			<th class="title">조회수</th>
			<th class="title">좋아요</th>
			<th class="title">등록일자</th>
		</tr>
		<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		<c:if test="${itemTotal > 0 }">
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${num}</td>
					<td>
						<c:forEach var="cate" items="${catelist}">
							<c:if test="${item.categoryNo == cate.categoryNo}">${cate.name}</c:if>
						</c:forEach>
					</td>
					<td>${item.brand}</td>
					<td><a
						href="KISItemContent.do?itemNo=${item.itemNo}">${item.name}</a>
					</td>
					<td>${item.rating}</td>
					<td>${item.hits}</td>
					<td>${item.likeCnt}</td>
					<td>${item.regDate}</td>
				</tr>
				<c:set var="num" value="${num - 1}" />
			</c:forEach>
		</c:if>
		<c:if test="${itemTotal == 0}">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>
	<div style="text-align: center;">
		<!-- 	키워드가 있을 때 보여주는 리스트페이징 -->
		<%-- <c:choose>
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
		</c:choose> --%>
		<c:if test="${pg.startPage > pg.pageBlock}">
		<a href="KISItemList.do?currentPage=${pg.startPage - pg.pageBlock}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
			<a href="KISItemList.do?currentPage=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${pg.endPage < pg.totalPage}">
			<a href="KISItemList.do?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
		</c:if>		
	</div>
<footer><%@ include file="../partials/footer.jsp" %></footer>	
</body>
</html>