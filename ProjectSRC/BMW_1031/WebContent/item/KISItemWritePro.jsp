<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${result > 0 && result2 > 0}">
	<script type="text/javascript">
		alert("저장 완료");
		location.href="ItemCategoryHeader.do?pageNum=${pageNum}&cateNum=${cateNum}";
	</script>
</c:if>
<c:if test="${result== 0 || result2 == 0}">
	<script type="text/javascript">
		alert("저장 실패");
		location.href="ItemWriteForm.do?itemNo=${itemNo}&pageNum=${pageNum}";
	</script>
</c:if>
</head>
<body>

</body>
</html>