<%@page import="kr.co.goyang.user.vo.TourMainVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.goyang.user.dao.TourMainDAO"%>
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

<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/owl.carousel.min.css">
<link rel="stylesheet" href="../../css/owl.theme.default.min.css">
<link rel="stylesheet" href="../../css/jquery.fancybox.min.css">
<link rel="stylesheet" href="../../fonts/icomoon/style.css">
<link rel="stylesheet" href="../../fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../../css/aos.css">
<link rel="stylesheet" href="../../css/style.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<title>고양 시티투어</title>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2b7dbcfb30a29ea8ee41ab3f0eb7a30"></script>
<script type="text/javascript">
window.onload=function(){
   mapFunc();
   
}

function mapFunc(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.65944640471532, 126.773417397945), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 

var markerPosition  = new kakao.maps.LatLng(37.65944640471532, 126.773417397945); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);  
}

</script>


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
				<a href="index.jsp" class="logo m-0">고양<span
					class="text-primary">.</span></a>

				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-center">
					<li class="active"><a href="index.jsp">home</a></li>
					<li><a href="../reservation_process/user_reservation_course.jsp">투어예약</a></li>
					<li><a href="../spot_process/user_introduceTour.jsp">관광지소개</a></li>
					<li><a href="../review_process/user_review.jsp">관광지후기</a></li>
					<li><a href="../mypage_process/user_mypage_inner.jsp">마이페이지</a></li>
				</ul>
				
				
				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
				<%
					Object id=session.getAttribute("id");
				
				%>
					<li></li>
				<%
					if(id==null){
				%>
					<li style="font-size: 5px; font-weight: bold;"><a
						href="../login_process/user_signIn.jsp">로그인</a></li>
					<li style="font-size: 5px; font-weight: bold;"><a
						href="../login_process/user_signUp.jsp">회원가입</a></li>
				<%
					}else{
				%>
					<li style="font-size: 5px; font-weight: bold;"><a
						href="../login_process/user_logout.jsp">로그아웃</a></li>
				<%
					}
				%>
				</ul>

				<a href="#"
					class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light"
					data-toggle="collapse" data-target="#main-navbar"> <span></span>
				</a>

			</div>
		</div>
	</nav>


	<div class="hero">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-7">
					<div class="intro-wrap">
						<h1 class="mb-5" style="font-size: 40px">
							<span class="d-block">고양시티투어에 오신 여러분</span> 환영합니다. <span
								class="typed-words"></span>
						</h1>

						<div class="row">
							<div class="col-12">
								<form class="form">
									<div class="row mb-2">
										<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-4">
											<select name="" id="" class="form-control custom-select">
												<option value="">화요나들이</option>
												<option value="">수요나들이</option>
												<option value="">목요나들이</option>
												<option value="">금요나들이</option>
												<option value="">토요나들이</option>
												<option value="">일요나들이</option>
											</select>
										</div>
										<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-5" >
											<input type="text" class="form-control" id="datepicker">
										</div>								
										<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-3">
											<input type="submit" class="btn btn-primary btn-block"
												value="투어예약">
										</div>

									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="slides">
						<img src="../../images/tues.jpg" alt="Image" class="img-fluid2 active">
						<img src="../../images/wed.jpg" alt="Image" class="img-fluid2"> <img
							src="../../images/thur.jpg" alt="Image" class="img-fluid2"> <img
							src="../../images/fri.jpg" alt="Image" class="img-fluid2"> <img
							src="../../images/satur.jpg" alt="Image" class="img-fluid2"> <img
							src="../../images/sun.jpg" alt="Image" class="img-fluid2">
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- <div class="untree_co-section">
      <div class="container">
         <div class="row mb-5 justify-content-center">
            <div class="col-lg-6 text-center">
               <h3 class="section-title text-center mb-3">고양시 시티투어</h3>
               <p>편리하고 안전한 고양시티투어 여행!! 가족과 연인과 친구와 함께 아름다운 도시 고양으로 여행을 떠나보세요^-^</p>
            </div>
         </div>
         <div class="row align-items-stretch">
            <div class="col-lg-4 order-lg-1">
               <div class="h-100"><div class="frame h-100"><div class="feature-img-bg h-100" style="background-image: url('images/hero-slider-1.jpg');"></div></div></div>
            </div>

            <div class="col-6 col-sm-6 col-lg-4 feature-1-wrap d-md-flex flex-md-column order-lg-1" >

               <div class="feature-1 d-md-flex">
                  <div class="align-self-center">
                     <span class="flaticon-house display-4 text-primary"></span>
                     <h3>Beautiful Condo</h3>
                     <p class="mb-0">Even the all-powerful Pointing has no control about the blind texts.</p>
                  </div>
               </div>

               <div class="feature-1 ">
                  <div class="align-self-center">
                     <span class="flaticon-restaurant display-4 text-primary"></span>
                     <h3>Restaurants & Cafe</h3>
                     <p class="mb-0">Even the all-powerful Pointing has no control about the blind texts.</p>
                  </div>
               </div>

            </div>

            <div class="col-6 col-sm-6 col-lg-4 feature-1-wrap d-md-flex flex-md-column order-lg-3" >

               <div class="feature-1 d-md-flex">
                  <div class="align-self-center">
                     <span class="flaticon-mail display-4 text-primary"></span>
                     <h3>Easy to Connect</h3>
                     <p class="mb-0">Even the all-powerful Pointing has no control about the blind texts.</p>
                  </div>
               </div>

               <div class="feature-1 d-md-flex">
                  <div class="align-self-center">
                     <span class="flaticon-phone-call display-4 text-primary"></span>
                     <h3>24/7 Support</h3>
                     <p class="mb-0">Even the all-powerful Pointing has no control about the blind texts.</p>
                  </div>
               </div>

            </div>

         </div>
      </div>
   </div> -->

	<!-- <div class="untree_co-section count-numbers py-5">
      <div class="container">
         <div class="row">
            <div class="col-6 col-sm-6 col-md-6 col-lg-3">
               <div class="counter-wrap">
                  <div class="counter">
                     <span class="" data-number="9313">0</span>
                  </div>
                  <span class="caption">No. of Travels</span>
               </div>
            </div>
            <div class="col-6 col-sm-6 col-md-6 col-lg-3">
               <div class="counter-wrap">
                  <div class="counter">
                     <span class="" data-number="8492">0</span>
                  </div>
                  <span class="caption">No. of Clients</span>
               </div>
            </div>
            <div class="col-6 col-sm-6 col-md-6 col-lg-3">
               <div class="counter-wrap">
                  <div class="counter">
                     <span class="" data-number="100">0</span>
                  </div>
                  <span class="caption">No. of Employees</span>
               </div>
            </div>
            <div class="col-6 col-sm-6 col-md-6 col-lg-3">
               <div class="counter-wrap">
                  <div class="counter">
                     <span class="" data-number="120">0</span>
                  </div>
                  <span class="caption">No. of Countries</span>
               </div>
            </div>
         </div>
      </div>
   </div>
 -->


	<div class="untree_co-section">
		<div class="container">
			<div class="row text-center justify-content-center mb-5">
				<div class="col-lg-7">
					<h2 class="section-title text-center">■ 정기 코스</h2>
				</div>
			</div>

			<div class="owl-carousel owl-3-slider">
			<%
				TourMainDAO tmDAO=TourMainDAO.getInstance();
				List<TourMainVO> list=tmDAO.selectMainTour();
				for(TourMainVO tmVO:list){
			%>
				<div class="item">
					<a class="media-thumb" href="user_introduceDay.html">
						<div class="media-text">
							<h3 style="color:#FFFFFF;"><%=tmVO.getTourName() %></h3>
						</div> <img src="../../images/<%=tmVO.getThum_img() %>" alt="Image" class="img-fluid">
					</a>
				</div>
			<%} %>
			</div>

		</div>
	</div>


	<!-- <div class="untree_co-section testimonial-section mt-5">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-lg-7 text-center">
               <h2 class="section-title text-center mb-5">Testimonials</h2>

               <div class="owl-single owl-carousel no-nav">
                  <div class="testimonial mx-auto">
                     <figure class="img-wrap">
                        <img src="images/person_2.jpg" alt="Image" class="img-fluid">
                     </figure>
                     <h3 class="name">Adam Aderson</h3>
                     <blockquote>
                        <p>&ldquo;There live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
                     </blockquote>
                  </div>

                  <div class="testimonial mx-auto">
                     <figure class="img-wrap">
                        <img src="images/person_3.jpg" alt="Image" class="img-fluid">
                     </figure>
                     <h3 class="name">Lukas Devlin</h3>
                     <blockquote>
                        <p>&ldquo;There live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
                     </blockquote>
                  </div>

                  <div class="testimonial mx-auto">
                     <figure class="img-wrap">
                        <img src="images/person_4.jpg" alt="Image" class="img-fluid">
                     </figure>
                     <h3 class="name">Kayla Bryant</h3>
                     <blockquote>
                        <p>&ldquo;There live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
                     </blockquote>
                  </div>

               </div>

            </div>
         </div>
      </div>
   </div>  -->




	<div class="untree_co-section">
		<div class="container">
			<h3 class=" text-center mb-3">■투어 후기게시판</h3>
			<div class="row" id="review">
				<div style="padding: 70px">
					<table class="member" style="width: 1000px">
						<tr>
							<th>No</th>
							<th>코스</th>
							<th>글제목</th>
							<th>글쓴이</th>
							<th>작성일</th>
						</tr>
						<tr>
							<td>1</td>
							<td>화요나들이(백제)</td>
							<td>화요날들이 재밌어요~!!</td>
							<td>김*현</td>
							<td>2022.09.07</td>
						</tr>
						<tr>
							<td>2</td>
							<td>금요나들이(고양관광특구)</td>
							<td>금요나들이 다들 추천해요!! 알찬 코스~~</td>
							<td>김*희</td>
							<td>2022.09.07</td>
						</tr>
						<tr>
							<td>3</td>
							<td>일요나들이</td>
							<td>가족들끼리 아주 즐거운여행!!</td>
							<td>홍*영</td>
							<td>2022.09.07</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="reviewBtn">
				<input type="submit" class="btn btn-primary " value="후기 더보기"
					size="50px" onclick="location.href='../review_process/user_review.jsp'">
			</div>
		</div>
	</div>

	<div class="untree_co-section">
		<div class="container">
			<h3 class=" text-center mb-3">■오시는길</h3>
			<div class="row" id="review">
				<div style="padding: 70px">
					<table style="border-spacing: 40px; border-collapse: separate;">
						<tr style="text-align:center;">
							<td><div id="map" style="width: 500px; height: 350px;">카카오
									지도 api가져오기</div></td>
							<td><h5>정발산역(고양아람누리)&nbsp;2번출구</h5><br><br>
							<h4>경기도 고양시 일산동구 장항동</h4></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- <div class="untree_co-section">
      <div class="container">
         <div class="row justify-content-between align-items-center">
            
            <div class="col-lg-6">
               <figure class="img-play-video">
                  <a id="play-video" class="video-play-button" href="https://www.youtube.com/watch?v=mwtbEGNABWU" data-fancybox>
                     <span></span>
                  </a>
                  <img src="images/hero-slider-2.jpg" alt="Image" class="img-fluid rounded-20">
               </figure>
            </div>

            <div class="col-lg-5">
               <h2 class="section-title text-left mb-4">Take a look at Tour Video</h2>
               <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>

               <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>

               <ul class="list-unstyled two-col clearfix">
                  <li>Outdoor recreation activities</li>
                  <li>Airlines</li>
                  <li>Car Rentals</li>
                  <li>Cruise Lines</li>
                  <li>Hotels</li>
                  <li>Railways</li>
                  <li>Travel Insurance</li>
                  <li>Package Tours</li>
                  <li>Insurance</li>
                  <li>Guide Books</li>
               </ul>

               <p><a href="#" class="btn btn-primary">Get Started</a></p>

               
            </div>
         </div>
      </div>
   </div> -->



	<!-- <div class="py-5 cta-section">
      <div class="container">
         <div class="row text-center">
            <div class="col-md-12">
               <h2 class="mb-2 text-white">Lets you Explore the Best. Contact Us Now</h2>
               <p class="mb-4 lead text-white text-white-opacity">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi, fugit?</p>
               <p class="mb-0"><a href="booking.html" class="btn btn-outline-white text-white btn-md font-weight-bold">Get in touch</a></p>
            </div>
         </div>
      </div>
   </div> -->

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
	<!-- 달력 -->


	<script src="../../js/jquery-3.4.1.min.js"></script>
	<script src="../../js/popper.min.js"></script>
	<script src="../../js/bootstrap.min.js"></script>
	<script src="../../js/owl.carousel.min.js"></script>
	<script src="../../js/jquery.animateNumber.min.js"></script>
	<script src="../../js/jquery.waypoints.min.js"></script>
	<script src="../../js/jquery.fancybox.min.js"></script>
	<script src="../../js/aos.js"></script>
	<script src="../../js/moment.min.js"></script>
	<script src="../../js/typed.js"></script>
	<script src="../../js/custom.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2b7dbcfb30a29ea8ee41ab3f0eb7a30c2b7dbcfb30a29ea8ee41ab3f0eb7a30"></script> -->


	<script>
      $(function() {
         var slides = $('.slides'),
         images = slides.find('img');

         images.each(function(i) {
            $(this).attr('data-id', i + 1);
         })

         var typed = new Typed('.typed-words', {
            strings: ["화요나들이"," 수요나들이"," 목요나들이", " 금요나들이", " 토요나들이"," 일요나들이"],
            typeSpeed: 80,
            backSpeed: 80,
            backDelay: 4000,
            startDelay: 1000,
            loop: true,
            showCursor: true,
            preStringTyped: (arrayPos, self) => {
               arrayPos++;
               console.log(arrayPos);
               $('.slides img').removeClass('active');
               $('.slides img[data-id="'+arrayPos+'"]').addClass('active');
            }

         });
      })
   </script>
	<script>
   $(function() {
       //input을 datepicker로 선언
       $("#datepicker").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });
</script>

	<!--    <script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script> -->





</body>

</html>