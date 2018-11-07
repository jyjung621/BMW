<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>Category Item List</title>
<style type="text/css">
	table { width: 100%;}
	tr{background-color: #eee; }
</style>

<script type="text/javascript">

	$(function() {
		$("itemListShow").load('ItemList.do');
	});
	
	function changeParent() {
		$.ajax({
			url : '/BMW/ItemCateSel.do',
			data : {
				optionSel : $('#category option:selected').val()
			},
			dataType : 'json',
			success : function(data) {
				console.log("Parent 데이터 : " + data);
				
				let html = "";
				$.each(data, function(index, comm) {
					html += "<option value='" + comm.categoryNo + "'>" + comm.name + "</option>";					
				})
				$('#category2').html(html);
			}
		});
	}

	function changChile() {
		console.log('실행 categoryChild -> ' + $('#category2 option:selected').val());
		var data = $('#category2 option:selected').val();

		$('itemListShow').load("ItemList.do?cateNum="+data);

	}
	
	function changeList() {
		console.log('분류방법 -> ' + $('#sorting option:selected').val());
		var cate = $('#category2 option:selected').val();
		var sort = $('#sorting option:selected').val();
		console.log('cate -> ' + cate + '  sort -> ' + sort);
		$('itemListShow').load("ItemList.do?cateNum="+cate+"&sortName="+sort);
	}
	
	function changPage(cateNum, pageNum) {
		$('itemListShow').load("ItemList.do?cateNum="+cateNum+"&pageNum="+pageNum);
	}

</script>
</head>
<body>
	<hr>
	<div align="center">
		<label for="category">카테고리 분류</label>
		<select id="category" style="width:100px;height:30px;" onChange="changeParent();">
			<option value="">전체</option>
			<c:forEach var="cate" items="${cateList}">							
				<option value="${cate.categoryNo}" <c:if test="${cate.name == cateInfo.parent }"> selected="selected"</c:if>>${cate.name}</option>
			</c:forEach>			
		</select>
		<label for="category2"> > </label>
		<select id="category2" name="category2" style="width:100px;height:30px;" onchange="changChile();">	
			<c:forEach var="childList" items="${childList}">
				<option value="${childList.categoryNo}" <c:if test="${childList.categoryNo == cateInfo.categoryNo}"> selected="selected"</c:if>>${childList.name}</option>
			</c:forEach>
		</select>
	</div>
	<div align="right">
		<select id="sorting" style="width:70px;height:20px;" onchange="changeList();">
			<option value="1">이름순</option>
			<option value="2">랭킹순</option>
			<option value="3">추천순</option>
			<option value="4">등록순</option>
		</select>
	</div>
	<hr>
	
	<itemListShow></itemListShow>

	
</body>
</html>