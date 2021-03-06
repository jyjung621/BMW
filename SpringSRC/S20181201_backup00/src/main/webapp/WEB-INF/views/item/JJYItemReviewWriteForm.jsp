<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review Write Page</title>

<script type="text/javascript">
	
	$(function () {
		if(${msg != null}) {
			alert(${msg});
		}
	});
	
	function writeCancle() {
		location.replace("KISItemContent.do?itemNo=${item.itemNo}&currentPage=${currentPage}&currentPageRv=${currentPageRv}");
	}
	
</script>

</head>
<body>
	<header><%@ include file="../partials/header.jsp"%></header>

	<div id="page-wrapper">

		<!-- Main -->
<!-- 		<section id="main"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-12"> -->
					<!-- Blog -->

					<h2>리뷰 등록</h2>
					<span style="color: red;"><c:if test="${msg != null }">${msg }</c:if></span>
					<form action="JJYItemReviewWritePro.do" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="isPublic" value="1"> <input
							type="hidden" name="mainNo" value="${item.itemNo}"> <input
							type="hidden" name="currentPage" value="${currentPage}"> <input
							type="hidden" name="currentPageRv" value="${currentPageRv}">
						<!-- memverId 받아와야함 -->
						<input type="hidden" name="memberId" value="admin">

						<table border="1">
							<tr>
								<th class="title" width="200">제품정보</th>
								<td>${item.name }</td>
							</tr>
							<tr>
								<th class="title">평점</th>
								<td><select name="rating"
									style="width: 100px; height: 30px;">
										<option value="1">1점</option>
										<option value="2">2점</option>
										<option value="3" selected>3점</option>
										<option value="4">4점</option>
										<option value="5">5점</option>
								</select></td>
							</tr>
							<tr>
								<th class="title">좋았던 점</th>
								<td><textarea rows="5" cols="60" name="content"></textarea>
								</td>
							</tr>
							<tr>
								<th class="title">아쉬웠던 점</th>
								<td><textarea rows="5" cols="60" name="content2"></textarea>
								</td>
							</tr>
							<tr>
								<th class="title">꿀 Tip</th>
								<td><textarea rows="5" cols="60" name="content3"></textarea>
								</td>
							</tr>
							<tr>
								<th class="title">사진1</th>
								<td><input type="file" name="saveFiles"></td>
							</tr>
							<tr>
								<th class="title">사진2</th>
								<td><input type="file" name="saveFiles"></td>
							</tr>
							<tr>
								<th class="title">사진3</th>
								<td><input type="file" name="saveFiles"></td>
							</tr>
							<tr>
								<td colspan="2" align="right" style="background-color: #f7f7f7;">
								<input type="submit" value="작성완료"> 
								<input type="button" value="취소" onclick="writeCancle()"></td>
							</tr>
						</table>
					</form>


<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		</section> -->
	</div>


	<footer><%@ include file="../partials/footer.jsp"%></footer>
</body>
</html>