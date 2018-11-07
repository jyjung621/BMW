<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<link rel="stylesheet"
	href="http://localhost:8282/BMW/maincss/assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>Category Item List</title>
<style type="text/css">
	table { width: 100%;}
	tr{background-color: #eee; }
</style>

<script type="text/javascript">

	$(function() {
		$("itemListShow").load('ItemList.do?cateNum=${cateNum}&sortName=${sotrNum}&pageNum=${pageNumIC}');
	});
	
	function changeParent() {
		console.log('부모 카테고리 번호 --> ' + $('#category option:selected').val());
		var parentCateNum = $('#category option:selected').val();
		if(parentCateNum === '0') {
			let html = "<option value='0'></option>";
			$('#category2').html(html);
			$('itemListShow').load("ItemList.do?cateNum="+parentCateNum);
		} else {
			$.ajax({
				url : 'ItemCateSel.do',
				data : {
					optionSel : $('#category option:selected').val()
				},
				dataType : 'json',
				success : function(data) {
					console.log("Parent 데이터 : " + data);
					
					let html = "<option value='0'>선택</option>";
					$.each(data, function(index, comm) {
						html += "<option value='" + comm.categoryNo + "'>" + comm.name + "</option>";					
					})
					$('#category2').html(html);
				}
			});	
		}
	}

	function changChile() {
		console.log('실행 categoryChild -> ' + $('#category2 option:selected').val());
		var data = $('#category2 option:selected').val();
		if(data != "0"){
			$('itemListShow').load("ItemList.do?cateNum="+data);			
		}
	}
	
	function changeList() {
		console.log('분류방법 -> ' + $('#sorting option:selected').val());
		var cate = $('#category2 option:selected').val();
		var sort = $('#sorting option:selected').val();
		console.log('cate -> ' + cate + '  sort -> ' + sort);
		$('itemListShow').load("ItemList.do?cateNum="+cate+"&sortName="+sort);
	}
	
	// 검색시 keyword 추가해서 목록 뿌려주기
	function changPage(cateNum, pageNum, keyword) {
		if (keyword == null || keyword == "") {
			$('itemListShow').load("ItemList.do?cateNum="+cateNum+"&pageNum="+pageNum);
		} else {
		$('itemListShow').load("ItemList.do?cateNum="+cateNum+"&pageNum="+pageNum+"&keyword="+keyword);			
		}
	}
	
	function searchCheck(frm){
		var keyword = $('#keyWord').val();
		console.log('keyword--> ' + keyword);
		if (frm.keyWord.value ==""){
	        alert("검색 단어를 입력하세요.");
	        frm.keyWord.focus();
	        return;
	    }
		$('itemListShow').load('ItemList.do?keyword=' + frm.keyWord.value);
	    
	 }

</script>
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
						<section>
							<header class="major" style="margin-bottom: 0px;">
								<h2>제품 리스트</h2>
							</header>
						</section>
	<hr>
	<div align="center">
		<label for="category">카테고리 분류</label>
		<select id="category" style="width:100px;height:30px;" onChange="changeParent();">
			<option value="0">전체</option>
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
			<option value="2">평점순</option>
			<option value="1">이름순</option>
			<option value="3">추천순</option>
			<option value="4">등록순</option>
		</select>
	</div>
	<hr>
	<itemListShow></itemListShow>
	<!-- 	</form> -->
		</section>

	</div>
	</div>
	</div>
	</section>
	</div>


	<!-- <footer0></footer0> -->
<%@ include file="../footer.jsp"%>
	
</body>
</html>