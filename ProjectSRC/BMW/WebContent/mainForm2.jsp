<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMW에 오신 것을 환영합니다.</title>

<!-- 기존 -->

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>


<link rel="stylesheet" href="/BMW/maincss/assets/css/main.css" />
<!-- 추가  -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.theme.min.css"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.css"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- css 추가 -->
<style type="text/css">
.slider-item {
	border: 1px solid #E1E1E1;
	border-radius: 5px;
	background: #FFF;
}

.slider-item .slider-image img {
	margin: 0 auto;
	width: 100%;
}

.slider-item .slider-main-detail {
	padding: 10px;
	border-radius: 0 0 5px 5px;
}

.slider-item:hover .slider-main-detail {
	background-color: #ffffff;
}

.slider-item .price {
	float: left;
	margin-top: 5px;
}

.slider-item .price h5 {
	margin: 0;
}

.detail-price {
	color: #219FD1;
}

.slider-item .slider-main-detail .rating {
	color: #777;
}

.slider-item .rating {
	float: none;
	font-size: 17px;
	text-align: right;
	line-height: 52px;
	margin-bottom: 10px;
	height: 52px;
}

.slider-item .btn-add {
	width: 50%;
	float: none;
	border-right: 1px solid #E1E1E1;
}

.slider-item .btn-details {
	width: 50%;
	float: none;
}

.controls {
	margin-top: 20px;
}

.btn-info, .btn-info:visited, .btn-info:hover {
	background-color: #d52349;
	border-color: #d52349;
}

.btn-info {
	margin-left: 5px;
}

.slider-main-detail:hover {
	background-color: #ffffff;
}

.AddCart {
	margin: 0px;
	padding: 5px;
	border-radius: 2px;
	margin-right: 10px;
}

.review {
	margin-bottom: 5px;
	padding-top: 5px;
}

banner0 {
	margin: 0 0 1.5em 0;
}

banner0>p {
	display: block;
	font-style: italic;
	margin: 0.5em 0 0 0;
	padding-bottom: 0.5em;
}

banner0.major {
	position: relative;
	text-align: center;
	border-bottom: solid 1px #ccc;
	top: 1em;
	margin: 0 0 3em 0;
}

banner0.major h2 {
	background: none;
	position: relative;
	top: -0.65em;
	display: inline;
	margin: 0;
	padding: 0 1em 0 1em;
}


.ellipsis-multi {
	  width:470px;
	  overflow: hidden;
	  text-overflow: ellipsis;
	  display: -webkit-box;
	  -webkit-line-clamp: 3; /* 라인수 */
	  -webkit-box-orient: vertical;
	  word-wrap:break-word; 
	  line-height: 1.2em;
	  height: 3.6em; /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
	}



</style>





</head>
<body style="margin: auto;">
	<!-- <header0></header0> -->

	<%@ include file="header.jsp"%>
	<div id="page-wrapper">

