<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
멤버ID : ${memberId }
<form action="KDWupdatePro.do" method="post">
	<input type="hidden" name="memberId" value="${memberId }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table border="1">
		<caption><h2>게시판 수정</h2></caption>
		<tr><td>등급</td><td><select name="grade">
			<option value ="0">관리자</option>
			<option value ="1">판매자</option>
			<option value ="2">사용자</option>
			<option value ="3">승인대기</option>
		</select></td></tr>
		
		
		<tr><td colspan="2"><input type="submit" value="수정완료"></td>
			<td><input type ="reset" value="취소"
			onclick="location.href='KDWlist.do?pageNum=${pageNum}'"></td>
		</tr>
	</table>

</form>

</body>
</html>