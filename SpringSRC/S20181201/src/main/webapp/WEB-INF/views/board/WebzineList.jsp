<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../partials/head.jsp" %>
<style>
	.container{
		margin: 0 auto;
	}
	 .fakeimg {
      height: 200px;
      background: #aaa;
  }
</style>
<title>BMW 웹진</title></head>
<body>
<header><%@ include file="../partials/header.jsp" %></header>
<%-- <div class="container">
	<table>
		<c:forEach var="i" begin="0" end="${list.size() }" step="2">
			<tr>
				<c:if test="${saveFiles.size() > i}">
					<td>
						<a href="BoardContent.do?boardNo=${list.get(i).getBoardNo() }">
							<img src="/bmw/img/${saveFiles.get(i).getSavedFileName()}"
									alt="" width="600" height="350" />
						</a>
					</td>
				</c:if>
				<c:if test="${saveFiles.size() > i+1}">
					<td>
						<a href="BoardContent.do?boardNo=${list.get(i+1).getBoardNo() }">
							<img src="/bmw/img/${saveFiles.get(i+1).getSavedFileName()}"
									alt="" width="600" height="350" />
						</a>				
					</td>
				</c:if>
			</tr>	
			<tr>
				<c:if test="${list.size() > i}">
					<td><a href="BoardContent.do?boardNo=${list.get(i).getBoardNo() }">${list.get(i).getTitle()}</a></td>
				</c:if>
				<c:if test="${list.size() > i+1}">
					<td><a href="BoardContent.do?boardNo=${list.get(i+1).getBoardNo() }">${list.get(i+1).getTitle()}</a></td>
				</c:if>
			</tr>
		
			<tr>
				<c:if test="${list.size() > i}">
					<td>${list.get(i).getMemberId() }</td>
				</c:if>
				<c:if test="${list.size() > i+1}">
					<td>${list.get(i+1).getMemberId() }</td>
				</c:if>
			</tr>		
		</c:forEach>
	</table>
</div> --%>

 <div class="container">

      <!-- Page Heading -->
      <h1 class="my-4" align="center">웹진 ${sessionId }</h1>

		<c:if test="${list.size() == 0 }">
				<h1>웹진 페이지 공사중입니다.</h1>
		</c:if>
	 
      <div class="row">
      	<c:forEach var="i" begin="0" end="${list.size()-1 }" step="1">
	        <div class="col-lg-6 portfolio-item">
	          <div class="card h-100">
	            <a href="BoardContent.do?boardNo=${list.get(i).getBoardNo() }"><img class="card-img-top" src="/bmw/img/${saveFiles.get(i).getSavedFileName()}" alt="" width="600" height="350"></a>
	            <div class="card-body">
	              <h4 class="card-title">
	                <a href="BoardContent.do?boardNo=${list.get(i).getBoardNo() }">${list.get(i).getTitle()}</a>
	              </h4>
	              <h5>${list.get(i).getMemberId() }</h5>
	            </div>
	          </div>
	        </div>
        </c:forEach> 
      </div>
     
      <!-- /.row -->

      <!-- Pagination -->
   <!--    <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">3</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul> -->

  </div>


<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>