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
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("작성 완료");
			location.replace("ItemContent.do?itemNo=${mainNo}&pageNum=${pageNum}&pageNumRv=${pageNumRv}");
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("작성 실패. 확인요망");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>