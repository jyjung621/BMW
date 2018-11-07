<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style2.css">
</head>
<body>
	<form >
		 <input type ="hidden" name ="pageNum" value="1">
			<table >
			
				<tr><td>
					<div class ="header">
						<div class = "title">
							<h1>
								<a href="../index.jsp" id="b" class="titleN">BMW</a>
							</h1>
						</div>
						<div class="title2">
							
							<a href="KDWlist.do?pageNum=${pageNum}" id="w" class="content">회원 리스트</a> 
						<a href="../item/itemIndex.jsp?pageNum=${pageNum}" id="w" class="content">제품 리스트</a> 
						<a href="../item/IngtList.do?pageNum=${pageNum}" id="w" class="content">성분리스트</a> 
						<a href="../board/boardList.do?pageNum=${pageNum}" id="w" class="content">게시판 관리</a>
						</div>
					</div>
				</td></tr>
			</table>
	</form>
</body>
</html>