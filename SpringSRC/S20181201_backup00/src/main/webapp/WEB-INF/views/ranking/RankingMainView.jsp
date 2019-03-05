<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../partials/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category List View</title>
<style>
 .fakeimg {
      height: 200px;
      background: #aaa;
  }
</style>
</head>
<body>
<header><%@ include file="../partials/header.jsp" %></header>
${ssMap.get("nickName") }
${ssMap.get("sex") }
${ssMap.get("birth") }
${ssMap.get("memberId") }
${ssMap.get("skinType") }
${ssMap.get("email") }
${ssMap.nickName }
<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-4">
      <h4>카테고리별</h4>
      <c:forEach var="parList" items="${parList}">
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link" href="RankingType.do?groupName=${parList.name}">${parList.name}</a>
        </li>
      </ul>
      </c:forEach>
      <br>
      
      <h4>피부타입별</h4>
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link active" href="RankingType.do?groupName=건성">건성</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="RankingType.do?groupName=중성">중성</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="RankingType.do?groupName=지성">지성</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="RankingType.do?groupName=복합성">복합성</a>
        </li>
      </ul>
      <br>
      
      <h4>연령별</h4>
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link" href="RankingType.do?groupName=10대">10대</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="RankingType.do?groupName=20대">20대</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="RankingType.do?groupName=30대">30대</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="RankingType.do?groupName=40대">40대 이상</a>
        </li>
      </ul>
      <br>
     
    <hr class="d-sm-none">
    </div>
    
    <div class="col-sm-8">
      <p>회원님의 데이터를 분석하여 추천하는 제품입니다</p>
      
      <h1>20대 여성 선호제품</h1>
      <div class="fakeimg"></div>
      <br>
      
      <h1>민감성을 위한 제품</h1>
      <div class="fakeimg"></div>
      <br>
      
      <h1>이런 제품은 어떠세요?</h1>
      <div class="fakeimg"></div>
      <br>
      
    </div>
  </div>
</div>


<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>
