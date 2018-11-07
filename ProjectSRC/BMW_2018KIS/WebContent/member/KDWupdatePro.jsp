<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <c:if test="${grade == 0 }"> 
 <script type="text/javascript"> 
	alert("관리자로 수정완료!");
	location.href="KDWlist.do?pageNum=${pageNum }"; 
 	</script>
 	 
 </c:if> 

 <c:if test="${grade == 1 }">
 <script type="text/javascript"> 
 	alert("판매자로 수정완료!"); 
	location.href="KDWlist.do?pageNum=${pageNum }";
 	</script>
 </c:if> 

 <c:if test="${grade == 2 }"> 
 <script type="text/javascript">
 	alert("사용자로 수정완료!");
 	location.href="KDWlist.do?pageNum=${pageNum }"; 
 	</script> 
 </c:if> 

 <c:if test="${grade == 3 }"> 
 <script type="text/javascript"> 
 	alert("승인 대기!");
	location.href="KDWlist.do?pageNum=${pageNum }";
 	</script> 
 </c:if>  

 <%-- <c:choose>
 	<c:when test="${grade eq '0' }">
 		관리자 입니다.
 	</c:when>
 </c:choose> --%>

</body>
</html>