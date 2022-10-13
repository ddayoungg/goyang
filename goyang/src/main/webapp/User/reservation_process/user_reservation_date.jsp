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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- datapicker 시작 -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({
    	  dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
    	  monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
    ,
    beforeShowDay: function(date){
		var day = date.getDay();
		return [(day == 2)];
    },
    onSelect:function(selectDay){
        var arr=selectDay.split("/");
        var month=arr[0];
        var day=arr[1];
        $("#month").text(month);
        $("#day").text(day);
    }
    });
  } );
  </script>
<!-- datapicker 끝 -->

<style type="text/css">
.ui-datepicker-inline{
	display: block;
	width: 400px;
	height: 400px;
}
.ui-datepicker-header{
    height: 10%;
    width: 100%;
}
.ui-datepicker-calendar{
    width: 100%;
    height: 90%;
}
.ui-state-default{
	height: 80%;
}

</style>

<title>고양시티투어</title>
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
					<li><a href="user_reservation_course.jsp">투어예약</a></li>
					<li><a href="../spot_process/user_introduceTour.jsp">관광지소개</a></li>
					<li><a href="../review_process/user_review.jsp">관광지후기</a></li>
					<li><a href="../mypage_process/user_mypage_inner.jsp">마이페이지</a></li>
				</ul>

				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li></li>
					<li style="font-size: 5px; font-weight: bold;"><a href="../main/index.jsp">로그아웃</a></li>
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
						<h1 class="mb-0">사용자 화면</h1>
						<!-- <p class="text-white">로그인을 해주세요.</p> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--  여기사이에 구상하시면 됩니다!!! -->
	
	<!-- 상단 투어 메뉴 -->
	<div class="untree_co-section">
		<ul class="list_sub_menu">
			<li class="_sub"><a href="user_reservation_course.jsp"> <span>정기코스</span>
			</a></li>
			<li class="_sub"><a href="user_reservation_date.jsp"> <span>투어 일정</span>
			</a></li>
			</ul>
			</div>
	<!-- 상단 투어 메뉴 끝 -->
	
		<!-- 대제목 -->
	<div class="container">
		<img src="../../images/bullet_Tues_sub_style_blue.png" alt="image">
		<p
			style="font-size: 20px; font-weight: bold; padding-top: 20px; margin-bottom: 0;">화요나들이(벽제)</p>
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
		<img src="../../images/bullet_Tues_sub_style_blue.png" alt="image">
		<p style="padding-bottom: 20px;">
			일정 및 인원 선택
		</p>
	</div>
	<!-- 소제목 끝 -->
	
	<div class="container">
		<form>
		<!-- 	<div style="padding-bottom: 15px; border-bottom:1px solid grey; font-size: 23px;margin: 50px 0px 10px 0px;display: flex;justify-content: space-between;">
				<div> 화요나들이(벽제)</div>
			</div>
			
			<div style="padding-bottom: 15px; border-bottom:1px solid grey; font-size: 18px;margin: 50px 0px 50px 0px;display: flex;justify-content: space-between;">
				<div> 일정 및 인원 선택</div>
			</div> -->
			
			<div style="display: flex; justify-content: space-around; padding: 0 130px;">
				<div>
					<div id="datepicker"></div>
				</div>
				<div style="display: flex; flex-direction: column; justify-content: space-around;">
					<div>
						<div style="font-size: 15px;"><span id="month">10</span>월 <span id="day">5</span>일 <span>화</span>요일 10:00 ~ 16:00</div>
						<div style="color: red; font-size: 13px;">*시간은 10:00 ~ 16:00으로 고정 입니다.</div>
					</div>
					<div>
						<div style="font-size: 17px; margin-bottom: 25px; padding-left: 10px;">예약 가능한 인원 수 : <span>20</span>명</div>
						<div style="display: flex; align-items: center; padding-bottom: 15px;">
							<div style="padding-right: 20px;">성인 : 6,000원</div>
							<div>
								<select style="width: 120px; height: 30px;">
									<option>1명</option>
									<option>2명</option>
									<option>3명</option>
									<option>4명</option>
									<option>5명</option>
								</select>
							</div>
						</div>
						<div style="display: flex; align-items: center;">
							<div style="padding-right: 20px;">기타 : 4,000원</div>
							<div>
								<select style="width: 120px; height: 30px;">
									<option>1명</option>
									<option>2명</option>
									<option>3명</option>
									<option>4명</option>
									<option>5명</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div style="display: flex; justify-content: end; margin: 20px 0 100px 0;">
				<input type="button" value="다음" class="mainBtn" onclick="showPopup(true,'popup')" style="width: 80px; height: 32px;">
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
	
	<!-- 팝업창 -->
	<div id="popup" class="hide popup">
	  <div class="content">
		<div style="width: 412px;">
			<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
			display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">일정 선택</div>
			
			<div style="background-color: #f0f6f9;">
				<div style="font-size: 16px; display: flex; justify-content: center; 
				align-items: center; height: 70px ;background-color: #f0f6f9;">일정을 선택해주세요.</div>
				
				<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
					<input type="button" value="확인" class="popupBtn" onclick="closePopup('popup')">
				</div>
			</div>
		</div>
	  </div>
	</div>
	
	<!-- 팝업창 -->
	<div id="popup2" class="hide popup">
	  <div class="content">
		<div style="width: 412px;">
			<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
			display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">인원 수 선택</div>
			
			<div style="background-color: #f0f6f9;">
				<div style="font-size: 16px; display: flex; justify-content: center; 
				align-items: center; height: 70px ;background-color: #f0f6f9;">인원 수를 선택해주세요.</div>
				
				<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
					<input type="button" value="확인" class="popupBtn" onclick="closePopup2('popup2')">
				</div>
			</div>
		</div>
	  </div>
	</div>


	<!-- <script src="../../js/jquery-3.4.1.min.js"></script> -->
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

	<!-- 수정 -->
	<script type="text/javascript">
		function showPopup(hasFilter,id) {
			const popup = document.querySelector("#"+id);
			
			if(id=='popup2'){
				document.querySelector('#popup').classList.add('hide');
			}
			
			if (hasFilter) {
				popup.classList.add('has-filter');
			} else {
				popup.classList.remove('has-filter');
			}
				
			popup.classList.remove('hide');
		}
		
		function closePopup(id) {
			const popup = document.querySelector("#"+id);
			popup.classList.add('hide');
		}
		
	</script>
</body>

</html>
