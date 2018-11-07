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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<script type="text/javascript">

</script>
</head>
<body>
	<table border="1" style="margin: auto;">

		<tr>
			<th colspan=3>${brand }의제품들</th>
		</tr>
		<tr>
			<td colspan=2>제품 ${totCnt }개</td>
			<td>
				<select name="brand">
					<option value="name">랭킹순</option>
					<option value="regDate">등록순</option>
					<option value="price">가격순</option>
				</select>
			</td>
		</tr>


		<c:forEach var="itemInfo" items="${list }">
			<tr>
				<td>상품별 이미지</td>
				<td><a href='ItemContent.do?itemNo=${itemInfo.itemNo }'>${itemInfo.name }</a></td>
				<td>${itemInfo.price }</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>