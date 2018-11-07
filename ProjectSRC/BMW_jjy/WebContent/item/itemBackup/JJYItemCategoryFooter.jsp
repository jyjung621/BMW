<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("itemListShow").load("ItemCategoryList.do?cateNum=${categoryNo}&sortName=${sortName}&startRow=${startRow}&endRow=${endRow}&pageNumIC=${pageNumIC}");
	});
	
	function callListShow(num) {
		var startRow = (num - 1) * ${pageSize} + 1;
		var endRow = startRow + ${pageSize} - 1;
		
		$("itemListShow").load("ItemCategoryList.do?cateNum=${categoryNo}&sortName=${sortName}&startRow="+startRow+"&endRow="+endRow+"&pageNumIC=" + num);
	}
</script>
</head>
<body>

	<div style="text-align: center;">
		<c:if test="${startPage > blockSize}">
			<a href="#" onclick="callListShow(${startPage-blockSize}); return false;">[이전]</a>
<%-- 			<a href="ItemCategoryHeader.do?pageNumIC=${startPage-blockSize}">[이전]</a> --%>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="#" onclick="callListShow(${i}); return false;">[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt}">
			<a href="#" onclick="callListShow(${startPage-blockSize}); return false;">[이전]</a>
<%-- 			<a href="ItemCategoryHeader.do?pageNumIC=${startPage+blockSize}">[다음]</a> --%>
		</c:if>
	</div>
	
</body>
</html>