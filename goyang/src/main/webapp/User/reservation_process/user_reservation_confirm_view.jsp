<%@page import="kr.co.goyang.user.vo.TourReservaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style type="text/css">
	
</style>

<!-- google jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>


<%
//파라미터, 세션 얻기
//아이디 set
String id="";//아이디
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if

//투어 번호 set
int tourNum=0;//투어 번호
if(request.getParameter("tourNum") !=null){//투어 번호 가져오기
	tourNum = Integer.parseInt(request.getParameter("tourNum"));
}//end if

//예약일 set
String reserDate="";//예약일
if(request.getParameter("reserDate") !=null){//예약일 가져오기
	reserDate = request.getParameter("reserDate");
}//end if

//예약한 좌석 번호 배열 set
int[] seatNumIn=null;//예약한 좌석 번호 배열
if((int[])request.getAttribute("seatNumIn") != null){
	seatNumIn=(int[])request.getAttribute("seatNumIn");
}//end if

%>

<script type="text/javascript">
$(function(){
	var seatNumIn = new Array();
	var seatNumOutput = new Array();
	
	accessChk();//접근 권한 여부
	
	<% for(int seat : seatNumIn) {%>//예약한 좌석번호 세팅
		seatNumOutput.push(<%= seat %>+"번 ");//seatNumOutput 세팅
	<% }//end for %>
	
	seatNumOutput.sort();//버스 좌석 정렬
	
	$("#seatNumOutput").html(seatNumOutput);//예약한 좌석 번호
	
	$("#payBtn").click(function(){
		showPopup(true,'popup');//결제 확인 메시지 창.
	})//payBtn
	
})//ready

