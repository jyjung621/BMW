<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../partials/head.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
CKEDITOR.config.width = '1000px';
CKEDITOR.config.height = '600px';
$(function(){
	CKEDITOR.replace('content',{
		filebrowserUploadUrl: '${pageContext.request.contextPath }/adm/fileupload.do'
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
<header><%@ include file="../partials/header.jsp" %></header>

<form action="BoardUpdate.do" method="post" name="frm">
	<input type="hidden" name="boardNo" value="${SDBBoard.boardNo }">
	<table>
		<tr>
			<th>카테고리</th>
			<td>
				<select name="boardCategory">
					<option value="자유">자유</option>
					<option value="정보">정보</option>
					<option value="QnA">QnA</option>
				</select>
			</td>
			<th>제목</th>
			<td>
				<input type="text" name="title" required="required" value="${SDBBoard.title }">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3">
				<textarea rows="20" cols="40" name="content">${SDBBoard.content }</textarea>
			</td>
		</tr>	
		<tr>
			<td>
				<input type="submit" value="확인">
				<input type="button" value="취소" onclick="history.go(-1)">
			</td>
		</tr>	
	</table>
</form>

<footer><%@ include file="../partials/footer.jsp" %></footer>
</body>
</html>