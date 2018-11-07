<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Write Page</title>
<style type="text/css">
	table {
		width: 60%;
		margin: auto;
		text-align: center;
	}
	
	td {
		text-align: center;
	}
	
	img {
		width: 100px;
		height: auto;
	}
	
	caption {
		text-align: center;
		font-size: x-large;
	}
</style>
<script type="text/javascript">
	function writeCancle() {
		history.go(-1);		
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
								<h2>리뷰 등록</h2>
							</header>
						</section>
<form action="ItemReviewWritePro.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mainNo" value="${mainNo}">  
		<input type="hidden" name="pageNum" value="${pageNum}"> 
		<input type="hidden" name="pageNumRv" value="${pageNumRv}"> 
		<!-- memverId 받아와야함 -->
		<input type="hidden" name="memberId" value="${memberId }">
		
		<table border="1">
			<tr>
				<td>제품정보</td>
				<td>${mainNo }</td>
			</tr>
			<tr>
				<td>평점</td>
				<td colspan="3">
					<select name="rating">
						<option value="1">1점</option>
						<option value="2">2점</option>
						<option value="3" selected>3점</option>
						<option value="4">4점</option>
						<option value="5">5점</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>좋았던 점</td>
				<td>
					<textarea rows="5" cols="60" name="content"></textarea> 
				</td>
			</tr>
			<tr>
				<td>아쉬웠던 점</td>
				<td>
					<textarea rows="5" cols="60" name="content2"></textarea> 
				</td>
			</tr>
			<tr>
				<td>꿀 Tip</td>
				<td>
					<textarea rows="5" cols="60" name="content3"></textarea> 
				</td>
			</tr>
			<tr>
				<td>사진1</td>
				<td><input type="file" name="saveFiles1"></td>
			</tr>
			<tr>
				<td>사진2</td>
				<td><input type="file" name="saveFiles2"></td>
			</tr>
			<tr>
				<td>사진3</td>
				<td><input type="file" name="saveFiles3"></td>
			</tr>
			<tr>
				<td>공개여부</td>
				<td>
					<input type="radio" name="isPublic" value="1" checked="checked" required="required">공개
					<input type="radio" name="isPublic" value="0" required="required">비공개
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성완료">
					<input type="button" value="취소" onclick="writeCancle()">
				</td>
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