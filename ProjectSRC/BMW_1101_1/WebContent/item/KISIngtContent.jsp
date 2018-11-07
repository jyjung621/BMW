<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ingredient View</title>
<script type="text/javascript">
	function del_chk() {
		if (confirm("성분을 삭제 하시겠습니까?") == true) {
			location.href="IngtDeletePro.do?ingredientNo=${ingt.ingredientNo}&pageNum=${pageNum}";
		} else {
			return;
		}
	}
</script>
</head>
<body>
	<table border="1">
		<caption>
			<h2>성분 상세내역</h2>
		</caption>
		<tr>
			<td width="50">성분 번호</td>
			<td>${ingt.ingredientNo}</td>
		</tr>
		<tr>
			<td>성분명</td>
			<td>${ingt.name}</td>
		</tr>
		<tr>
			<td>위험등급</td>
			<td>${ingt.grade}</td>
		</tr>
		<tr>
			<td>20가지 주의성분</td>
			<td>${ingt.danger20}</td>
		</tr>
		<tr>
			<td>알레르기 주의성분</td>
			<td>${ingt.dangerAllergy}</td>
		</tr>
		<tr>
			<td>피부타입별 특이성분</td>
			<td>${ingt.specialyType}</td>
		</tr>
		<tr>
			<td>기능성 성분 여부</td>
			<td>${ingt.functional}</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="수정"
				onclick="location.href='IngtUpdateForm.do?ingredientNo=${ingt.ingredientNo}&pageNum=${pageNum}'">
				<input type="button" value="삭제" onClick="del_chk()">
				<input type="button" value="목록"
				onclick="location.href='IngtList.do?pageNum=${pageNum}'"></td>
		</tr>
	</table>

</body>
</html>