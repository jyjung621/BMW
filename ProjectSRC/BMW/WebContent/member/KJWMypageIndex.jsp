<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../sessionCheck.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	margin: 0;
}

/* Style the header */
.header {
	background-color: #f1f1f1;
	padding: 20px;
	text-align: center;
}

.photo2 { /* 직사각형 사진에 적용 */
	width: 100px;
	height: 100px;
	object-fit: cover;
	object-position: top;
	border-radius: 50%;
}

.photo3 { /* 정사각형 사진에 적용 */
	width: 100px;
	height: 100px;
	object-fit: cover;
	border-radius: 50%;
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
					<c:set var="id" value="<%=sessionId%>" />
				</div>
				<!-- <section id="login"> -->
				<section>
					<div class="header">
						<h1>
							<a href='myPage.do'>My Page</a>
						</h1>
						<p>프로필 사진</p>
						<c:if test="${savefile != null }">
							<label for="file"><img class="photo3"
								src="/BMW${savefile.getFilePath() }/${savefile.getSavedFileName()}"></label>
						</c:if>
						<form method="POST" action="memberPicPro.do"
							enctype="multipart/form-data">
							<input type="file" name="file" id="file" required />
							<p>
								<input type="submit" value="등록" />
							</p>
						</form>
						<p>
					</div>
					<div class="row">
						<div class="col-6 col-12-small">
							<div class="card"
								style="background-image: url('../images/green.png'); padding: 20px;">
								<div class="card-body">
									<h2 class="card-title">나의 스크랩</h2>
									<p class="card-text">내가 저장한 스크랩을 확인할 수 있습니다.</p>
									<a href="clipList.do?view=1" class="btn btn-primary"
										style="color: black;">바로가기</a>
								</div>
							</div>
						</div>
						<br>
						<br>
						<div class="col-6 col-12-small">
							<div class="card"
								style="background-image: url('../images/pink.png'); padding: 20px;">
								<div class="card-body">
									<h2 class="col-">내가 쓴 리뷰</h2>
									<p class="card-text">내가 쓴 리뷰를 확인할 수 있습니다.</p>
									<a href="/BMW/member/ReviewList.do?memberId=<%=sessionId%>" class="btn btn-primary" style="color: black;">바로가기</a>
								</div>
							</div>
						</div>
					</div>
					<br> <br>
					<div class="row">
						<div class="col-6 col-12-small">
							<div class="card"
								style="background-image: url('../images/purple.png'); padding: 20px;">
								<div class="card-body">
									<h2 class="card-title">내가 쓴 댓글</h2>
									<p class="card-text">내가 쓴 댓글을 확인할 수 있습니다.</p>
									<a href="/BMW/member/CommentsList.do?memberId=<%=sessionId%>"
										class="btn btn-primary" style="color: black;">바로가기</a>
								</div>
							</div>
						</div>
						<div class="col-6 col-12-small">
							<div class="card"
								style="background-image: url('../images/yellow.png'); padding: 20px;">
								<div class="card-body">
									<h2 class="card-title">회원정보수정</h2>
									<p class="card-text">회원정보를 수정할 수 있습니다.</p>
									<a href="/BMW/member/KJWupdateForm.do?memberId=<%=sessionId%>"
										class="btn btn-primary" style="color: black;">바로가기</a>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section>
					<c:if test="${grade == 0 }">
						<tr>
							<section>
							<header class="major" style="margin-bottom: 0px;">
								<h2>관리자 메뉴</h2>
							</header>
							</section>
							<div align="center">
								<a href="KDWlist.do?pageNum=${pageNum}" id="w" class="content"><button>회원관리</button></a>
								<a href="../item/itemIndex.jsp?pageNum=${pageNum}" id="w" class="content"><button>제품관리</button></a> 
								<a href="../item/IngtList.do?pageNum=${pageNum}" id="w" class="content"><button>성분관리</button></a>
								<a href="../item/CategoryList.do?pageNum=${pageNum}" id="w" class="content"><button>카테고리관리</button></a> 
								<a href="../board/boardList.do?boardCategory=자유" id="w" class="content"><button>게시판관리</button></a>
							</div><hr>
					</c:if>
					<c:if test="${grade == 1 }">
						<strong>판매자</strong>
					</c:if>
					<c:if test="${grade == 2 }">
						<strong>일반회원</strong>
					</c:if>
					<c:if test="${grade == 3 }">
						<strong>가입승인대기 회원</strong>
					</c:if>
				</section>
				</div>
				</section>
				</div>
				
				<div>
					<%@ include file="../footer.jsp"%>
				</div>
</body>
</html>