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


<link rel="stylesheet"
	href="http://localhost:8282/BMW/maincss/assets/css/main.css" />
<!-- 추가  -->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.theme.min.css"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.css"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- css 추가 -->
<style type="text/css">
.slider-item {
	border: 1px solid #E1E1E1;
	border-radius: 5px;
	background: #ffffff;
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
				<h2 style="top: 0px;">유저들이 평가한 TOP8</h2>	
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
											<img src="images/250x200/untitled.png" class="img-responsive"
												alt="a" />
										</div>

										<div class="slider-main-detail">

											<div class="slider-detail">

												<div class="product-detail">
													<h5>1</h5>
													<h5 class="detail-price">$187.87</h5>
												</div>
											</div>

											<div class="cart-section">
												<div class="row">
													<!-- 별점 -->
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<i class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i>
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
											<img src="images/250x200/1.png" class="img-responsive"
												alt="a" />
										</div>
										<div class="slider-main-detail">
											<div class="slider-detail">
												<div class="product-detail">
													<h5>2</h5>
													<h5 class="detail-price">$187.87</h5>
												</div>
											</div>
											<div class="cart-section">
												<div class="row">
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<i class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i>
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
											<img src="images/250x200/2.png" class="img-responsive"
												alt="a" />
										</div>
										<div class="slider-main-detail">
											<div class="slider-detail">
												<div class="product-detail">
													<h5>3</h5>
													<h5 class="detail-price">$187.87</h5>
												</div>
											</div>
											<div class="cart-section">
												<div class="row">
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<i class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i>
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
											<img src="images/250x200/3.png" class="img-responsive"
												alt="a" />
										</div>
										<div class="slider-main-detail">
											<div class="slider-detail">
												<div class="product-detail">
													<h5>4</h5>
													<h5 class="detail-price">$187.87</h5>
												</div>
											</div>
											<div class="cart-section">
												<div class="row">
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<i class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i>
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
											<img src="images/250x200/4.png" class="img-responsive"
												alt="a" />
										</div>
										<div class="slider-main-detail">
											<div class="slider-detail">
												<div class="product-detail">
													<h5>5</h5>
													<h5 class="detail-price">$187.87</h5>
												</div>
											</div>
											<div class="cart-section">
												<div class="row">
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<i class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i>
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
											<img src="images/250x200/5.png" class="img-responsive"
												alt="a" />
										</div>
										<div class="slider-main-detail">
											<div class="slider-detail">
												<div class="product-detail">
													<h5>6</h5>
													<h5 class="detail-price">$187.87</h5>
												</div>
											</div>
											<div class="cart-section">
												<div class="row">
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<i class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i>
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
											<img src="images/250x200/6.png" class="img-responsive"
												alt="a" />
										</div>
										<div class="slider-main-detail">
											<div class="slider-detail">
												<div class="product-detail">
													<h5>7</h5>
													<h5 class="detail-price">$187.87</h5>
												</div>
											</div>
											<div class="cart-section">
												<div class="row">
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<i class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i>
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
											<img src="images/250x200/7.png" class="img-responsive"
												alt="a" />
										</div>
										<div class="slider-main-detail">
											<div class="slider-detail">
												<div class="product-detail">
													<h5>8</h5>
													<h5 class="detail-price">$187.87</h5>
												</div>
											</div>
											<div class="cart-section">
												<div class="row">
													<div class="col-md-12 col-sm-12 col-xs-6 review">
														<i class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i>
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




			<!-- 			<header>
				<h2>유저들이 뽑은 랭킹</h2>
				<p>A responsive template by HTML5 UP</p>
			</header> -->

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
											<a href="'boardContent.do?boardNo=1&pageNum=1'"
												class="image featured">
												<img src="images/535X250/11.png" alt="" /></a>
											<header>
												<h3>
													<a href='boardContent.do?boardNo=1&pageNum=1'>나의 퍼스널 컬러는 무엇일까?</a>
													</td>
												</h3>
												<p>Editor H</p>
											</header>
											<a href='boardContent.do?boardNo=1&pageNum=1'><p>타고난 개인의 신체
													컬러를 말하는 퍼스널 컬러! 맞지 않는 톤을 사용할 경우 피부결이 거칠어 보이고 투명도가 떨어져보이게
													된다. 따라서 자신의 신체 색을 아는 것은 메이크업할 때 중요한 요소 중 하나. 연예인이 쓴다는 아이템을
													무작정 구매하는 것 보다 본인의 피부 톤에 대한 정확한 파악이 우선일 것.</p></a>
											<footer>
												<ul class="actions">
													<li><a href="'boardContent.do?boardNo=1&pageNum=1'"
														class="button icon fa-file-text">Continue Reading</a></li>
													<li><a href="#" class="button alt icon fa-comment">
															comments</a></li>
												</ul>
											</footer>
										</section>
									</div>
									<div class="col-6 col-12-small">
										<section class="box">
											<a href="'boardContent.do?boardNo=2&pageNum=1'"
												class="image featured"><img
												src="images/535X250/22.png" alt="" /></a>
											<header>
												<h3>
													<a href='boardContent.do?boardNo=2&pageNum=1'> 면접 프리패스 메이크업 </a>
													</td>
												</h3>
												<p>Editor J</p>
											</header>
											<a href='boardContent.do?boardNo=2&pageNum=1'><p>
											바야흐로 면접의 시즌이 돌아왔다. 자신있는 눈빛, 신뢰를 주는 목소리, 실력을 증명하는 경력.
											하지만 수 많은 면접을 겪어봐도 매번 긴장되는 것이 취준생의 마음. 
											많은 것을 준비하고도 왠지 자신감이 생기지 않는다면? 깔끔하고 신뢰를 주는 인상으로 만들어주는
											면접 프리패스 메이크업을 한 번 알아보자!
											</p></a>
											<footer>
												<ul class="actions">
													<li><a href="'boardContent.do?boardNo=2&pageNum=1'"
														class="button icon fa-file-text">Continue Reading</a></li>
													<li><a href="#" class="button alt icon fa-comment">
															comments</a></li>
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