<!-- Banner -->
		<section id="banner" style="background-color: #ffffff; margin-top: 0px; padding-top: 44px; padding-bottom: 70px;
		background-image: url('images/rankingBanner/1337x573.png');">
			<banner0 class="major">
				<h2 style="top: 0px;"><img src="images/rankingBanner/ranking650.png"></h2>	
			</banner0>

			<div class="container">
				<div class="row">

					<!-- ITEM SLIDER 구조 -->
					<div class="col-md-6 col-sm-6 col-xs-12"></div>
					<!-- prev. next. 버튼 -->
					<div class="col-md-12 col-sm-6 col-xs-6 hidden-xs">
						<div class="controls pull-right">
							<a class="left fa fa-chevron-left btn btn-info "
								href="#carousel-example" data-slide="prev"></a> <a
								class="right fa fa-chevron-right btn btn-info"
								href="#carousel-example" data-slide="next"></a>
						</div>
					</div>
				</div>
				<br>

				<!-- slide (carousel) -->
				<div id="carousel-example" class="carousel slide hidden-xs"
					data-ride="carousel" data-type="multi">
					<div class="carousel-inner">
						<div class="item active">
							<div class="row">


								<!-- 1번 아이템 -->
								<div class="col-md-3 col-sm-3 col-xs-12">
									<div class="slider-item">
										<div class="slider-image">
											<a href="/BMW/item/ItemContent.do?itemNo=${list.get(0).getItemNo() }">
												<img src="/BMW/images/250x200/${list.get(0).getName() }.png"
												width="250" height="200" class="img-responsive" alt="a" />
											</a>
										</div>

										<div class="slider-main-detail">

											<div class="slider-detail">

												<div class="product-detail">
													<h5>${list.get(0).getName() }</h5>
													<h5 class="detail-price">${list.get(0).getPrice() }원</h5>
												</div>
											</div>

											<div class="cart-section">
												<div class="row">
													<!-- 별점 -->
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<c:choose>
															<c:when test="${list.get(0).getRating() >= 4.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(0).getRating() >= 3.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(0).getRating() >= 2.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(0).getRating() >= 1.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(0).getRating() >= 0.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
														</c:choose>
													</div>

													<!-- 카트 담기 -->
													<!--  <div class="col-md-6 col-sm-12 col-xs-6">
												 <a href="#" class="AddCart btn btn-info"><i
													class="fa fa-shopping-cart" aria-hidden="true"></i> Add To
													Cart</a>
											</div>  -->
												</div>
											</div>
										</div>
									</div>
								</div>


								<!-- 2번 아이템 -->

								<div class="col-md-3 col-sm-3 col-xs-12">
									<div class="slider-item">
										<div class="slider-image">
											<a
												href="/BMW/item/ItemContent.do?itemNo=${list.get(1).getItemNo() }">
												<img src="/BMW/images/250x200/${list.get(1).getName() }.png"
												width="250" height="200" class="img-responsive" alt="a" />
											</a>
										</div>
										<div class="slider-main-detail">
											<div class="slider-detail">
												<div class="product-detail">
													<h5>${list.get(1).getName() }</h5>
													<h5 class="detail-price">${list.get(1).getPrice() }원</h5>
												</div>
											</div>
											<div class="cart-section">
												<div class="row">
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<c:choose>
															<c:when test="${list.get(1).getRating() >= 4.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(1).getRating() >= 3.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(1).getRating() >= 2.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(1).getRating() >= 1.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(1).getRating() >= 0.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
														</c:choose>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>


								<!-- 3번 아이템 -->
								<div class="col-md-3 col-sm-3 col-xs-12">
									<div class="slider-item">
										<div class="slider-image">
											<a
												href="/BMW/item/ItemContent.do?itemNo=${list.get(2).getItemNo() }">
												<img src="/BMW/images/250x200/${list.get(2).getName() }.png"
												width="250" height="200" class="img-responsive" alt="a" />
											</a>
										</div>
										<div class="slider-main-detail">
											<div class="slider-detail">
												<div class="product-detail">
													<h5>${list.get(2).getName() }</h5>
													<h5 class="detail-price">${list.get(2).getPrice() }원</h5>
												</div>
											</div>
											<div class="cart-section">
												<div class="row">
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<c:choose>
															<c:when test="${list.get(2).getRating() >= 4.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(2).getRating() >= 3.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(2).getRating() >= 2.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(2).getRating() >= 1.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(2).getRating() >= 0.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
														</c:choose>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- 4번 아이템 -->
								<div class="col-md-3 col-sm-3 col-xs-12">
									<div class="slider-item">
										<div class="slider-image">
											<a
												href="/BMW/item/ItemContent.do?itemNo=${list.get(3).getItemNo() }">
												<img src="/BMW/images/250x200/${list.get(3).getName() }.png"
												width="250" height="200" class="img-responsive" alt="a" />
											</a>
										</div>
										<div class="slider-main-detail">
											<div class="slider-detail">
												<div class="product-detail">
													<h5>${list.get(3).getName() }</h5>
													<h5 class="detail-price">${list.get(3).getPrice() }원</h5>
												</div>
											</div>
											<div class="cart-section">
												<div class="row">
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<c:choose>
															<c:when test="${list.get(3).getRating() >= 4.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(3).getRating() >= 3.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(3).getRating() >= 2.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(3).getRating() >= 1.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(3).getRating() >= 0.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
														</c:choose>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>


						<!-- 다음 아이템 슬라이드 시작 -->
						<div class="item">
							<div class="row">

								<!-- 5번 아이템 -->
								<div class="col-md-3 col-sm-3 col-xs-12">
									<div class="slider-item">
										<div class="slider-image">
											<a
												href="/BMW/item/ItemContent.do?itemNo=${list.get(4).getItemNo() }">
												<img src="/BMW/images/250x200/${list.get(4).getName() }.png"
												width="250" height="200" class="img-responsive" alt="a" />
											</a>
										</div>
										<div class="slider-main-detail">
											<div class="slider-detail">
												<div class="product-detail">
													<h5>${list.get(4).getName() }</h5>
													<h5 class="detail-price">${list.get(4).getPrice() }원</h5>
												</div>
											</div>
											<div class="cart-section">
												<div class="row">
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<c:choose>
															<c:when test="${list.get(4).getRating() >= 4.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(4).getRating() >= 3.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(4).getRating() >= 2.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(4).getRating() >= 1.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(4).getRating() >= 0.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
														</c:choose>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 6번 아이템 -->
								<div class="col-md-3 col-sm-3 col-xs-12">
									<div class="slider-item">
										<div class="slider-image">
											<a
												href="/BMW/item/ItemContent.do?itemNo=${list.get(5).getItemNo() }">
												<img src="/BMW/images/250x200/${list.get(5).getName() }.png"
												width="250" height="200" class="img-responsive" alt="a" />
											</a>
										</div>
										<div class="slider-main-detail">
											<div class="slider-detail">
												<div class="product-detail">
													<h5>${list.get(5).getName() }</h5>
													<h5 class="detail-price">${list.get(5).getPrice() }원</h5>
												</div>
											</div>
											<div class="cart-section">
												<div class="row">
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<c:choose>
															<c:when test="${list.get(5).getRating() >= 4.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(5).getRating() >= 3.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(5).getRating() >= 2.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(5).getRating() >= 1.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(5).getRating() >= 0.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
														</c:choose>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- 7번 아이템 -->
								<div class="col-md-3 col-sm-3 col-xs-12">
									<div class="slider-item">
										<div class="slider-image">
											<a
												href="/BMW/item/ItemContent.do?itemNo=${list.get(6).getItemNo() }">
												<img src="/BMW/images/250x200/${list.get(6).getName() }.png"
												width="250" height="200" class="img-responsive" alt="a" />
											</a>
										</div>
										<div class="slider-main-detail">
											<div class="slider-detail">
												<div class="product-detail">
													<h5>${list.get(6).getName() }</h5>
													<h5 class="detail-price">${list.get(6).getPrice() }원</h5>
												</div>
											</div>
											<div class="cart-section">
												<div class="row">
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<c:choose>
															<c:when test="${list.get(6).getRating() >= 4.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(6).getRating() >= 3.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(6).getRating() >= 2.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(6).getRating() >= 1.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(6).getRating() >= 0.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
														</c:choose>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- 8번 아이템 -->
								<div class="col-md-3 col-sm-3 col-xs-12">
									<div class="slider-item">
										<div class="slider-image">
											<a
												href="/BMW/item/ItemContent.do?itemNo=${list.get(7).getItemNo() }">
												<img src="/BMW/images/250x200/${list.get(7).getName() }.png"
												width="250" height="200" class="img-responsive" alt="a" />
											</a>
										</div>
										<div class="slider-main-detail">
											<div class="slider-detail">
												<div class="product-detail">
													<h5>${list.get(7).getName() }</h5>
													<h5 class="detail-price">${list.get(7).getPrice() }원</h5>
												</div>
											</div>
											<div class="cart-section">
												<div class="row">
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<c:choose>
															<c:when test="${list.get(7).getRating() >= 4.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(7).getRating() >= 3.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(7).getRating() >= 2.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(7).getRating() >= 1.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
															<c:when test="${list.get(7).getRating() >= 0.5 }">
																<i class="fa fa-star" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:when>
														</c:choose>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</section>

		<!-- Main -->
			<section id="main">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<!-- Blog -->
							<section>
								<header class="major">
									<h2>Beauty Plus</h2>
								</header>

								<!-- Main -->
								<section id="main">
									<div class="row">
										<div class="col-6 col-12-small">
											<section class="box">
												<a href='/BMW/board/boardContent.do?boardNo=${list2.get(i).getBoardNo() }'
													class="image featured"> <img
													src="/BMW${savefiles.get(i).getFilePath() }/${savefiles.get(i).getSavedFileName()}" alt="" width="570" height="272" alt="" /></a>
												<header>
													<h3>
														<a href='/BMW/board/boardContent.do?boardNo=${list2.get(i).getBoardNo() }'>${list2.get(i).getTitle() }</a>
														</td>
													</h3>
													<p>${list2.get(i).getMemberId()}</p>
												</header>
												<a href='/BMW/board/boardContent.do?boardNo=${list2.get(i).getBoardNo() }'>
												<p class="ellipsis-multi">${list2.get(i).getContent()}</p></a>
												<footer>
													<ul class="actions">
														<li><a href='/BMW/board/boardContent.do?boardNo=${list2.get(i).getBoardNo() }'
															class="button icon fa-file-text">Continue Reading</a></li>
													</ul>
												</footer>
											</section>
										</div>
										<div class="col-6 col-12-small">
											<section class="box">
												<a href='/BMW/board/boardContent.do?boardNo=${list2.get(i+1).getBoardNo() }'
													class="image featured"><img src="/BMW${savefiles.get(i+1).getFilePath() }/${savefiles.get(i+1).getSavedFileName()}" alt="" width="570" height="272" alt=""
													 /></a>
												<header>
													<h3>
														<a href='/BMW/board/boardContent.do?boardNo=${list2.get(i+1).getBoardNo() }'> ${list2.get(i+1).getTitle() } </a>
														</td>
													</h3>
													<p>${list2.get(i+1).getMemberId()}</p>
												</header>
												<a href='/BMW/board/boardContent.do?boardNo=${list2.get(i+1).getBoardNo() }'>
												<p class="ellipsis-multi">
														${list2.get(i+1).getContent()}</p></a>
												<footer>
													<ul class="actions">
														<li><a href="/BMW/board/boardContent.do?boardNo=${list2.get(i+1).getBoardNo() }"
															class="button icon fa-file-text">Continue Reading</a></li>
													</ul>
												</footer>
											</section>
										</div>
									</div>
								</section>
						</div>
					</div>
				</div>
			</section>

	</div>


	<!-- <footer0></footer0> -->
	<%@ include file="footer.jsp"%>
</body>
</html>