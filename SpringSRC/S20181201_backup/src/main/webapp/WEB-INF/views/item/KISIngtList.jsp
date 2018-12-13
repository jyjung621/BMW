<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ingredient List View</title>
<script>
	function searchCheck(frm) {
		if (frm.keyWord.value == "") {
			alert("검색 단어를 입력하세요.");
			frm.keyWord.focus();
			return;
		}
		frm.submit();
	}
</script>
</head>
<body>
	<h2>성분 리스트</h2>
<header><%@ include file="../partials/header.jsp" %></header>
	<table>
	<tr>
		<td style="align: left;"><a href="KISIngtWriteForm.do"><button>성분 등록</button></a></td>
		<td colspan="6" style="align: right;">
			<form name="search" method="post">
				<input type="text" name="keyWord" style="width:300px;height:30px;"> <input type="button"
					value="검색" onclick="searchCheck(form)">
			</form>
		</td>
	</tr>
		<tr>
			<th class="title" width="150">번호</th>
			<th class="title">성분명</th>
			<th class="title">위험도 등급</th>
			<th class="title">20가지 주의성분</th>
			<th class="title">알레르기 주의성분</th>
			<th class="title">피부타입별 특이성분</th>
			<th class="title">기능성 성분 여부</th>
		</tr>
		<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		<c:if test="${total > 0 }">
			<c:forEach var="ingt" items="${list}">
				<tr>
					<td>${num}</td>
					<td><a
						href="KISIngtContent.do?ingredientNo=${ingt.ingredientNo}">${ingt.name}</a>
					</td>
					<td>${ingt.grade}</td>
					<td>${ingt.danger20}</td>
					<td>${ingt.dangerAllergy}</td>
					<td>${ingt.specialyType}</td>
					<td>${ingt.functional}</td>
				</tr>
				<c:set var="num" value="${num - 1}" />
			</c:forEach>
		</c:if>
		<c:if test="${total == 0}">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>
	<div style="text-align: center;">
		<%-- <c:choose>
			<c:when test="${keyWord != null}">
				<c:if test="${startPage > blockSize}">
					<a
						href="IngtList.do?pageNum=${startPage-blockSize}&keyWord=${keyWord}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${start}" end="${end}">
					<a href="IngtList.do?pageNum=${i}&keyWord=${keyWord}">[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<a
						href="IngtList.do?pageNum=${startPage+blockSize}&keyWord=${keyWord}">[다음]</a>
				</c:if>
			</c:when>
			<c:otherwise>
				<c:if test="${startPage > blockSize}">
					<a href="IngtList.do?pageNum=${startPage-blockSize}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${start}" end="${end}">
					<a href="IngtList.do?pageNum=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<a href="IngtList.do?pageNum=${startPage+blockSize}">[다음]</a>
				</c:if>
			</c:otherwise>
		</c:choose> --%>
		<c:if test="${pg.startPage > pg.pageBlock}">
		<a href="KISIngtList.do?currentPage=${pg.startPage - pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
		<a href="KISIngtList.do?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage}">
		<a href="KISIngtList.do?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	</c:if>
	</div>
<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>