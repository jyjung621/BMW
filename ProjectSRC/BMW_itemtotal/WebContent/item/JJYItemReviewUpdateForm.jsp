<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Update View</title>
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
	function updateCancle() {
		history.go(-1);		
/* 		location.replace('ItemList.do?pageNum=${pageNum}');		 */
	}
</script>
</head>
<body>
	<form action="ItemReviewUpdatePro.do" method="post">
		<input type="hidden" name="mainNo" value="${comm.mainNo}"> 
		<input type="hidden" name="subNo" value="${comm.subNo}"> 
		<input type="hidden" name="ref_Table" value="${comm.ref_Table}"> 
		<input type="hidden" name="pageNum" value="${pageNum}"> 
		<input type="hidden" name="pageNumRv" value="${pageNumRv}"> 
		<!-- memverId 받아와야함 -->
		<input type="hidden" name="memberId" value="jjy">
		
		<table border="1">
			<caption>리뷰 수정</caption>
			<tr>
				<td>제품정보</td>
				<td>${comm.mainNo }</td>
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
					<textarea rows="5" cols="60" name="content">${comm.content }</textarea> 
				</td>
			</tr>
			<tr>
				<td>아쉬웠던 점</td>
				<td>
					<textarea rows="5" cols="60" name="content2">${comm.content2 }</textarea> 
				</td>
			</tr>
			<tr>
				<td>꿀 Tip</td>
				<td>
					<textarea rows="5" cols="60" name="content3">${comm.content3 }</textarea> 
				</td>
			</tr>
			<tr>
				<td>사진</td>
				<td>
					<img src="./images/cosmetic01.jpg">
					<img src="./images/cosmetic02.jpg">
				</td>
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
					<input type="submit" value="수정완료">
					<input type="button" value="취소" onclick="updateCancle()">
				</td>
			</tr>	
		</table>
	</form>
</body>
</html>