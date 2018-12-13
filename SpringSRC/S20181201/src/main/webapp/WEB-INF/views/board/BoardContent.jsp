<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../partials/head.jsp" %>

<title>Insert title here</title>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

/* $(function() {
	$("boardComment").load('SDBCommentContent.do?boardNo=${board.boardNo }&kinds=1');
}); */

$(function() {
	$("boardComment").load('JJYCommentContent.do?mainNo=${SDBBoard.boardNo }&subNo=${SDBBoard.boardNo }&kinds=1');
});


</script>

<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 40%;
}

button:hover {
    opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: 40%;
    padding: 14px 20px;
    background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.modalContainer {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 30%;
    }
}
</style>


</head>
<body>
<header><%@ include file="../partials/header.jsp" %></header>
<div class="container">
<table>
	<tr>
		<th>
			${SDBBoard.title }
		</th>
	</tr>
	<table width="100%">
		<tr>
			<td>
				${SDBBoard.memberId }
			</td>
			<td width="10%" align="right">
				조회수
			</td>
			<td width="10%" align="right">
				${SDBBoard.hits }
			</td>
			<td width="10%" align="right">
				등록일
			</td>
			<td width="15%" align="right">
				${SDBBoard.regDate }
			</td>
		</tr>
	</table>
	<tr>
		<td colspan="1">
			${SDBBoard.content }
		</td>
	</tr>
	
	<tr>
		<td colspan="1" align="center">
			<input type="button" value="목록" onclick="location.href='BoardList.do'">
			<c:if test="${sessionId == SDBBoard.memberId || ssMap.get('grade') == '0'}">
				<input type="button" value="수정" onclick="location.href='BoardUpdateForm.do?boardNo=${SDBBoard.boardNo}'">
				<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">삭제</button>
			</c:if>
					
			
			<div id="id01" class="modal">
  				<form class="modal-content animate" action="BoardDelete.do?boardNo=${SDBBoard.boardNo }" method="post">
  					<div class="modalContainer" align="center">
     					<label><b>삭제하시겠습니까?</b></label><br>
     						<button type="submit">예</button>
     						<button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">아니오</button>
     
    				</div>
				</form>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="5">
			<boardComment></boardComment>
		</td>
	</tr>
</table>
</div>


<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>