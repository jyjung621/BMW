<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


<title>Insert title here</title>



</head>
<body>
	<h2>회원 상세 정보</h2>
	<header><%@ include file="../partials/header.jsp"%></header>

	<!-- <script>
$(function(){
	$('#btn-select-grade').click(function() {
		$("#gradebox").val(grade==0);
		"관리자"
	});
});

</script> -->
	<%-- <c:if test="${grade == 0 }"> 
 <script type="text/javascript"> 
	alert("관리자로 수정완료!");
	location.href="KDWAdminList.do?pageNum=${pageNum }"; 
 	</script>
 	 
 </c:if> 
 <c:if test="${grade == 1 }"> 
 <script type="text/javascript"> 
	alert("일반회원으로 수정완료!");
	location.href="KDWAdminList.do?pageNum=${pageNum }"; 
 	</script>
 	 
 </c:if> 
 <c:if test="${grade == 2 }"> 
 <script type="text/javascript"> 
	alert("판매자로 수정완료!");
	location.href="KDWAdminList.do?pageNum=${pageNum }"; 
 	</script>
 	 
 </c:if> <c:if test="${grade == 3 }"> 
 <script type="text/javascript"> 
	alert("대기자로 수정완료!");
	location.href="KDWAdminList.do?pageNum=${pageNum }"; 
 	</script>
 	<c:if test="${grade == 4 }"> 
 <script type="text/javascript"> 
	alert("휴면계정 수정완료!");
	location.href="KDWAdminList.do?pageNum=${pageNum }"; 
 	</script>
 	 
 </c:if> 
 <c:if test="${grade == 5 }"> 
 <script type="text/javascript"> 
	alert("관리자로 수정완료!");
	location.href="KDWAdminList.do?pageNum=${pageNum }"; 
 	</script>
 	 
 </c:if> 
 	 
 </c:if>  --%>


	<form action="KDWupdate.do" method="post">
<%-- 		<input type="hidden" name="grade" value="${member.grade }"> --%>
		<input type="hidden" name="memberId" value="${member.memberId }">
		<table>

			<tr>
				<th>아이디</th>
				<td>${member.memberId }</td>
			</tr>
			<tr><th>닉네임</th><td><input type="text" name="nickname" value="${member.nickname }" required></td></tr>
			<tr><th>이름</th><td><input type="text" name="name" value="${member.name }" required></td></tr>
			<tr><th>생일</th><td><input type="date" name="birth" value="${member.birth }" required></td></tr>
			<tr><th>성별</th><td>
					남성 <input type="radio" name="sex" value="${member.sex }" checked />
					여성 <input type="radio" name="sex" value="${member.sex }" /></td></tr>



			<tr>
				<th>피부타입</th>
				<td><input type="radio" name="skinType" value="0" id="st1" required></input><label for="st1">건성</label>
                              <input type="radio" name="skinType" value="1" id="st2"></input><label for="st2">중성</label>
                              <input type="radio" name="skintype" value="2" id="st3"></input><label for="st3">지성</label>
                              <input type="radio" name="skinType" value="3" id="st4"></input><label for="st4">복합성</label></td>
			</tr>
			<tr><td>피부고민<br></td>
<!-- <span style="color: red">(중복선택 가능)</span> -->
            <td><input type="radio" name="skinComplex" value="0" id="sc1" checked="checked" required></input><label for="sc1">해당없음</label>
                <input type="radio" name="skinComplex" value="1" id="sc2"></input><label for="sc2">아토피</label>
                <input type="radio" name="skinComplex" value="2" id="sc3"></input><label for="sc3">여드름</label>
                <input type="radio" name="skinComplex" value="3" id="sc4"></input><label for="sc4">민감성</label>
                </td></tr>
            <tr>
				<th>회원등급</th>
				<td>
				
					<select id="grade" name="grade">
						<option value="0" >관리자</option>
						<option value="1">판매자</option>
						<option value="2">일반회원</option>
						<option value="3">대기자</option>
						<option value="4">휴면계정</option>
						<option value="5">탈퇴회원</option>
					</select>
				</td>
			</tr>
			
		<tr><th>이메일</th><td><input type="email" name="email" placeholder="abc@abc.com" required></td></tr>
		<tr><th>메일수신여부</th><td>
		<input type="radio" name="isEmail" value="1" id="i1"></input><label for="i1">수신</label>
        <input type="radio" name="isEmail" value="0" id="i2" checked="checked"></input>
        <label for="i2">미수신</label></td></tr>
        
		<tr><th>전화번호</th><td><input type="tel" name="phone"
                              pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx"
                              title="2,3자리-3,4자리-4자리"></td></tr>
		<tr><th>주소</th><td><input type="text" name="address" value="${member.address }" ></td></tr>
			<tr><th>질문</th><td>
				<select name="question">
						<option value="0" selected="selected">질문을 선택하세요</option>
						<option value="1">아버님은 무슨일 하시니?</option>
						<option value="2">연봉이 어떻게 되니?</option>
						<option value="3">차는 있니?</option>
						<option value="4">문제 있는 장기 있니?</option>
				</select></td></tr>
				
			<tr><th>답변</th><td><input type="text" name="answer" value="${member.answer }" required></td></tr>
		<tr><th>추천인</th><td><input type="text" name="recommender" value="${member.recommender }" ></td></tr>
		<tr><th>가입일자</th><td>${member.joinDate }</td></tr>
		<tr><th>최종접속일</th><td>${member.regDate }</td></tr>
		
		<tr><td colspan="2">
			<input type="button" value="목록" onclick="location.replace('KDWAdminList.do')">
			<input type="submit" value="확인" >
			<input type="button" value="취소" onclick="location.replace('KDWDetail.do?memberId=${member.memberId}')"> </td></tr>
	
	</table>
</form>
<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>