<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<c:if test="${result > 0 }">
	<c:if test="${gubun == 1 }">
		<script type="text/javascript">
			alert("삭제완료 ! ");
			location.replace("clipList.do?view=1&gubun=1");
		</script>
	</c:if>
	<c:if test="${gubun == 2 }">
		<script type="text/javascript">
		alert("삭제완료 ! ");
		location.replace("clipList.do?view=2&gubun=2");
	</script>
	</c:if>
</c:if>
<c:if test="${result <= 0 || result == null}">
	<script type="text/javascript">
		alert("선택된 항목이 없습니다!");
		history.back();
	</script>
</c:if>	
</body>
		
</html>