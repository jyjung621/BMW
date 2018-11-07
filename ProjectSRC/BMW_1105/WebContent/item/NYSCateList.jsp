<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category List View</title>
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
								<h2>카테고리 List</h2>
							</header>
						</section>
	<table border="1" align="center">
		<a href="CategoryWriteForm.do?pageNumCt=${pageNumCt }"><button>카테고리 등록</button></a>
		<tr>
			<th class="title">No</th>
			<th class="title">카테고리 번호</th>
			<th class="title">카테고리 이름</th>
			<th class="title">상위 카테고리</th>
			<th class="title">공개여부</th>
			<th class="title">수정/삭제</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="cate" items="${list}">
				<tr>
					<td>${startNum}</td>
					<td>${cate.categoryNo}</td>
					<td>${cate.name}</td>
					<td>${cate.parent }</td>
					<td>${cate.isPublic }</td>
					<td>
						<input type="button" value="수정" onclick="location.replace('CategoryUpdateForm.do?categoryNo=${cate.categoryNo }&pageNumCt=${pageNumCt }')">
						<input type="button" value="삭제" onclick="location.replace('CategoryDeletePro.do?categoryNo=${cate.categoryNo }&pageNumCt=${pageNumCt }')">						
					</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }"></c:set>
			</c:forEach>
		</c:if>
		<c:if test="${totcnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없음</td>
			</tr>
		</c:if>
	</table>

	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href="CategoryList.do?pageNumCt=${startPage-blockSize }">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a href="CategoryList.do?pageNumCt=${i }">[${i }]</a>
		</c:forEach>
		<c:if test="${endPage > pagecnt }">
			<a href="CategoryList.do?pageNumCt=${startPage+blockSize }">[다음]</a>
		</c:if>
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