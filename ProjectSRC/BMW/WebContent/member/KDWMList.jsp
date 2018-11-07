<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="styLesheet" href="../member/maincss/assets/css/main.css" type="text/css">
<style type="text/css">
table {
		width : 100%;
		margin : auto;
		text-align : center;
	}
	th {
		background-color: #ddd;
		text-align: center;
	}
	th.title {
		text-align:center;
		display: table-cell;
		vertical-align: middle;
	}
	td {
		text-align: center;
		background-color: #eee;
	}
	caption {
		text-align: center;
		font-size: x-large;
	}
</style>



</head>
<body>
<%@ include file="../header.jsp"%>
<div id="page-wrapper">

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<!-- Blog -->
						<section>
							<header class="major" style="margin-bottom: 0px;">
								<h2>회원 상세정보</h2>
							</header>
						</section>
<table>
			
				<tr style="background-color: #f7f7f7; "><td style="background-color: #f7f7f7; ">
					<div class="header">
						<div class ="title2">							
							<a href="KDWlist.do?pageNum=${pageNum}" class="content" ><button>회원 리스트</button></a> 
							<a href="../item/itemIndex.jsp?pageNum=${pageNum}" class="content"><button>제품 리스트</button></a> 
							<a href="../item/KISIngtList.do?pageNum=${pageNum}" class="content"><button>성분리스트</button></a> 
							<a href="../board/boardList.do?boardCategory=자유" class="content"><button>게시판 관리</button></a>
						</div>
					</div>
				</td></tr>												
			</table>
	<form>																					
				<c:forEach var="member" items="${list}">
					<tr>									
					<table>
			<tr><th class="title" width="200">아이디</th><td>${member.memberId }</td></tr>
			<tr><th class="title">닉네임</th><td>${member.nickName }</td></tr>
			<tr><th class="title">이름</th><td>${member.name }</td></tr>
			<tr><th class="title">생년월일</th><td>${member.birth}</td></tr>
			<tr><th class="title">성별</th><!--성별로 구분  -->
						<td><script type="text/javascript">
							sexArray = new Array("남성", "여성")
							i = ${member.sex}
							{
								document.write(sexArray[i]);
							}
						</script></td></tr>
			<tr><th class="title">피부타입</th><!--피부타입별로 구분  -->
						<td><script type="text/javascript">
							skintypeArray = new Array("건성", "중성", "지성", "복합성")
							i = ${member.skinType}
							{
								document.write(skintypeArray[i]);
							}
						</script></td></tr>
			<tr><th class="title">피부고민</th><!--피부고민별로 구분  -->
						<td><script type="text/javascript">
							skinComplexArray = new Array("해당없음", "아토피", "여드름",
									"민감성")
							i = ${member.skinComplex}
							{
								document.write(skinComplexArray[i]);
							}
						</script></td></tr>
			<tr><th class="title">등급</th><!--어느 아이디의 등급을 바꿀지 구분을 하기위해 memberId값을 가지고 왔다.  -->
						<td><a href='KDWupdateForm.do?memberId=${member.memberId }'>
								<!--등급별로 구분  --> <script type="text/javascript">
									gradeArray = new Array("관리자", "판매자", "사용자",
											"승인대기")
									i = ${member.grade}
									{
										document.write("[" + i + "]="
												+ gradeArray[i]);
									}
								</script>
						</a></td></tr>
			<tr><th class="title">이메일</th><td>${member.email }</td></tr>
			<tr><th class="title">isEmail</th><!--이메일 수신확인여부  -->
						<td><script type="text/javascript">
							isEmailArray = new Array("수신거부", "수신")
							i = ${member.isEmail}
							{
								document.write(isEmailArray[i]);
							}
						</script></td></tr>
			<tr><th class="title">전화</th><td>${member.phone }</td></tr>
			<tr><th class="title">주소</th><td>${member.address }</td></tr>
			<tr><th class="title">질문</th><td>${member.question }</td></tr>
			<tr><th class="title">답</th><td>${member.answer }</td></tr>
			<tr><th class="title">joinDate</th><td>${member.joinDate }</td></tr>
			<tr><th class="title">regDate</th><td>${member.regDate }</td></tr>														
			</table>																																																			
					</tr>
					<c:set var="startNum" value="${startNum -1 }" />
				</c:forEach>

		
<!-- 검색어가 있을때  -->
		<c:choose>
			<c:when test="${search != null }">
				<div style="text-align: center;">
					<c:if test="${startPage > blockSize }">
						<a href='KDWlist3.do?pageNum=${startPage-blockSize }&search=${search}&find=${find}'>[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage}">
						<a href='KDWlist3.do?pageNum=${i}&search=${search}&find=${find}'></a>
					</c:forEach>

					<c:if test="${endtPage > pageCnt }">
						<a href='KDWlist3.do?pageNum=${startPage+blockSize }&search=${search}&find=${find}'>[다음]</a>
					</c:if>
				</div>
			</c:when>
			<c:otherwise>
				<!-- 검색어가 없을때  -->
				<div style="text-align: center;">
					<c:if test="${startPage > blockSize }">
						<a href='KDWlist.do?pageNum=${startPage-blockSize }'>[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<a href='KDWlist.do?pageNum=${i}'></a>
					</c:forEach>

					<c:if test="${endtPage > pageCnt }">
						<a href='KDWlist.do?pageNum=${startPage+blockSize }'>[다음]</a>
					</c:if>
				</div>
			</c:otherwise>
		</c:choose>
	</form>
	
	<!-- 	</form> -->
		</section>

	</div>
	</div>
	</div>
	</section>
	</div>


	<!-- <footer0></footer0> -->
<%@ include file="../footer.jsp"%>
</body>
</html>