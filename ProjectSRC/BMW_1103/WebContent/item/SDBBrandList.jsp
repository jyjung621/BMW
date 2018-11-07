<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>브랜드 리스트</title>
</head>
<body>
	<table border="1" style="margin: auto;">

		<tr>
			<th colspan=2>브랜드별 제품을 확인해 보세요!</th>
		</tr>

		<c:forEach var="itemInfo" items="${list }">
			<tr>
				<td><img src="/BMW/images/${itemInfo.brand }.jpg" width="100" height="100"></td>
				<td><a href='/BMW/item/brandList1.do?brand=${itemInfo.brand }'>${itemInfo.brand }</a></td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>