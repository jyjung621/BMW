<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ingredient List View</title>

<link rel="stylesheet" href="maincss/assets/css/main.css" />
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
								<h2>성분 리스트</h2>
							</header>
						</section>
	<table>
	<tr>
		<td style="align: left;"><a href="IngtWriteForm.do"><button>성분 등록</button></a></td>
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
		<c:if test="${totCnt > 0 }">
			<c:forEach var="ingt" items="${list}">
				<tr>
					<td>${startNum }</td>
					<td><a
						href="IngtContent.do?ingredientNo=${ingt.ingredientNo}&pageNum=${currentPage}">${ingt.name}</a>
					</td>
					<td>${ingt.grade}</td>
					<td>${ingt.danger20}</td>
					<td>${ingt.dangerAllergy}</td>
					<td>${ingt.specialyType}</td>
					<td>${ingt.functional}</td>
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
		<c:choose>
			<c:when test="${keyWord != null}">
				<c:if test="${startPage > blockSize}">
					<a
						href="IngtList.do?pageNum=${startPage-blockSize}&keyWord=${keyWord}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
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
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="IngtList.do?pageNum=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<a href="IngtList.do?pageNum=${startPage+blockSize}">[다음]</a>
				</c:if>
			</c:otherwise>
		</c:choose>
	</div>
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