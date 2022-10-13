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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('Zipcode').value = data.zonecode;
                document.getElementById("Address").value = roadAddr;
            }
        }).open();
    }
</script>
<title>고양 시티투어</title>
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
					<li><a href="../spot_process/user_introduceTour.jsp">관광지소개</a></li>
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


	<div class="hero hero-inner">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 mx-auto text-center">
					<div class="intro-wrap">
						<h1 class="mb-0">회원가입</h1>
						<!-- <p class="text-white">로그인을 해주세요.</p> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--  여기사이에 구상하시면 됩니다!!! -->
		
<div style="width:100%; display:flex; flex-direction:column; align-items:center; 
	margin-top: 36px; margin-bottom: 36px;">
	<div style="background:#FFFFFF; width:550px;">
		<header>
			<div style="margin-top:15px;display:flex; flex-direction:column; align-items:center; ">
				<span style="font-size:30px;"><strong>Sign Up</strong></span>
			</div>
		</header>
		
			
			<label style="text-align:left; width:465px; margin-top:13px; margin-left:42.5px;">아이디</label>
			<div style="width:100%; height:48px;">
			<div style="width:200px; height:48px; border:solid 1px gray; 
			background: white; margin-left:42.5px; float:left">	
				<input placeholder="Zipcode" type="text" style="border:none; width:160px;
				margin-top:10px; font-size:14px; margin-left:10px" ></input>
			</div>
			<div style="float:left; width:33%;">
			<input type="button" style=" width:160px; height:48px; font-size:15px; margin-left:15px;" class="mainBtn" value="중복 확인" onclick="execDaumPostcode()">
			</div>
			</div>
			
			
			<section style=" display:flex; flex-direction:column; align-items:center;">
			<label style="text-align:left; width:465px; margin-top:13px;">비밀번호</label>
			<div style="width:465px; height:48px; border:solid 1px gray; 
			background: white; ">	
				<input placeholder="Password" type="password" style="border:none; width:430px;
				margin-top:10px; font-size:14px; margin-left:10px"></input>
			</div>
			<label style="text-align:left; width:465px; margin-top:13px;">비밀번호 확인</label>
			<div style="width: 465px; height:48px; border: solid 1px gray; 
			background: white;">	
				<input placeholder="Confirm Password" type="text" style="border:none; width:430px;
				margin-top:10px; font-size:14px; margin-left:10px"></input>
			</div>
			<label style="text-align:left; width:465px; margin-top:13px;">이메일</label>
			<div style="width:465px; height:48px; border:solid 1px gray; 
			background: white; ">	
				<input placeholder="Email" type="text" style="border:none; width:430px;
				margin-top:10px; font-size:14px; margin-left:10px"></input>
			</div>
			<label style="text-align:left; width:465px; margin-top:13px;">이름</label>
			<div style="width:465px; height:48px; border:solid 1px gray; 
			background: white; ">	
				<input placeholder="Name" type="text" style="border:none; width:430px;
				margin-top:10px; font-size:14px; margin-left:10px"></input>
			</div>
			<label style="text-align:left; width:465px; margin-top:13px;">휴대폰번호</label>
			<div style="width:465px; height:48px; border:solid 1px gray; 
			background: white; ">	
				<input placeholder="Phone" type="text" style="border:none; width:430px;
				margin-top:10px; font-size:14px; margin-left:10px"></input>
			</div>
			</section>
			
			
			<label style="text-align:left; width:465px; margin-top:13px; margin-left:42.5px;">주소</label>
			<div style="width:200px; height:48px; border:solid 1px gray; 
			background: white; margin-left:42.5px; float:left">	
				<input placeholder="Zipcode" type="text" style="border:none; width:160px;
				margin-top:10px; font-size:14px; margin-left:10px" id="Zipcode"></input>
			</div>
			<div style="float:left; width:33%;">
			<input type="button" style=" width:160px; height:48px; font-size:15px; margin-left:15px;" class="mainBtn" value="우편번호 검색" onclick="execDaumPostcode()">
			</div>
			<div style="width:465px; height:48px; border:solid 1px gray; 
			background: white; margin-left:42.5px; margin-top:13px; float:left">	
				<input placeholder="Address" type="text" style="border:none; width:430px;
				margin-top:10px; font-size:14px; margin-left:10px"id="Address"></input>
			</div>
			<div style="width:465px; height:48px; margin-top:13px; border:solid 1px gray; 
			background: white; margin-left:42.5px; float:left">	
				<input placeholder="Address Detail" type="text" style="border:none; width:430px;
				margin-top:10px; font-size:14px; margin-left:10px"></input>
			</div>
			<label style="text-align:left; width:465px; margin-top:13px; margin-left:42.5px;">관심있는 코스</label>
			<div style="width:465px;  margin-top:13px; 
			 margin-left:42.5px; float:left; border-bottom:1px solid gray;" >
			 	<input type="checkbox" name="cose" value="화요나들이(벽제)"> 화요나들이(벽제)<br>
			 	<input type="checkbox" name="cose" value="수요나들이(행주)"> 수요나들이(행주)<br>
			 	<input type="checkbox" name="cose" value="목요나들이(일산)"> 목요나들이(일산)<br>
			 	<input type="checkbox" name="cose" value="금요나들이(고양관광특구)"> 금요나들이(고양관광특구)<br>
			 	<input type="checkbox" name="cose" value="토요나들이(왕릉)"> 토요나들이(왕릉)<br>
			 	<input type="checkbox" name="cose" value="일요나들이(패밀리)"> 일요나들이(패밀리)<br>
			</div>
			<div style="width:465px; height:48px; margin-top:40px; 
			background: white; margin-left:42.5px; float:left">
				<button style="width:465px; height:48px; font-size:18px;
				margin-left:-1px; margin-top:-1px;
				"	 onclick="showPopup(true)"  class="btn btn-primary btn-block">가입완료</button>
			</div>
			<div style="width:465px; height:52px; margin-top:13px; 
			 margin-left:42.5px; float:left">
			 
			 <div id="popup" class="hide popup">
<div class="content">
	<div>
		<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">게시글 등록 확인</div>
		
		<div style="background-color: #f0f6f9;">
			<div style="font-size: 16px; display: flex; justify-content: center; 
			align-items: center; height: 70px ;background-color: #f0f6f9;">회원가입되었습니다.</div>
			
			<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
				<input type="button" value="확인" class="popupBtn" onclick="location.href='user_signIn.jsp'">
				<input type="button" value="취소" class="popupBtn" onclick="closePopup()">
			</div>
		</div>
	</div>
</div>
</div>
			 
			
	</div>
	</div>
	</div>

	<div class="site-footer">
		<div class="inner first">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-4" >
						<div class="widget">
							<p style="font-size: 20px;font-weight: bold; color: red;font-style:inherit;" >매주 월요일은 정기 휴무입니다.</p>
								<p style="font-size: 60px;font-weight: bold;">Goyan Tour</p>
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
	<script type="text/javascript">
		function showPopup(hasFilter) {
			const popup = document.querySelector('#popup');
		  
		  if (hasFilter) {
		  	popup.classList.add('has-filter');
		  } else {
		  	popup.classList.remove('has-filter');
		  }
		  
		  popup.classList.remove('hide');
		}
		
		function closePopup() {
			const popup = document.querySelector('#popup');
		  popup.classList.add('hide');
		}
	</script>
	
	
</body>

</html>
