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
		$("itemPageShow").load('ItemList.do');
// 		$("itemPageShow").load('ItemCategoryFooter.do');
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
// 		console.log('data -> ' + data);
		$('itemPageShow').load("ItemList.do?cateNum="+data);
// 		$('itemPageShow').load("ItemCategoryFooter.do?cateNum="+data);
	}
	
	function changeList() {
		console.log('분류방법 -> ' + $('#sorting option:selected').val());
		var cate = $('#category2 option:selected').val();
		var sort = $('#sorting option:selected').val();
		console.log('cate -> ' + cate + '  sort -> ' + sort);
// 		$('itemSortShow').load("ItemCategoryFooter.do?cateNum="+cate+"&sortName="+sort);
		$('itemSortShow').load("ItemCategoryList.do?cateNum="+cate+"&sortName="+sort);
	}
	
	function changPage(cateNum, pageNum) {
// 		var startRow = (num - 1) * ${pageSize} + 1;
// 		var endRow = startRow + ${pageSize} - 1;
		
// 		$("itemListShow").load("ItemCategoryList.do?cateNum=${categoryNo}&sortName=${sortName}&startRow="+startRow+"&endRow="+endRow+"&pageNumIC=" + num);
		$('itemPageShow').load("ItemList.do?cateNum="+cateNum+"&pageNum="+pageNum);
	}
	
	function test(num) {
		$('testtest').load("./item/aaa.jsp?num="+num);
	}
</script>
</head>
<body>
	<h3>TEST영역</h3>
	<input type="button" value="111" onclick="test(1)">
	<testtest></testtest>
	<hr>
	<div align="center">
		<label for="category">카테고리 분류</label>
		<select id="category" style="width:100px;height:30px;" onChange="changeParent();">
			<option value="">전체</option>
			<c:forEach var="cate" items="${cateList}">							
				<option value="${cate.categoryNo}" >${cate.name}</option>
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
			<option value="name">이름순</option>
			<option value="rating">랭킹순</option>
			<option value="likecnt">추천순</option>
			<option value="itemno">등록순</option>
		</select>
	</div>
	<hr>
	
	<itemListShow></itemListShow>
	<itemPageShow></itemPageShow>
	<hr>
	<itemSortShow></itemSortShow>
	
</body>
</html>