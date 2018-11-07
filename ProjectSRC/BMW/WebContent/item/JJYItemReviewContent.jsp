<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Review View</title>

<style type="text/css">
table {
	width: 100%;
	margin: auto;
	text-align: center;
}

th {
	background-color: #ddd;
	text-align: center;
}

th.title {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

td {
	text-align: left;
	background-color: #eee;
}

caption {
	text-align: center;
	font-size: x-large;
}
</style>

<script type="text/javascript">
	$(function() {
		$("reviewComment")
				.load(
						'ItemCommentContent.do?itemNo=${comm.mainNo}&reviewNo=${comm.subNo }');
	});

	function reviewUpdate() {
		location
				.replace('ItemReviewUpdateForm.do?itemNo=${comm.mainNo}&reviewNo=${comm.subNo }&pageNum=${pageNum }&pageNumRv=${pageNumRv}');
	}

	function del_chk() {
		if (confirm("리뷰를 삭제 하시겠습니까?") == true) {
			location
					.replace("ItemReviewDeletePro.do?itemNo=${comm.mainNo}&reviewNo=${comm.subNo}&pageNum=${pageNum}&pageNumRv=${pageNumRv}");
		} else {
			return;
		}
	}

	function listView() {
		location
				.replace('ItemContent.do?itemNo=${comm.mainNo}&pageNum=${pageNum}&pageNumRv=${pageNumRv}');
	}

	$.ajaxSetup({
		type : "POST",
		async : true,
		dataType : "JSON",
		error : function(xhr) {
			console.log("error html = " + xhr.statusText);
		}
	});

	function likeCnt() {
		$.ajax({
			url : 'ItemReviewLike.do',
			data : {
				mainNo : "${comm.mainNo}",
				reviewNo : "${comm.subNo}"
			},
			beforeSend : function() {
				console.log("likeCnt 전...");
			},
			complete : function() {
				console.log("likeCnt 완료...!");
			},
			success : function(data) {
				var data = JSON.parse(data);
				console.log("likeCnt()를 정상적으로 성공!!");
				console.log("data -> " + data.likeCnt);
				$("#likeChk").html(data.likeCnt);

			}
		});
	};
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
								<h2>리뷰 상세내용</h2>
							</header>
						</section>
						<table border="1">
							<tr>
								<th class="title" width="200">제품 정보</th>
								<td>${comm.mainNo }</td>
							</tr>
							<tr>
								<th class="title">작성자</th>
								<td>${comm.memberId }</td>
							</tr>
							<tr>
								<th class="title">작성일자</th>
								<td>${comm.regDate }</td>
							</tr>
							<tr>
								<th class="title">평점</th>
								<td>${comm.rating }</td>
							</tr>
							<tr>
								<th class="title">추천수</th>
								<td id="likeChk">${comm.likeCnt }</td>
							</tr>
							<tr>
								<th class="title">조회수</th>
								<td>${comm.hits }</td>
							</tr>
							<tr>
								<th class="title">좋았던 점</th>
								<td>${comm.content }</td>
							</tr>
							<tr>
								<th class="title">아쉬웠던 점</th>
								<td>${comm.content2 }</td>
							</tr>
							<tr>
								<th class="title">꿀 Tip</th>
								<td>${comm.content3 }</td>
							</tr>
							<tr>
								<th class="title">사진</th>
								<td>
									<table border="0">
										<c:forEach var="saveFile" items="${comm.saveFileList }">
											<td><img title="${saveFile.savedFileName }" style="width: 500px; height: 450px;"
												src="/BMW/${saveFile.filePath }/${saveFile.savedFileName}">
											</td>
										</c:forEach>
									</table>
								</td>
							</tr>
							<c:if test="${grade == 0 || grade == 1}">
								<tr>
									<td colspan="2"><input type="button" value="Like"
										onclick="likeCnt()"></td>
								</tr>
							</c:if>
							<tr>
								<td colspan="2" align="right" style="background-color: #f7f7f7;">
									<c:if test="${sessionId == comm.memberId}">
										<input type="button" value="수정" onclick="reviewUpdate()">
									</c:if> <c:if test="${grade == 0 || sessionId == comm.memberId}">
										<input type="button" value="삭제" onClick="del_chk()">
									</c:if> 
									<input type="button" value="목록" onclick="listView()">
									<div style="float: right;">
									<c:if test="${grade < 3 }">
									<form action="/BMW/board/SDBReviewClip.do" method="POST">
										<input type="hidden" name="mainNo" value="${comm.mainNo }">
										<input type="hidden" name="subNo" value="${subNo }">
										<input type="hidden" name="title" value="${comm.content}">
										<input type="submit" value="스크랩하기">
									</form>
									</c:if>
									</div>
								</td>
							</tr>
						</table>
						<hr>

						<reviewComment></reviewComment>
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