<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write Category</title>
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
								<h2>카테고리 등록하기</h2>
							</header>
						</section>
<form action="CategoryWritePro.do?pageNumCt=${pageNumCt}" method="post">
	<table>
		
		<tr>
			<td>상위 카테고리</td>
			<td>
				
				<select name="parent" required="required">
					<c:forEach var="cate" items="${cate }">
						<option value="${cate.name}">${cate.name}</option>
					</c:forEach>
				</select>
				<input type="button" value="추가" onclick="window.open('./NYSAddParentCate.jsp','', 'width=482, height=252')">
			</td>
		</tr>
		<tr>
			<td>카테고리명</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>공개여부</td>
			<td><input type="radio" name="isPublic" value="1" checked="checked">공개
				<input type="radio" name="isPublic" value="0">비공개</td>
		</tr>
		<tr>
			<td><input type="submit" value="확인">
				<input type="reset" value="취소" onclick="history.go(-1);"></td>	
		</tr>			
	</table>
</form>
<!-- 	</form> -->
		</section>

	</div>
	</div>
	</div>
	</section>
	</div>


	<!-- <footer0></footer0> -->
<%@ include file="../footer.jsp"%>
</body>
</html>