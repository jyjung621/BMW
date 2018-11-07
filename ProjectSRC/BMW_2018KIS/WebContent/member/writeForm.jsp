<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/BMW/maincss/assets/css/main.css" />
<!-- <link rel="stylesheet" href="../main/assets/css/main.css" /> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신규회원가입</title>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	function checkId() {
		var reg_id = /^[a-zA-Z0-9]{4,15}$/;
		var idv = frm.memberId.value;

		if (!idv) {
			document.getElementById('idmsg').style.color = "red";
			document.getElementById('idmsg').innerHTML = "아이디를 입력하세요.";
			frm.memberId.focus();
			return false;
		}
		if (!reg_id.test(idv)) {
			document.getElementById('idmsg').style.color = "red";
			document.getElementById('idmsg').innerHTML = "아이디는 4~15자리 영문, 숫자만 가능합니다";
			frm.memberId.focus();
			return false;
		}

		var param="memberId="+idv;
		// sendRequest(url      , params, callback, method)
		sendRequest("confirmId.jsp", param, result, "POST");
	}

	function result() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				var text = httpRequest.responseText;
				start = text.indexOf("<body>");
				end = text.indexOf("</body>");
				var resultText = text.substring(start + 6, end);
				if (resultText == 0) {
					document.getElementById('idmsg').style.color = "black";
					document.getElementById('idmsg').innerHTML = "<b>사용 가능</b>한 ID입니다.";
				} else {
					document.getElementById('idmsg').style.color = "blue";
					document.getElementById('idmsg').innerHTML = "존재하는 ID입니다.";
				}
			} else {
				alert("에러 발생: " + httpRequest.status);
			}
		}
	}

	function checkPwd() { // 비밀번호 확인 AJAX
		var reg_pwd = /^[a-zA-Z0-9]{6,20}$/;
		if (frm.passwd.value != frm.passwd2.value) {
			document.getElementById('pwdmsg').style.color = "red";
			document.getElementById('pwdmsg').innerHTML = "비밀번호가 일치하지 않습니다.";
		} else if (!reg_pwd.test(frm.passwd.value)) {
			document.getElementById('pwdmsg').style.color = "red";
			document.getElementById('pwdmsg').innerHTML = "비밀번호는 6~20자리 영문, 숫자만 가능합니다";
		} else {
			document.getElementById('pwdmsg').style.color = "black";
			document.getElementById('pwdmsg').innerHTML = "비밀번호가 <b>일치</b>합니다.";
		}
	}

	function chk() {
		var reg_id = /^[a-zA-Z0-9]{4,15}$/;
		var reg_pwd = /^[a-zA-Z0-9]{6,20}$/;
		alert("birth-> " + birth);
		if (!reg_id.test(frm.memberId.value)) {
			alert("아이디는 4~15자리 영문, 숫자만 가능합니다");
			frm.memberId.focus();
			return false;
		}
		if (frm.passwd.value != frm.passwd2.value) {
			alert("비밀번호가 일치하지 않습니다!");
			frm.passwd.focus();
			return false;
		} else if (!reg_pwd.test(frm.passwd.value)) {
			alert("비밀번호는 6~20자리 영문, 숫자만 가능합니다");
			frm.passwd.focus();
			return false;
		}
		if (frm.year.value == 0 || frm.month.value == 0 || frm.month.value == 0) {
			alert("생년월일을 입력하세요.");
			frm.year.focus();
			return false;
		}
		if (frm.question.value == 0) {
			alert("질문을 선택하세요")
			frm.question.focus();
			return false;
		}
		return true;
	}

	// 피부고민 해당없음
	function oneCheckbox(a) {
		var obj = document.getElementsByName("skincomplex");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != a) {
				obj[0].checked = false;
			}
			if (obj[0] == a) {
				for (var j = 1; j < obj.length; j++) {
					obj[j].checked = false;
					obj[0].checked = true;
				}
			}
		}
	}
</script>
<style>
/*   div{
  	border: 1px;
	margin: auto;
	pading:-20px;
	text-align: center;
	vertical-align: middle;
	
} */

body{
	background-color: #FFFFFF;
}

