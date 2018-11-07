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
<link rel="stylesheet" href="/BMW/maincss/assets/css/main.css" />
<style type="text/css">
table {
	width: 100%;
	margin: auto;
	text-align: center;
}

th {
	background-color: #ddd;
	text-align: center;
}

th.title {
	text-align: center;
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
					<section> <header class="major"
						style="margin-bottom: 0px;">
					<h2>회원 리스트</h2>
					</header> </section>
					<table>

						<tr style="background-color: #f7f7f7; ">
							<td style="background-color: #f7f7f7; ">
								<div class="header">
									<div class="title2">
										<a href="KDWlist.do?pageNum=${pageNum}" id="w" class="content"><button>회원관리</button></a>
										<a href="../item/itemIndex.jsp?pageNum=${pageNum}" id="w" class="content"><button>제품관리</button></a> 
										<a href="../item/IngtList.do?pageNum=${pageNum}" id="w" class="content"><button>성분관리</button></a>
										<a href="../item/CategoryList.do?pageNum=${pageNum}" id="w" class="content"><button>카테고리관리</button></a> 
										<a href="../board/boardList.do?boardCategory=자유" id="w" class="content"><button>게시판관리</button></a>
									</div>
								</div>
							</td>
						</tr>
					</table>
					<form action="KDWlist3.do" method="post">
					<div style="float:right;">
						<select name="find" style="width: 100px; height: 30px;">
							<option value="아이디">아이디</option>
							<option value="이름">이름</option>
							<option value="주소">주소</option>
						</select>
					<input type="text" name="search" style="height: 30px;"> 
					<input
							type="submit" value="검색"></div>
					</form>

	<form>
						<table>
							<tr>
								<th>번호</th>
								<th>아이디</th>
								<th>닉네임</th>
								<th>이름</th>
								<th>생년월일</th>
								<th>성별</th>
								<th>등급</th>
								<th>이메일</th>


							</tr>

							<c:if test="${totCnt > 0 }">
								<c:forEach var="member" items="${list}">
									<tr>
										<td>${startNum}</td>
										<%-- <td class="left" width="200">
						
						<a href='content.do?num=${member.num }&pageNum=${currentPage}'>
							${member.memberId }</a>
					</td> --%>
										<td><a href='KDWMList.do?memberId=${member.memberId }'>${member.memberId }</a></td>
										<td>${member.nickName }</td>
										<td>${member.name }</td>
										<td>${member.birth}</td>
										<!--성별로 구분  -->
										<td><script type="text/javascript">
											sexArray = new Array("남성", "여성")
											i = ${member.sex}
											{
												document.write(sexArray[i]);
											}
										</script></td>

										<!--어느 아이디의 등급을 바꿀지 구분을 하기위해 memberId값을 가지고 왔다.  -->
										<td><a
											href='KDWupdateForm.do?memberId=${member.memberId }'> <!--등급별로 구분  -->
												<script type="text/javascript">
													gradeArray = new Array(
															"관리자", "판매자",
															"사용자", "승인대기")
													i = ${member.grade}
													{
														document
																.write("["
																		+ i
																		+ "]="
																		+ gradeArray[i]);
													}
												</script>
										</a></td>
										<td>${member.email }</td>
										


									</tr>
									<c:set var="startNum" value="${startNum -1 }" />
								</c:forEach>
							</c:if>
							<c:if test="${totCnt ==0 }">
								<tr>
									<td colspan=7>데이터가 없네</td>
								</tr>
							</c:if>
						</table>
						<!-- 검색어가 있을때  -->
						<c:choose>
							<c:when test="${search != null }">
								<div style="text-align: center;">
									<c:if test="${startPage > blockSize }">
										<a
											href='KDWlist3.do?pageNum=${startPage-blockSize }&search=${search}&find=${find}'>[이전]</a>
									</c:if>
									<c:forEach var="i" begin="${startPage }" end="${endPage}">
										<a
											href='KDWlist3.do?pageNum=${i}&search=${search}&find=${find}'>[${i}]</a>
									</c:forEach>

									<c:if test="${endtPage > pageCnt }">
										<a
											href='KDWlist3.do?pageNum=${startPage+blockSize }&search=${search}&find=${find}'>[다음]</a>
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
										<a href='KDWlist.do?pageNum=${i}'>[${i}]</a>
									</c:forEach>

									<c:if test="${endtPage > pageCnt }">
										<a href='KDWlist.do?pageNum=${startPage+blockSize }'>[다음]</a>
									</c:if>
								</div>
							</c:otherwise>
						</c:choose>
					</form>
					<!-- 	</form> -->

	</div>
	</div>
	</div>
	</section>
	</div>


	<!-- <footer0></footer0> -->
	<%@ include file="../footer.jsp"%>
</body>
</html>