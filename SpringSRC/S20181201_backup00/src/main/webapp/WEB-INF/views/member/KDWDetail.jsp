<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../partials/head.jsp" %>

<title>Insert title here</title>

</head>
<body>
<h2>회원 상세 정보</h2>
<header><%@ include file="../partials/header.jsp" %></header>
<body>
<table>

		<tr><th>아이디<br></th><td>${member.memberId }<br></td></tr>
		<tr><th>닉네임<br></th><td>${member.nickname }<br></td></tr>
		<tr><th>이름<br></th><td>${member.name }<br></td></tr>
		<tr><th>생년월일<br></th><td>${member.birth }<br></td></tr>
		<tr><th>성별<br></th><td><script type="text/javascript">
							sexArray = new Array("남성", "여성")
							i = ${member.sex}
							{
								document.write(sexArray[i]);
							}
						</script><br></td></tr>
		<tr><th>피부타입<br></th><td><script type="text/javascript">
							skintypeArray = new Array("건성", "중성", "지성", "복합성")
							i = ${member.skinType}
							{
								document.write(skintypeArray[i]);
							}
						</script><br></td></tr>
		<tr><th>피부고민<br></th><td><script type="text/javascript">
							skinComplexArray = new Array("해당없음", "아토피", "여드름",
									"민감성")
							i = ${member.skinComplex}
							{
								document.write(skinComplexArray[i]);
							}
						</script><br></td></tr>
		<tr><th>회원등급<br></th><td><script type="text/javascript">
							gradeArray = new Array("관리자", "판매자", "일반인",
									"승인대기","휴면상태","탈퇴")
							i = ${member.grade}
							{
								document.write("[" + i + "]="
										+ gradeArray[i]);
							}
								</script><br></td></tr>	
		<tr><th>이메일<br></th><td>${member.email }<br></td></tr>
		<tr><th>메일수신여부<br></th><td><script type="text/javascript">
							isEmailArray = new Array("수신거부", "수신")
							i = ${member.isEmail}
							{
								document.write(isEmailArray[i]);
							}
						</script><br></td></tr>
		<tr><th>전화번호<br></th><td>${member.phone }<br></td></tr>
		<tr><th>주소<br></th><td>${member.address }<br></td></tr>
		<tr><th>질문<br></th><td>${member.question }<br></td></tr>
		<tr><th>답변<br></th><td>${member.answer }<br></td></tr>
		<tr><th>추천인<br></th><td>${member.recommender }<br></td></tr>
		<tr><th>가입일자<br></th><td>${member.joinDate }<br></td></tr>
		<tr><th>최종접속일</th><td>${member.regDate }</td></tr>
		
		<tr><td colspan="2">
			<input type="button" value="목록" onclick="location.replace('KDWAdminList.do')">
			<input type="button" value="수정" onclick="location.replace('KDWupdateForm.do?memberId=${member.memberId}')">
		</td></tr>
	
	</table>

<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>