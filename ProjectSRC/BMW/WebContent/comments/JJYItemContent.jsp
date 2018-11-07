<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세페이지</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
#content .section3 {
	overflow: hidden;
	width: 1000px;
	height: 200px;
	border: 1px solid lightgray;
}

#content .section3 .content {
	height: 200px;
	width: 800px;
	line-height: 200px;
	text-align: center;
	float: left;
	border: 1px solid lightgray;
	box-sizing: border-box;
}

#content .section3 .bnt {
	height: 200px;
	width: 100px;
	line-height: 200px;
	text-align: center;
	float: Right;
	border: 1px solid lightgray;
	box-sizing: border-box;
}
</style>

<script type="text/javascript">
	
		/* $(document).ready(function() {
			if(${userId == null}) {
				alert("로그인이 필요합니다.");
				location.href="itemList.do";
			}
		
		}); */
		
		// 비동기 통신 Ajax를 setting
		$.ajaxSetup({
			type:"POST",
			async:true,
			dataType:"json",
			error:function(xhr) {
				console.log("error html = " + xhr.statusText);
			}
		});
	
 		$(function() {	
	//		${"#conmmentWrite"}.on("click", function() {
			$('#commentWrite').click(function() {
				alert("write!");
				$.ajax({
					//url: 'itemCommentWrite.do',
					url: '../comments/itemCommentWrite.do',
					// data: {}에서는 EL을 ""로 감싸줘야 함, 나머지는 그냥 사용
					data:{
						commentContent:$('#commentContent').val(),
						//mainNo:"${itemNo}",
						//memberId:"${sessionScope.sessionId}",
						//isPublic:"${ispublic}"
					},
					beforeSend:function() {
						console.log("시작 전...");
					},
					complete:function() {
						console.log("완료...!");
					},					
					success:function(data) {
						if(data.result == 1) {
							console.log("comment가 정상적으로 입력!!");
							$('#commentContent').val("");
							showHtml(data.comments,3);	// 마지막 인자 : commPageNum
						}
					}
				});
			});
		}); 
	
		function showHtml(data, commPageNum) {
			let html = "<table class='table table-striped table-bordered' style='margin-top: 10px;'><tbody>";
			$.each(data, function(index, comms) {
				html += "<tr align='center'>";
				html += "<td>" + (index+1) + "</td>";
				html += "<td>" + comms.memberId + "</td>";
				html += "<td align='left'>" + comms.content + "</td>";
				let presentDay = comms.regDate;
				html += "<td>" + presentDay + "</td>";
				html += "</tr>";
			});
			html += "</tbody></table>";
			commPageNum = parseInt(commPageNum);
			// commentCount는 동기화되어 값을 받아오기 때문에 댓글 insert에 즉각적으로 처리x
			if("${item.commentCount}" > commPageNum*10) {
				var nextPageNum = commPageNum + 1;
				html += "<input type='button' class='btn btn-default' onclick='getComment(nextPageNum, event)' value='다음 comment 보기'>";
			}
			
			$('#showComment').html(html);
			$("#commentContent").val("");
			$("#commentContent").focus();
		};
		
		function getComment(commPageNum, event) {
			$.ajax({
				url:'../comments/itemCommentRead.do',
				data:{
					commPageNum:commPageNum*10,
					mainNo:"${itemNo}"
				},
				beforeSend:function() {
					console.log("읽어오기 전...");
				},
				complete:function() {
					console.log("읽어오기 완료...!");
				},
				success:function(data) {
					console.log("comment를 정상적으로 조회!!");
					showHtml(data, commPageNum);
					
					let position = $("#showComment table tr:last").position();
					$('html, body').animate({scrollTop : position.top}, 400);	// 두번째 param은 스크롤 이동하는 시간
				}
			})
		};
	</script>
</head>

<body>
	<div class="input-group" role="group" aria-label="..."
		style="margin-top: 10px; width: 100%;">
		<textarea class="form-control" rows="3" id="commentContent"
			placeholder="댓글을 입력하세요." style="width: 100%;"></textarea>
		<div class="btn-group btn-group-sm" role="group" aria-label="...">
			<c:if test="${sessionScope.sessionId == null}">
				<input type="button" class="btn btn-default" value="댓글 쓰기"
					disabled="disabled">
			</c:if>
			<c:if test="${sessionScope.sessionId != null}">
				<input type="button" class="btn btn-default" value="댓글 쓰기"
					id="commentWrite">
			</c:if>
				<input type="button" class="btn btn-default" value="댓글 보기" onclick="getComment(1, event)"
					id="commentRead">
				<input type="button" name="read" class="btn btn-default" value="댓글 숨기기" onclick="getComment(0, event)"
					id="commentRead">
		</div>
		
	</div>


	<!-- Comment 태그 추가 -->
	<div role="group" aria-label="..."
		style="margin-top: 10px; width: 100%;">
		<div id="showComment" style="text-align: center;"></div>
	</div>
</body>


</html>