function accessChk(){
	var id="<%= id %>";
	var tourNum=<%= tourNum %>;
	var reserDate="<%= reserDate %>";
	var chkFlag=true; //true 통과, false 돌아가
		
	if(id==""){
		alert("로그인 해주세요.");
		location.href="http://211.63.89.140/User/login_process/user_signIn.jsp";
		return;
	}else if(tourNum==0){
		alert("투어를 선택해주세요.");
		chkFlag=false;
	}else if(reserDate==""){
		alert("예약일을 선택해주세요.");
		chkFlag=false;
	}//end else if
	
	if(!chkFlag){//필요한 파라미터 값이 없을 경우 코스 선택 페이지로 이동
		location.href="http://211.63.89.140/User/reservation_process/user_reservation_course.jsp";
	}//end if
		
}//accessChk

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
					<li><a href="user_reservation_course.jsp">투어예약</a></li>
					<li><a href="../spot_process/user_introduceTour.jsp">관광지소개</a></li>
					<li><a href="../review_process/user_review.jsp">관광지후기</a></li>
					<li><a href="../mypage_process/user_mypage_inner.jsp">마이페이지</a></li>
				</ul>

				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li></li>
					<li style="font-size: 5px; font-weight: bold;"><a href="../login_process/user_logout.jsp">로그아웃</a></li>
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
						<h1 class="mb-0">예약 확인</h1>
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
			<li class="_sub"><a href="user_reservation_course.jsp"> <span>정기코스</span></a></li>
			<li class="_sub"><a href="user_reservation_date.jsp"> <span>투어 일정</span></a></li>
			<li class="_sub"><a href="user_reservation_seat.jsp"> <span>버스 좌석</span></a></li>
			<li class="_sub"><span><strong>투어 예약 확인</strong></span></li>
			</ul>
			</div>
			<!-- 상단 투어 메뉴 끝 -->
			
			<!-- 대제목 -->
	<div class="container">
		<img src="../../images/bullet_Tues_sub_style_blue.png" alt="image">
		<p style="font-size: 20px; font-weight: bold; padding-top: 20px; margin-bottom: 0;">${ tourInfo.tourName }</p>
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
		<p style="margin-bottom: 20px;">투어 예약 확인</p>
	</div>
	<!-- 소제목 끝 -->
	
	<div class="container">
		<form action="user_reservation_confirm_process.jsp" id="payFrm" method="post">
			<div style="margin-bottom: 30px;">
				<table class="member" style="width: 100%;">
					<tr>
						<th>코스 선택</th>
						<td>${ tourInfo.tourName }</td>
					</tr>
					<tr>
						<th>투어일정</th>
						<td><span><%= reserDate %></span><br>10:00 ~ 16:00</td>
					</tr>
					<tr>
						<th>인원 수</th>
						<td>
							성인(${ tourInfo.adultFee }원) : <span>${ param.adultCnt }</span>명<br>
							기타(${ tourInfo.otherFee }원) : <span>${ param.otherCnt }</span>명
						</td>
					</tr>
					<tr>
						<th>예약한 좌석 번호</th>
						<td><span id="seatNumOutput"></span></td>
					</tr>
				</table>
			</div>
			
			<div style="display: flex; flex-direction: column; align-items: end; font-size: 16px;">
				<div style="width: 40%; padding-bottom: 15px; border-bottom: 1px solid grey;">
					<div style="display: flex; justify-content: space-between;">
						<div>성인 : </div>
						<div>${ tourInfo.adultFee } X <span>${ param.adultCnt }</span> = <span>${ tourInfo.adultFee*param.adultCnt }원</span></div>
					</div>
					<div style="display: flex; justify-content: space-between;">
						<div>기타 : </div>
						<div>${ tourInfo.otherFee } X <span>${ param.otherCnt }</span> = <span>${ tourInfo.otherFee*param.otherCnt }원</span></div>
					</div>
				</div>
				<div style="display: flex; justify-content: space-between;width: 40%; padding-top: 20px;">
					<div>총 지불 요금</div>
					<div><span>${ tourInfo.adultFee*param.adultCnt + tourInfo.otherFee*param.otherCnt }</span>원</div>
				</div>
			</div>
			
			<div style="display: flex; justify-content: end; margin: 20px 0;">
				<input type="hidden" name="tourNum" id="hiddTourNum" value=<%= tourNum %> />
				<input type="hidden" name="reserDate" id="hiddReserDate" value=<%= reserDate %> />
				<input type="hidden" name="adultCnt" id="hiddAdultCnt" value=${ param.adultCnt } />
				<input type="hidden" name="otherCnt" id="hiddOtherCnt" value=${ param.otherCnt } />
				
				<c:forEach var="seatNum" items="${ seatNumIn }">
				<input type="hidden" name="seatNumIn" value="${ seatNum }" />
				</c:forEach>
				<input type="button" value="결제하기" class="mainBtn" id="payBtn" style="width: 80px; height: 32px;">
			</div>
		</form>
	</div>


	<div class="site-footer">
		<div class="inner first">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-4" >
						<div class="widget" style="width:500px">
							<p style="font-size: 20px;font-weight: bold; color: red;font-style:inherit;" >매주 월요일은 정기 휴무입니다.</p>
								<p style="font-size: 60px;font-weight: bold;">Goyang Tour</p>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 " style="margin: 0 0 0 auto">
						<div class="widget" style="width:500px">
							<h3 class="heading">고양시티투어</h3>
							<ul class="list-unstyled quick-info links">
								<li class="email">goyang@com</li>
								<li class="phone">010-1234-5678</li>
								<li class="address">경기도 고양시 일산동구 장항동</li>
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
	
	<!-- 결제 확인 창 팝업 -->
	<div id="popup" class="hide popup">
		<div class="content">
			<div style="width: 450px;">
				<div style="font-size: 12px; width: 450px; height: 30px; padding-left: 10px;
				display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">투어 수정 확인</div>
				
				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
					align-items: center; height: 70px ;background-color: #f0f6f9;">정말로 결제 하시겠습니까?</div>
					
					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="확인" class="popupBtn" onclick="windowMove('popup')">
						<input type="button" value="취소" class="popupBtn" onclick="closePopup('popup')">
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


	<script type="text/javascript">
		function showPopup(hasFilter,id) {
			const popup = document.querySelector("#"+id);
			
			if (hasFilter) {
				popup.classList.add('has-filter');
			} else {
				popup.classList.remove('has-filter');
			}
				
			popup.classList.remove('hide');
		}//showPopup
		
		function closePopup(id) {
			const popup = document.querySelector("#"+id);
			popup.classList.add('hide');
		}//closePopup
		
		function windowMove(id) {
			closePopup(id);
			$("#payFrm").submit();//form submit
		}//windowMove()
		
	</script>

</body>

</html>
