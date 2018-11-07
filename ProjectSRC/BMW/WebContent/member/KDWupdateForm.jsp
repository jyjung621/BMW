<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/BMW/maincss/assets/css/main.css" />	
</head>
<body>
		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<!-- Blog -->
						<section>
							<header class="major" style="margin-bottom: 0px;">
								<h2>회원등급 수정</h2>
							</header>
						</section>

<form action="KDWupdatePro.do" method="post">
	<input type="hidden" name="memberId" value="${memberId }">
	<input type="hidden" name="pageNum" value="${pageNum }">
		<table border="1" style="margin: 0 auto;">
			<tr><td colspan="2">멤버ID : ${memberId }</td></tr>
			<tr><td>등급</td><td><select name="grade" style="height:30px; ">
				<option value ="0">관리자</option>
				<option value ="1">판매자</option>
				<option value ="2">사용자</option>
				<option value ="3">승인대기</option>
			</select></td></tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정완료">
					<input type ="reset" value="목록가기" onclick="location.href='KDWlist.do?pageNum=${pageNum}'">
				</td>
			</tr>
		</table>
</form>
<!-- 	</form> -->
</div>
</div>
</div>
</section>
<%@ include file="../footer.jsp"%>
</body>
</html>