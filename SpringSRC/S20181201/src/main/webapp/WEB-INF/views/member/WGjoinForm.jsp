<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신규회원가입</title>
<script type="text/javascript">
	//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	var idck = 0;
	$(function() {
	    //idck 버튼을 클릭했을 때 
	    $("#idck").click(function() {
	        checkId();
	        //userid 를 param.
	        var userid =  $("#memberId").val(); 
	        
	        $.ajax({
	            async: true,
	            type : 'POST',
	            data : userid,
	            url : "idcheck.do",
	            dataType : "json",
	            contentType: "application/json; charset=UTF-8",
	            success : function(data) {
	                if (data.cnt > 0) {
	                	document.getElementById('idmsg').style.color = "blue";
						document.getElementById('idmsg').innerHTML = "존재하는 ID입니다.";
	                    $("#memberId").focus();
	                    idck = 0;
	                } else {
	                	document.getElementById('idmsg').style.color = "black";
						document.getElementById('idmsg').innerHTML = "<b>사용 가능</b>한 ID입니다.";
	                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
	                    //$("#idmsg").addClass("has-success")
	                    //$("#idmsg").removeClass("has-error")
	                    $("#passwd").focus(); 
	                    //아이디가 중복하지 않으면  idck = 1 
	                    idck = 1;
	                    
	                }
	            },
	            error : function(error) {
	            	$("#memberId").focus();
	            }
	        });
	    });
	});
	
	function checkId() {
		idck = 0;
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
		if(idck==0){
            alert('아이디 중복체크를 해주세요');
            frm.memberId.focus();
            return false;
        }
		var reg_pwd = /^[a-zA-Z0-9]{6,20}$/;
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
		alert("회원가입을 축하합니다");
		return true;
	}

	// 피부고민 해당없음
	function oneCheckbox(a) {
		var obj = document.getElementsByName("skinComplex");
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
</head>
<body>

<header><%@ include file="../partials/header.jsp" %></header>
	<div id="page-wrapper">

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<!-- Blog -->
						<section>
							<header class="major" style="margin-bottom: 0px;">
								<h2>신규회원가입</h2>
							</header>
						</section>
						<form action="WGjoin.do" method="post" name="frm" onsubmit="return chk()">
							<table border="1">
								<tr>
									<td>아이디<span style="color: red"> *필수</span></td>
									<td><input type="text" name="memberId" id="memberId" maxlength="30" placeholder="4~15자리 영문, 숫자" required>
										<div id="idmsg">아이디를 입력하세요.</div> 
										 <br>
										<input type="button" value="중복체크" id="idck">
										</td>
								</tr>
								<tr>
									<td>비밀번호<span style="color: red"> *필수</span><br> 재입력
									</td>
									<td><input type="password" name="passwd"
										placeholder="6~20자리 영문, 숫자" required><br> <input
										type="password" name="passwd2" placeholder="비밀번호 확인"
										onkeyup="checkPwd()" required></input>
										<div id="pwdmsg">비밀번호를 입력하십시오</div></td>
								</tr>
								<tr>
									<td>닉네임<span style="color: red"> *필수</span></td>
									<td><input type="text" name="nickname" required></td>
								</tr>
								<tr>
									<td>이름<span style="color: red"> *필수</span></td>
									<td><input type="text" name="name" required></td>
								</tr>
								<tr>
									<td>생년월일<span style="color: red"> *필수</span></td>
									<td><input type="date" name="birth" required></td>
								</tr>


								<tr>
									<td>성별<span style="color: red"> *필수</span></td>
									<td><input type="radio" name="sex" value="0" id="s1" required></input><label for="s1">남성</label>
										<input type="radio" name="sex" value="1" id="s2"></input><label for="s2">여성</label></td>
								</tr>
								<tr>
									<td>피부타입<span style="color: red"> *필수</span>
									</td>
									<td><input type="radio" name="skinType" value="0" id="st1" required></input><label for="st1">건성</label>
										<input type="radio" name="skinType" value="1" id="st2"></input><label for="st2">중성</label>
										<input type="radio" name="skinType" value="2" id="st3"></input><label for="st3">지성</label>
										<input type="radio" name="skinType" value="3" id="st4"></input><label for="st4">복합성</label></td>
								</tr>
								<tr>
									<td>피부고민<br> 
<!-- 									<span style="color: red">(중복선택 가능)</span> -->
									</td>
									<td><input type="radio" name="skinComplex" value="0" id="sc1" checked="checked" required></input><label for="sc1">해당없음</label>
										<input type="radio" name="skinComplex" value="1" id="sc2"></input><label for="sc2">아토피</label>
										<input type="radio" name="skinComplex" value="2" id="sc3"></input><label for="sc3">여드름</label>
										<input type="radio" name="skinComplex" value="3" id="sc4"></input><label for="sc4">민감성</label></td>
								</tr>
								<tr>
									<td>이메일<span style="color: red"> *필수</span></td>
									<td>
										<input type="email" name="email" placeholder="abc@abc.com" required><br>
										입력하신 이메일 주소로 가입승인 메일이 발송됩니다
									</td>
								</tr>
								<tr>
									<td>메일수신</td>
									<td><input type="radio" name="isEmail" value="1" id="i1"></input><label for="i1">수신</label>
									<input type="radio" name="isEmail" value="0" id="i2" checked="checked"></input><label for="i2">미수신</label>
									</td>
								</tr>
								<tr>
									<td>전화번호<span style="color: blue"> *선택</span>
									</td>
									<td><input type="tel" name="phone"
										pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx"
										title="2,3자리-3,4자리-4자리"></td>
								</tr>
								<tr>
									<td>주소<span style="color: blue"> *선택</span>
									</td>
									<td><input type="text" name="address"></td>
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
									<td>추천인ID<span style="color: blue"> *선택</span></td>
									<td><input type="text" name="recommender"></td>
								</tr>
								<tr>
									<td></td>
									<td><input type="submit" value="가입신청">&nbsp&nbsp&nbsp&nbsp
									<input type="reset" value="다시작성"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>


<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>