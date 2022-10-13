<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap4" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="../../css/owl.carousel.min.css">
<link rel="stylesheet" href="../../css/owl.theme.default.min.css">
<link rel="stylesheet" href="../../css/jquery.fancybox.min.css">
<link rel="stylesheet" href="../../fonts/icomoon/style.css">
<link rel="stylesheet" href="../../fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../../css/daterangepicker.css">
<link rel="stylesheet" href="../../css/aos.css">
<link rel="stylesheet" href="../../css/style.css">
<link rel="stylesheet" href="../../css/bootstrap.min.css">

<style type="text/css">

	
</style>

<title>관리자화면-후기관리</title>
</head>

<body>


	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<nav class="site-nav">
		<div class="container">
			<div class="site-navigation">
				<a href="../dashboard_process/manager_dashboard.jsp" class="logo m-0">고양<span
					class="text-primary">.</span></a>

				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-center">
					<li class="active"><a href="../dashboard_process/manager_dashboard.jsp">dash board</a></li>
					<li><a href="../user_manager_process/manager_member_popup.jsp">회원관리</a></li>
					<li><a href="../tour_manager_process/manager_tour_manager.jsp">투어관리</a></li>
					<li><a href="../reservation_manager_process/manager_reservation.jsp">예약관리</a></li>
					<li><a href="../spot_manager_process/manager_spot_list.jsp">관광지 관리</a></li>
					<li><a href="manager_review.jsp">후기관리</a></li>
				</ul>

				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li></li>
					<li style="font-size: 5px; font-weight: bold;"><a
						href="../login_manager/manager_signIn.jsp">로그아웃</a></li>
				</ul>
				
				<a href="#"
					class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light"
					data-toggle="collapse" data-target="#main-navbar"> <span></span>
				</a>

			</div>
		</div>
	</nav>


	<div class="hero hero-inner">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 mx-auto text-center">
					<div class="intro-wrap">
						<h1 class="mb-0">후기관리</h1>
						<!-- <p class="text-white">로그인을 해주세요.</p> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--  여기사이에 구상하시면 됩니다!!! -->
	
	<!-- 대제목 -->
	<div class="container" style="margin-top: 20px;">
		<img src="../../images/bullet_Tues_sub_style_green.png" alt=image>
	</div>
	<!-- 대제목 끝 -->
	
		<div class="container">
		<form>
			<div style="font-size: 23px;margin: 10px 0px 10px 0px;display: flex;justify-content: space-between;">
				<div style="font-weight: bold;"> 관광 후기</div>
				<div style="font-size: 13px;display: flex;align-items: end;">목록보기</div>
			</div>

			<div>
				<table class="member" style="width: 100%">
					<tr>
						<th>번호</th>
						<th>코스</th>
						<th style="min-width: 500px;">글제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
					</tr>
					<tr>
						<td>8</td>
						<td>화요나들이(백제)</td>
						<td><a href="#" onclick="location.href='manager_reviewDetail.jsp'">화요나들이 재밌어요~!</a></td>
						<td>김*현</td>
						<td>2022.09.07</td>
					</tr>
					<tr>
						<td>7</td>
						<td>금요나들이(고양관광특구)</td>
						<td>금요나들이 다들 추천해요!! 알찬 코스~~</td>
						<td>김*희</td>
						<td>2022.09.06</td>
					</tr>
					<tr>
						<td>6</td>
						<td>일요나들이(패밀리)</td>
						<td>가족들끼리 아주 즐거운 여행!</td>
						<td>홍*영</td>
						<td>2022.09.05</td>
					</tr>
					<tr>
						<td>5</td>
						<td>토요나들이(왕릉)</td>
						<td>토요나들이 다들 추천해요!! 알찬 코스~~</td>
						<td>김*희</td>
						<td>2022.09.04</td>
					</tr>
					<tr>
						<td>4</td>
						<td>금요나들이(고양관광특구)</td>
						<td>가족들끼리 아주 즐거운 여행!</td>
						<td>홍*영</td>
						<td>2022.09.03</td>
					</tr>
					<tr>
						<td>3</td>
						<td>목요나들이(일산)</td>
						<td>목요나들이 다들 추천해요!! 알찬 코스~~</td>
						<td>김*희</td>
						<td>2022.09.02</td>
					</tr>
					<tr>
						<td>2</td>
						<td>수요나들이(행주)</td>
						<td>가족들끼리 아주 즐거운 여행!</td>
						<td>홍*영</td>
						<td>2022.09.01</td>
					</tr>
					<tr>
						<td>1</td>
						<td>화요나들이(백제)</td>
						<td>화요나들이 다들 추천해요!! 알찬 코스~~</td>
						<td>김*희</td>
						<td>2022.09.01</td>
					</tr>
				</table>
			</div>
			
			<div style="margin: 20px 0px 20px; display: flex; justify-content: center; width: 100%; height: 32px;">
				<input class="pagination" type="button" value="<">
				<input class="pagination pageNow" type="button" value="1">
				<input class="pagination" type="button" value=">">
			</div>
			
				
			<div style="display: flex; justify-content: center; margin-bottom: 50px; height: 32px;">
				<select>
					<option>코스 선택</option>
					<option>화요나들이(벽제)</option>
					<option>수요나들이(행주)</option>
					<option>목요나들이(일산)</option>
					<option>금요나들이(고양관광특구)</option>
					<option>토요나들이(왕릉)</option>
					<option>일요나들이(패밀리)</option>
				</select>
				<input type="text" placeholder="검색어를 입력하세요." style="margin: 0px 10px 0px 10px; min-width: 300px;">
				<input type="button" value="검색" class="mainBtn" style="width: 80px;">
			</div>
		</form>
	</div>


	<div class="site-footer">
		<div class="inner first">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-4" >
						<div class="widget">
							<p style="font-size: 20px;font-weight: bold; color: red;font-style:inherit;" >매주 월요일은 정기 휴무입니다.</p>
								<p style="font-size: 60px;font-weight: bold;">Goyang Tour</p>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 " style="margin: 0 0 0 auto">
						<div class="widget">
							<h3 class="heading">고양시티투어</h3>
							<ul class="list-unstyled quick-info links">
								<li class="email"><a href="#">goyang@com</a></li>
								<li class="phone"><a href="#">010-1234-5678</a></li>
								<li class="address"><a href="#">경기도 고양시 일산동구 장항동</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div class="inner dark">
			<div class="container">
				<div class="row text-center">
					<div class="col-md-8 mb-3 mb-md-0 mx-auto">
						<p>
							Copyright &copy;
							<script>document.write(new Date().getFullYear());</script>
							. All Rights Reserved. &mdash; Designed with love by <a
								href="https://untree.co" class="link-highlight">Untree.co</a>
							<!-- License information: https://untree.co/license/ -->
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 

<!-- 	<script src="js/jquery-3.4.1.min.js"></script> -->
	<script src="../../js/popper.min.js"></script>
	<script src="../../js/owl.carousel.min.js"></script>
	<script src="../../js/jquery.animateNumber.min.js"></script>
	<script src="../../js/jquery.waypoints.min.js"></script>
	<script src="../../js/jquery.fancybox.min.js"></script>
	<script src="../../js/aos.js"></script>
	<script src="../../js/moment.min.js"></script>
	<script src="../../js/daterangepicker.js"></script>
	<script src="../../js/bootstrap.min.js"></script>

	<script src="../../js/typed.js"></script>

	<script src="../../js/custom.js"></script>
</body>

</html>
