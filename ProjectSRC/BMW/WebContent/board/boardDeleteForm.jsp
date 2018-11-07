<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../MAIN/assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>삭제페이지</h2>
	<%@ include file="../header.jsp"%>
	<form action="boardDeletePro.do">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="boardCategory" value="${boardCategory }">
		<input type="hidden" name="boardNo" value="${boardNo }"> 삭제 하시겠습니까? ${boardCategory }
		<br>
		<br> <input type="submit" value="확인"> <input
			type="button" value="취소" onclick=history.go(-1)>
	</form>
	<%@ include file="../footer.jsp"%>
</body>
</html>