<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../partials/head.jsp" %>

<title>Insert title here</title></head>
<body>
<h2>회원 목록</h2>
<header><%@ include file="../partials/header.jsp" %></header>

<body>

	<form action="KDWAdminList.do" method="post">
		<select name="keyword">
			<option value="아이디">아이디</option>
			<option value="이름">이름</option>
			<option value="주소">주소</option>
		</select><br><br> 
		<input type="text" name="search" value="${search}"> 
		<input type="submit" value="검색">
	</form>
<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
	<table>
		<tr>
			<td>아이디&emsp;&emsp;</td>
			<td>닉네임&emsp;&emsp;</td>
			<td>이름&emsp;&emsp;</td>
			<td>생년월일&emsp;&emsp;</td>
			<td>성별&emsp;&emsp;</td>
			<td>주소</td>
		</tr>
		<c:forEach items="${list}" var="member">
			<tr>
				<td><a href="KDWDetail.do?memberId=${member.memberId}">${member.memberId}&emsp;</a></td>
				<td>${member.nickname}&emsp;</td>
				<td>${member.name}&emsp;</td>
				<td>${member.birth}&emsp;</td>
				<td><script type="text/javascript">
							sexArray = new Array("남성", "여성")
							i = ${member.sex}
							{
								document.write(sexArray[i]);
							}
						</script>&emsp;</td>
				<td>${member.address}</td>
			</tr>
		<c:set var="num" value="${num - 1}"></c:set>
		</c:forEach>
	</table>
	<c:choose>
		<c:when test="${search != null }">
			<div style="text-align: center;">
				<c:if test="${pg.startPage > pg.pageBlock}">
					<a href='KDWAdminList.do?currentPage=${pg.startPage-pg.pageBlock}&search=${search}&keyword=${keyword}'>[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href='KDWAdminList.do?currentPage=${i}&search=${search}&keyword=${keyword}'>[${i}]</a>
				</c:forEach>
				<c:if test="${pg.endPage < pg.totalPage}">
					<a href='KDWAdminList.do?currentPage=${startPage+blockSize }&search=${search}&keyword=${keyword}'>[다음]</a>
				</c:if>
			</div>
		</c:when>
		<c:otherwise>
			<div style="text-align: center;">
				<c:if test="${pg.startPage > pg.pageBlock}">
					<a href="KDWAdminList.do?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href="KDWAdminList.do?currentPage=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${pg.endPage < pg.totalPage}">
					<a href="KDWAdminList.do?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
				</c:if>
			</div>
		</c:otherwise>
	</c:choose>
		
	<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>