<%@page import="java.util.List"%>
<%@page import="kr.co.goyang.user.vo.TourListVO"%>
<%@page import="kr.co.goyang.user.dao.TourListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- /*
* Template Name: Tour
* Template Author: Untree.co
* Tempalte URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
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

<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/owl.carousel.min.css">
<link rel="stylesheet" href="../../css/owl.theme.default.min.css">
<link rel="stylesheet" href="../../css/jquery.fancybox.min.css">
<link rel="stylesheet" href="../../fonts/icomoon/style.css">
<link rel="stylesheet" href="../../fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../../css/daterangepicker.css">
<link rel="stylesheet" href="../../css/aos.css">
<link rel="stylesheet" href="../../css/style.css">

<title>고양 시티투어</title>
<style type="text/css">
</style>

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
				<a href="../main/index.jsp" class="logo m-0">고양<span
					class="text-primary">.</span></a>

				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-center">
					<li class="active"><a href="../main/index.jsp">home</a></li>
					<li><a href="../reservation_process/user_reservation_course.jsp">투어예약</a></li>
					<li><a href="user_introduceTour.jsp">관광지소개</a></li>
					<li><a href="../review_process/user_review.jsp">관광지후기</a></li>
					<li><a href="../mypage_process/user_mypage_inner.jsp">마이페이지</a></li>
				</ul>
				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li></li>
					<li style="font-size: 5px; font-weight: bold;"><a
						href="../login_process/user_signIn.jsp">로그인</a></li>
					<li style="font-size: 5px; font-weight: bold;"><a
						href="../login_process/user_signUp.jsp">회원가입</a></li>
				</ul>

				<a href="#"
					class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light"
					data-toggle="collapse" data-target="#main-navbar"> <span></span>
				</a>

			</div>
		</div>
	</nav>

	<div class="hero ">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 mx-auto text-center">
					<div class="intro-wrap">
						<h1 class="mb-0">화요나들이</h1>

					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 상단 투어 메뉴 -->
	<div class="untree_co-section">
		<ul class="list_sub_menu">
			<li class="_sub"><a href="user_introduceTour.jsp"> <span>시티
						투어 코스</span>
			</a></li>
			<li class="_sub"><a href="user_introduceDay.jsp"> <span>화요나들이</span>
			</a></li>
			<li class="_sub"><a href="user_introduceDay.jsp"> <span>수요나들이</span>
			</a></li>
			<li class="_sub"><a href="user_introduceDay.jsp"> <span
					class="menu_text">목요나들이</span>
			</a></li>
			<li class="_sub"><a href="user_introduceDay.jsp"> <span
					class="menu_text">금요나들이</span>
			</a></li>
			<li class="_sub"><a href="user_introduceDay.jsp"> <span>토요나들이</span>
			</a></li>
			<li class="_sub"><a href="user_introduceDay.jsp"> <span>일요나들이</span>
			</a></li>
		</ul>
	</div>
	<!-- 상단 투어 메뉴 끝 -->

	<!-- 대제목 -->
	<div class="container">
		<img src="../../images/bullet_Tues_sub_style_blue.png" alt=image>
		<p
			style="font-size: 20px; font-weight: bold; padding-top: 20px; margin-bottom: 0;">화요나들이
			(벽제)</p>
	</div>
	<!-- 대제목 끝 -->

	<!-- 라인 구분 선 -->
	<div class="container">
		<!-- <div class="col-lg-6 text-center"> -->
		<h2 class="section-sub-title text-center mb-3"></h2>
		<!-- </div> -->
	</div>
	<!-- 라인 구분 선 끝-->

	<!-- 소제목 -->
	<div class="container">
		<img src="../../images/bullet_Tues_sub_style_blue.png" alt=image>
		<p>
			<span style="color: #ba202a; font-weight: bold;">화요나들이</span><span>&nbsp;코스안내</span>
		</p>
	</div>
	<!-- 소제목 끝 -->

	<!-- MAP & LIST 영역 -->
	<div class="container">
		<div class="map_wrap">
			<div class="map_tab_wrap"
				style="background: url(../../images/map_tap.png) no-repeat center top;">
				<p class="map_tab_1">
					<a href="user_introduceDay.jsp"
						style="color: #fff; padding-left: 30px; background: transparent;">MAP으로
						보기</a>
				</p>
				<p class="map_tab_2">
					<a href="user_introduceDay_list.jsp"
						style="color: #444; padding-right: 10px; background: transparent;">LIST로
						보기</a>
				</p>
			</div>
			<div class="map_frame" id="map" style="width: 800px;"></div>
			<div>
				<p style="color: #f00; font-weight: bold; margin: 30px 0;">(관광지를
					클릭하시면 세부 정보를 확인할 수 있습니다.)</p>
			</div>
			<div style="padding-bottom: 30px;">
				<table border="0" width="1110px">
					<tbody align="center">
						<tr>
							<td rowspan="3"
								style="width: 80px; height: 40px; border-radius: 50%; background: #d3e0ea; font-size: 20px; font-weight: bold; text-align: center;">화</td>
							<td style="color: #7895b2; font-weight: bold;">10:00</td>
							<td style="color: #7895b2; font-weight: bold;">11:00 ~ 12:00</td>
							<td style="color: #7895b2; font-weight: bold;">12:00 ~ 13:00</td>
							<td style="color: #7895b2; font-weight: bold;">13:00 ~ 14:00</td>
							<td style="color: #7895b2; font-weight: bold;">14:30 ~ 15:30</td>
							<td style="color: #7895b2; font-weight: bold;">16:00</td>
						</tr>
						<tr
							style="border-bottom: 1px solid #444; color: #7895b2; font-weight: bold;">
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
							<td>5</td>
							<td>6</td>
						</tr>
						<tr>
							<td>고양관광정보센터</td>
							<td><a href="user_introduceDay_detail.jsp"> <span
									style="text-decoration: underline; color: #168;"> 중남미문화원</span></a></td>
							<td><a href="user_introduceDay_detail.jsp"> <span
									style="text-decoration: underline; color: #168;">
										타코체험/체험비 별도</span></a></td>
							<td><a href="user_introduceDay_detail.jsp"> <span
									style="text-decoration: underline; color: #168;"> 고양향교,
										벽제관지</span></a></td>
							<td><a href="user_introduceDay_detail.jsp"> <span
									style="text-decoration: underline; color: #168;"> 최영장군묘</span></a></td>
							<td>고양관광정보센터</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- MAP & LIST 영역 끝 -->

	<!-- 본문 제목 & 중간 구분선 -->
	<div class="container" style="padding-bottom: 20px;">
		<div class="row justify-content-center">
			<p
				style="margin: 0; padding-top: 20px; font-weight: bold; font-size: 20px;">(기본)
				탑승료</p>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-6 text-center">
				<h2 class="section-title text-center mb-3"></h2>
			</div>
		</div>
	</div>
	<!-- 본문 제목 & 중간 구분선 끝 -->

	<!-- 본문 요금표 -->
	<div class="container" style="padding-bottom: 50px;">
		<div class="row justify-content-center">
			<table class="member">
				<thead>
					<tr>
						<th>성인</th>
						<th>기타</th>
						<th>무료</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="200px">6,000원</td>
						<td width="200px">4,000원</td>
						<td width="200px">경로,장애인,<br>유치원~초중고,36개월 미만
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 본문 요금표 끝 -->

	<!-- 본문 글 -->
	<div class="container" style="padding-bottom: 50px;">
		<div class="row justify-content-center">
			<p style="font-size: 16px; font-weight: bold;">※ 예약을 하시려면 하단의
				투어예약 버튼을 눌러주세요</p>
		</div>
	</div>
	<!-- 본문 글 끝 -->

	<!-- 지금 바로 떠나세요! 영역 -->
	<div class="container">
		<div style="background: rgba(26, 55, 77, 0.05);">
			<div
				style="padding: 20px; display: flex; flex-direction: row; justify-content: space-evenly; align-items: center;">
				<iframe width="350" height="250"
					src="https://www.youtube.com/embed/pdBJjNjkZpM"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope;
       picture-in-picture"
					allowfullscreen></iframe>
				<div style="padding: 20px; text-align: center; padding-top: 80px;">
					<p style="font-size: 1.75rem; font-weight: bold;">지금 바로 떠나세요!</p>
					<br>
					<p class="mb-0">
						<a href="#"
							class="btn btn-outline-white text-white btn-md font-weight-bold"
							style="background-color: #888888;"> 투어예약 </a>
					</p>
				</div>
				<div>
					<img src="../../images/버스사진.jpg" width="350" height="250">
				</div>
			</div>
		</div>
	</div>
	<!-- 지금 바로 떠나세요! 영역 끝 -->

	<div class="site-footer">
		<div class="inner first">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<div class="widget">
							<p
								style="font-size: 20px; font-weight: bold; color: red; font-style: inherit;">매주
								월요일은 정기 휴무입니다.</p>
							<p style="font-size: 60px; font-weight: bold;">Goyan Tour</p>
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
							<script>
								document.write(new Date().getFullYear());
							</script>
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

	<script src="../../js/jquery-3.4.1.min.js"></script>
	<script src="../../js/popper.min.js"></script>
	<script src="../../js/bootstrap.min.js"></script>
	<script src="../../js/owl.carousel.min.js"></script>
	<script src="../../js/jquery.animateNumber.min.js"></script>
	<script src="../../js/jquery.waypoints.min.js"></script>
	<script src="../../js/jquery.fancybox.min.js"></script>
	<script src="../../js/aos.js"></script>
	<script src="../../js/moment.min.js"></script>
	<script src="../../js/daterangepicker.js"></script>

	<script src="../../js/typed.js"></script>

	<script src="../../js/custom.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2b7dbcfb30a29ea8ee41ab3f0eb7a30"></script>
	<%
		TourListDAO tlDAO=TourListDAO.getInstance();
		TourListVO center=tlDAO.selectCenterSpotMap(1); //센터 좌표 - 매개변수값은 전 페이지에서 가져오기.(tour_num)

		List<TourListVO> spotMap=tlDAO.selectSpotMap(1); //관광지들의 좌표 - 매개변수값은 전 페이지에서 가져오기.(tour_num)
		
	%>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(<%=center.getMapCenLati() %>, <%=center.getMapCenLong() %>), // 지도의 중심좌표
			level : 7
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions=[];
		
		<% 
			for(TourListVO tlVO:spotMap){
		
		%>
			positions.push({content:'<div><%=tlVO.getSpotsName()%></div>',latlng:new kakao.maps.LatLng(<%=tlVO.getMapSpoLati()%>, <%=tlVO.getMapSpoLong()%>)});
		
		<%}%>
		
		
		
		

		for (var i = 0; i < positions.length; i++) {
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng
			// 마커의 위치
			});

			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content
			// 인포윈도우에 표시할 내용
			});

			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(
					map, marker, infowindow));
			kakao.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));
		}

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}
		
		// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
		var linePath = [];
		<% 
			for(TourListVO tlVO:spotMap){
	
		%>
			linePath.push( new kakao.maps.LatLng(<%=tlVO.getMapSpoLati()%>, <%=tlVO.getMapSpoLong()%>));
		
		<%}%>

		// 지도에 표시할 선을 생성합니다
		var polyline = new kakao.maps.Polyline({
		    path: linePath, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 5, // 선의 두께 입니다
		    strokeColor: '#FFAE00', // 선의 색깔입니다
		    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'solid' // 선의 스타일입니다
		});

		// 지도에 선을 표시합니다 
		polyline.setMap(map);  
		
	</script>
</body>

</html>