<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 && result3 >0}">
	<script type="text/javascript">
		alert("수정 완료");
		location.href="ItemContent.do?itemNo=${itemNo}&pageNum=${pageNum}";
// 		location.href="ItemList.do?pageNum=${pageNum}";
	</script>
</c:if>
<c:if test="${result== 0 || result3 == 0}">
	<script type="text/javascript">
		alert("수정 실패. 확인요망");
		location.href="ItemUpdateForm.do?itemNo=${itemNo}&pageNum=${pageNum}";
	</script>
</c:if>
</body>
</html>