table{
	border : 10;
}
</style>
</head>
<body>
	<%-- <%@ include file="../header.jsp"%> --%>
	<div id="page-wrapper">
		<div id="memberWriteForm">
			<form action="writePro.do" method="post" name="frm"
				onsubmit="return chk()">
				<table   style="margin: auto;" border="1">
					<caption>
						<h2>신규회원가입</h2>
					</caption>
					<tr>
						<td>아이디<span style="color: red"> *필수</span></td>
						<td><input type="text" name="memberId" required="required">
							<div id="idmsg">아이디를 입력하십시오</div> <input type="button"
							value="중복체크" onclick="checkId()"></td>
					</tr>
					<tr>
						<td>비밀번호<span style="color: red"> *필수</span><br> 재입력
						</td>
						<td><input type="password" name="passwd" required><br>
							<input type="password" name="passwd2" onkeyup="checkPwd()"
							required></input>
							<div id="pwdmsg">비밀번호를 입력하십시오</div></td>
					</tr>
					<tr>
						<td>닉네임<span style="color: red"> *필수</span>
						</td>
						<td><input type="text" name="nickname" required="required"></td>
					</tr>
					<tr>
						<td>이름<span style="color: red"> *필수</span>
						</td>
						<td><input type="text" name="name" required="required"></td>
					</tr>
					<tr>
						<td>생년월일<span style="color: red"> *필수</span>
						</td>
						<td><select name="year" required="required">
								<option value="0" selected="selected">선택</option>
								<%
									Calendar cal = Calendar.getInstance();
									int year = cal.get(Calendar.YEAR);
									for (int i = year - 10; i > year - 70; i--) {
								%>
								<option value="<%=i%>"><%=i%></option>
								<%
									}
								%>
						</select>년 <select name="month" required="required">
								<option value="0" selected="selected">선택</option>
								<%
									for (int i = 1; i < 13; i++) {
								%>
								<option value="<%=String.format("%02d", i)%>"><%=String.format("%02d", i)%></option>
								<%
									}
								%>
						</select>월 <select name="day" required="required">
								<option value="0" selected="selected">선택</option>
								<%
									for (int i = 1; i < 32; i++) {
								%>
								<option value="<%=String.format("%02d", i)%>"><%=String.format("%02d", i)%></option>
								<%
									}
								%>
						</select>일</td>
					</tr>
					<tr>
						<td>성별<span style="color: red"> *필수</span>
						</td>
						<td><input type="radio" name="sex" value="0" id="s1"
							required="required"> <label for="s1">남성</label> <input
							type="radio" name="sex" value="1" id="s2"> <label
							for="s2">여성</label></td>
					</tr>
					<tr>
						<td>피부타입<span style="color: red"> *필수</span>
						</td>
						<td><input type="radio" name="skintype" value="0" id="st1"
							required="required"> <label for="st1">건성</label> <input
							type="radio" name="skintype" value="1" id="st2"> <label
							for="st2">중성</label> <input type="radio" name="skintype"
							value="2" id="st3"> <label for="st3">지성</label> <input
							type="radio" name="skintype" value="3" id="st4"> <label
							for="st4">복합성</label></td>
					</tr>
					<tr>
						<td>피부고민<br> <span style="color: red">(중복선택 가능)</span>
						</td>
						<td><input type="checkbox" name="skincomplex" id="sc1"
							value="0" onclick="oneCheckbox(this)" checked="checked">
							<label for="sc1">해당없음</label> <input type="checkbox"
							name="skincomplex" id="sc2" value="1" onclick="oneCheckbox(this)">
							<label for="sc2">아토피</label> <input type="checkbox"
							name="skincomplex" id="sc3" value="2" onclick="oneCheckbox(this)">
							<label for="sc3">여드름</label> <input type="checkbox"
							name="skincomplex" id="sc4" value="3" onclick="oneCheckbox(this)">
							<label for="sc4">민감성</label></td>
					</tr>
					<tr>
						<td>이메일<span style="color: red"> *필수</span>
						</td>
						<td><input type="email" name="email" required="required"
							placeholder="abc@abc.com"></td>
					</tr>
					<tr>
						<td>메일수신</td>
						<td><input type="radio" name="isemail" value="1" id="i1">
							<label for="i1">수신</label> <input type="radio" name="isemail"
							value="0" id="i2" checked="checked"> <label for="i2">미수신</label>
						</td>
					</tr>
					<tr>
						<td>주소<span style="color: blue"> *선택</span>
						</td>
						<td><input type="text" name="address"></td>
					</tr>
					<tr>
						<td>전화번호<span style="color: blue"> *선택</span>
						</td>
						<td><input type="tel" name="tel"
							pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx"
							title="2,3자리-3,4자리-4자리"></td>
					</tr>
					<tr>
						<td>질문<span style="color: red"> *필수</span><br> 답변<span
							style="color: red"> ID, 비밀번호 찾기</span>
						</td>
						<td><select name="question">
								<option value="0" selected="selected">질문을 선택하세요</option>
								<option value="1">아버님은 무슨일 하시니?</option>
								<option value="2">연봉이 어떻게 되니?</option>
								<option value="3">차는 있니?</option>
								<option value="4">문제 있는 장기 있니?</option>
						</select><br> <input type="text" name="answer" required="required">
						</td>
					</tr>
					<tr>
						<td><input type="submit" value="가입신청"></td>
						<td><input type="reset" value="다시작성"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<%-- <%@ include file="../footer.jsp"%> --%>
</body>
</html>