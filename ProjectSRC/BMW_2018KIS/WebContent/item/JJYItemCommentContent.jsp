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


<script type="text/javascript">

	// 비동기 통신 Ajax를 setting
	$.ajaxSetup({
		type : "POST",
		async : true,
		dataType : "json",
		error : function(xhr) {
			console.log("error html = " + xhr.statusText);
		}
	});

	$(function() {
		$('#commentWrite').click(function() {
			$.ajax({
				url : 'ItemCommentWrite.do',
				// data: {}에서는 EL을 ""로 감싸줘야 함, 나머지는 그냥 사용
				data : {
					commentContent : $('#commentContent').val(),
					reviewNo : "${comm.mainNo}",
					mainNo : "${comm.subNo}",
					ref_Table : "${ref_Table}",
					memberId : "${userId}",
					isPublic : $('input[name=isPublic]').val()
				},
				beforeSend : function() {
					console.log("시작 전...");
				},
				complete : function() {
					console.log("완료...!");
				},
				success : function(data) {
					// 기존에 없어도 진행됬으나... 갑자기 안되는 관계로
					// data를 JSON.parse()를 통하여 JSON형태로 변환시켜줌....
					var data = JSON.parse(data);
						console.log("Write data --> " + data.result);
					if (data.result == 1) {
						console.log("comment가 정상적으로 입력!!");
						$('#commentContent').val("");
						showHtml(data.comments, 1); // 마지막 인자 : commPageNum
					}
				}
			});
		});
	});

	function showHtml(data, commPageNum) {
		commPageNum = parseInt(commPageNum);
		console.log('showhtml');
		console.log("cnt -> " + `${comm.commentCount}`);
		var cnt = ${comm.commentCount};
		let html = "<table class='table table-striped table-bordered' style='margin-top: 10px;'><tbody>";
		$.each(data, function(index, comms) {
					console.log('showhtml...' + (index+1));
							html += "<tr align='center' id='commt" + (index + 1) + "'>";
							html += "<td>" + (cnt - index) + "</td>";
							html += "<td>" + comms.memberId + "</td>";
							html += "<td align='left'>" + comms.content + "</td>";
							let presentDay = comms.regDate;
							html += "<td>" + presentDay + "</td>";
 							html += "<td>";
// 							html += "<c:if test='${sessionId} == '" + comms.memberId + "'}'>";
							html += "<input type='button' value='수정' onclick='updateForm(`commt"
 								 	+ (index + 1) + "`,"
									+ comms.mainNo + ","
									+ comms.subNo + ","
									+ commPageNum + ")'>";
// 							html += "</c:if>";
// 							html += "<c:if test='${grade == 0 || sessionId == " + comms.memberId + "}'>";
 							html += "<input type='button' value='삭제' onclick='deleteComment("
									+ comms.mainNo + ","
									+ comms.subNo + ","
									+ commPageNum + ")'>";
// 							html += "</c:if>";
							html += "</td>";
							html += "</tr>";
		});
		html += "</tbody></table>";
		// commentCount는 동기화되어 값을 받아오기 때문에 댓글 insert에 즉각적으로 처리x
		console.log("cnt... -> " + `${comm.commentCount}`);
		if (`${comm.commentCount}` > commPageNum * 10) {
			var nextPageNum = commPageNum + 1;
			if (commPageNum != 0) {
				html += "<input type='button' class='btn btn-default' onclick='getComment("
						+ nextPageNum + ", event)' value='다음 comment 보기'>";
			}
		}

		$('#showComment').html(html);
		$("#commentContent").val("");
		$("#commentContent").focus();
	};

	function getComment(commPageNum, event) {
		$.ajax({
			url : 'ItemCommentRead.do',
			data : {
				commPageNum : commPageNum * 10,
				mainNo : "${comm.subNo}",
				reviewNo : "${comm.mainNo}",
				ref_Table : "${ref_Table}"
			},
			beforeSend : function() {
				console.log("읽어오기 전...");
			},
			complete : function() {
				console.log("읽어오기 완료...!");
			},
			success : function(data) {
				var data = JSON.parse(data);
				console.log("comment를 정상적으로 조회!!");
				console.log("commPageNum --> " + commPageNum);
				showHtml(data, commPageNum);

				if (commPageNum != 0) {
					let position = $("#showComment table tr:last").position();
					$('html, body').animate({scrollTop : position.top}, 400); // 두번째 param은 스크롤 이동하는 시간	
				}
			}
		});
	};

	function toggleName() {
		if ($('#commentRead').val() == '댓글 보기') {
			getComment(1, event);
			$('#commentRead').val('댓글 숨기기');
		} else if ($('#commentRead').val() == '댓글 숨기기') {
			getComment(0, event);
			$('#commentRead').val('댓글 보기');
		}
	};

	function updateForm(id, mainNo, subNo, commPageNum) {
		$.ajax({
			url : 'ItemCommentUpdateForm.do',
			data : {
				mainNo : mainNo,
				subNo : subNo,
				ref_Table : "${ref_Table}",
				reviewNo : "${comm.mainNo}",
				commPageNum : commPageNum,
				trId : id
			},
			beforeSend : function() {
				console.log("수정 전 데이터 로딩 중...");
			},
			complete : function() {
				console.log("수정 전 데이터 로딩 완료...!");
			},
			success : function(data) {
				var data = JSON.parse(data);
				console.log("comment를 정상적으로 로딩!!");
				console.log("updateForm data -> " + data);

				let html = "<td colspan='4'><textarea class='form-control' rows='1' id='updateContent' placeholder='" + data[0].content + "' style='width: 100%;'></textarea></td>";
				html += "<td><input type='button' value='수정' onclick='updateCommentPro(" + data[0].mainNo + "," + data[0].subNo + "," + data[2] + ")'></td>";
				var data1 = '#'+data[1];	// trId
				$(data1).html(html);
			}
		});

	};

	function updateCommentPro(mainNo, subNo, commPageNum) {
		$.ajax({
			url : 'ItemCommentUpdatePro.do',
			data : {
				mainNo : mainNo,
				subNo : subNo,
				reviewNo : "${comm.mainNo}",
				commPageNum : commPageNum,
				content : $('#updateContent').val()
			},
			beforeSend : function() {
				console.log("수정 전...");
			},
			complete : function() {
				console.log("수정 완료...!");
			},
			success : function(data) {
				var data = JSON.parse(data);
				console.log("comment를 정상적으로 수정!!");
				getComment(data, event);
			}
		});
	};

	function deleteComment(mainNo, subNo, commPageNum) {
		$.ajax({
			url : 'ItemCommentDelete.do',
			data : {
				mainNo : mainNo,
				subNo : subNo,
				reviewNo : "${comm.mainNo}",
				commPageNum : commPageNum
			},
			beforeSend : function() {
				console.log("삭제 전...");
			},
			complete : function() {
				console.log("삭제 완료...!");
			},
			success : function(data) {
				var data = JSON.parse(data);
				console.log("comment를 정상적으로 삭제!!");
				getComment(data, event);
			}
		});
	};
</script>
</head>

<body>
	<div class="input-group" role="group" aria-label="..."
		style="margin-top: 10px; width: 100%;">
		<textarea class="form-control" rows="3" id="commentContent"
			placeholder="댓글을 입력하세요." style="width: 100%;"></textarea>
		<div class="btn-group btn-group-sm" role="group" aria-label="...">
			<c:if test="${userId == null}">
				<input type="button" class="btn btn-default" value="댓글 쓰기"
					disabled="disabled">
			</c:if>
			<c:if test="${userId != null}">
				<input type="button" class="btn btn-default" value="댓글 쓰기"
					id="commentWrite">
			</c:if>
			<input type="button" class="btn btn-default" value="댓글 보기"
				onclick="toggleName()" id="commentRead">
		</div>
		<input type="radio" name="isPublic" value="1" checked="checked">공개
		<input type="radio" name="isPublic" value="0">비공개
	</div>


	<!-- Comment 태그 추가 -->
	<div role="group" aria-label="..."
		style="margin-top: 10px; width: 100%;">
		<div id="showComment" style="text-align: center;"></div>
	</div>
	
</body>


</html>