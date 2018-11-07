<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="styLesheet" href="style.css" type="text/css">
<style type="text/css">
table {
	width: 100%;
} 
</style>



</head>
<body>

<form>
	<table>
		<tr><td>
		 <div>
				<a href="KDWlist.do?pageNum=${pageNum}">회원 리스트</a><p>
				<a href="../item/ItemList.do?pageNum=${pageNum}">제품 리스트</a><p> 
				<a href="../item/IngtList.do?pageNum=${pageNum}">성분리스트</a><p> 
				<a href="../board/boardList.do?boardCategory=자유">게시판 관리</a>
		</div>
		</td></tr>
	</table>
	<script type="text/javascript">
	function searchCheck(frm){
	       
	       
        if(frm.keyWord.value ==""){
            alert("검색 단어를 입력하세요.");
            frm.keyWord.focus();
            return;
        }
        frm.submit();      
    }	
	</script>
		<select name="keyField">
	                <option value="0"> ----선택----</option>
	                <option value="memberId">아이디</option>
	                <option value="name">이름</option>
	                <option value="address">주소</option>  
        </select>
        <input type="text" name="keyWord" />
        <input type="button" value="검색" onclick="KDWlist.jsp" />

	
	<h2>회원정보</h2>
	<table>	
		<tr>
			<th>번호</th><th>아이디</th><th>닉네임</th><th>이름</th>	
			<th>생년월일</th><th>성별</th><th>피부타입</th>
			<th>피부고민</th><th>등급</th><th>이메일</th>
			<th>isEmail</th><th>전화</th><th>주소</th>
			<th>질문</th><th>답</th><th>joinDate</th><th>regDate</th>
			
		</tr>
		
		<c:if test="${totCnt > 0 }">
			<c:forEach var="member" items="${list}">
				<tr>
					<td>${startNum}</td>
					<%-- <td class="left" width="200">
						
						<a href='content.do?num=${member.num }&pageNum=${currentPage}'>
							${member.memberId }</a>
					</td> --%>
					<td>${member.memberId }</td>
					<td>${member.nickName }</td>
					<td>${member.name }</td>
					<td>${member.birth}</td>
					<!--성별로 구분  -->
					<td><script type="text/javascript">
						sexArray = new Array("남성","여성")
							i= ${member.sex}
							{
								document.write(sexArray[i]);
							}
					</script></td>
					<!--피부타입별로 구분  -->
					<td><script type="text/javascript">
						skintypeArray = new Array("건성","중성","지성","복합성")
							i= ${member.skinType}
							{
								document.write(skintypeArray[i]);
							}
					</script></td>
					<!--피부고민별로 구분  -->
					<td><script type="text/javascript">
					skinComplexArray = new Array("해당없음","아토피","여드름","민감성")
							i= ${member.skinComplex}
							{
								document.write(skinComplexArray[i]);
							}
					</script></td>
					<!--어느 아이디의 등급을 바꿀지 구분을 하기위해 memberId값을 가지고 왔다.  -->
					<td><a href='KDWupdateForm.do?memberId=${member.memberId }'>
					<!--등급별로 구분  -->
					<script type="text/javascript">
						gradeArray = new Array("관리자","판매자","사용자","승인대기")
							i= ${member.grade}
							{
								document.write("["+i+"]="+gradeArray[i]);
							}
					</script>
					</a></td>					
					<td>${member.email }</td>
					<!--이메일 수신확인여부  -->
					<td><script type="text/javascript">
					isEmailArray = new Array("수신거부","수신")
							i= ${member.isEmail}
							{
								document.write(isEmailArray[i]);
							}
					</script></td>
					<td>${member.phone }</td>
					<td>${member.address }</td>
					<td>${member.question }</td>
					<td>${member.answer }</td>
					<td>${member.joinDate }</td>
					<td>${member.regDate }</td>
					
				</tr>
				<c:set var="startNum" value="${startNum -1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt ==0 }">
			<tr>
				<td colspan=7>데이터가 없네 </td>
			</tr>	 
		</c:if>
	</table>	
	
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
</form>
</body>
</html>