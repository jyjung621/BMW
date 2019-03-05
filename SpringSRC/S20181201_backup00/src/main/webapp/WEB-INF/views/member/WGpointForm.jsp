<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
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

.container {
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
<script type="text/javascript">

	//Get the modal
	var modal = document.getElementById('id01');
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}

	// 충전금액 직접입력
	function charge_change(){
		if(document.frm.charge1.options[document.frm.charge1.selectedIndex].value == '0'){
		 document.frm.charge.disabled = true;
		 document.frm.charge.value = "";
		}
		if(document.frm.charge1.options[document.frm.charge1.selectedIndex].value == '9'){
		 document.frm.charge.disabled = false;
		 document.frm.charge.value = "";
		 document.frm.charge.focus();
		} else{
		 document.frm.charge.disabled = true;
		 document.frm.charge.value = document.frm.charge1.options[document.frm.charge1.selectedIndex].value;
		}
	}

	// 직접입력 누르면 숨어잇다 나오는 인풋박스
	/* $(function(){
	      //직접입력 인풋박스 기존에는 숨어있다가
	$("#selboxDirect").hide();
	$("#selbox").change(function() {
	                //직접입력을 누를 때 나타남
			if($("#selbox").val() == "direct") {
				$("#selboxDirect").show();
			}  else {
				$("#selboxDirect").hide();
			}
		}) 

	}); */
</script>
</head>
<body>
<header><%@ include file="../partials/header.jsp" %></header>
	<h3>사용가능 포인트 : ${rpoint }</h3>
	
	<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">포인트 충전하기</button>
	<div id="id01" class="modal">
		<form class="modal-content animate" action="chargePoint.do" name="frm" method="post">
			<input type="hidden" name="id" value="${memberId }">
			<div class="container" align="center">
			<label><b>충전할 금액을 선택하고 확인을 눌러주세요</b></label><br>
			<input type="text" name="charge" value="" disabled>
			<select name="charge1" onchange="charge_change()" style="width: 200; height: 50">
				<option value="0">선택</option>
				<option value="9">직접입력</option>
				<option value="5000">5,000</option>
				<option value="10000">10,000</option>
				<option value="30000">30,000</option>
				<option value="50000">50,000</option>
				<option value="100000">100,000</option>
			</select><br>
			<button type="submit">확인</button>
			<button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">돌아가기</button>
			</div>
		</form>
	</div>
	
	<table>
	<tr>
		<th>충전/사용</th>
		<th>금액</th>
		<th>내역 일자</th>
		<th>잔여 포인트</th>
	</tr>
	<c:forEach var="WGPoint" items="${list }">
		<tr>
			<td><c:if test="${WGPoint.isIncome == 0}">
					충전
				</c:if>
				<c:if test="${WGPoint.isIncome == 1}">
					제품 구매
				</c:if></td>
			<td><c:if test="${WGPoint.isIncome == 0}">
				+${WGPoint.price }
				</c:if>
				<c:if test="${WGPoint.isIncome == 1}">
				-${WGPoint.price }
				</c:if></td>
			<td>${WGPoint.regDate }</td>
			<td>${WGPoint.point }</td>
		</tr>
		<c:set var="num" value="${num - 1 }"></c:set>
	</c:forEach>
</table>
<c:if test="${pg.startPage > pg.pageBlock }">
	<a href="pointForm.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
	<a href="pointForm.do?currentPage=${i}">[${i}]</a>
</c:forEach>
<c:if test="${pg.endPage < pg.totalPage }">
	<a href="pointForm.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
</c:if>
	
	
	
	


 
<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>