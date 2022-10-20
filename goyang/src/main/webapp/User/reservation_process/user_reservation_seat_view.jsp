<%@page import="kr.co.goyang.user.vo.TourReservaVO"%>
<%@page import="kr.co.goyang.user.dao.TourReservaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.chkboxZoom{zoom:2.0;}
</style>
<!-- JQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<%
//파라미터, 세션 set
//로그인 여부
String id="";//아이디
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if

//투어번호 set
int tourNum=0;//투어 번호
if(request.getParameter("tourNum") !=null){//투어 번호 가져오기.
	tourNum = Integer.parseInt(request.getParameter("tourNum"));
}//end if

//예약일 set
String reserDate="";//예약일
if(request.getParameter("reserDate") !=null){//예약일 가져오기
	reserDate = request.getParameter("reserDate");
}//end if

//int[] seiatNumIn=null;//예약한 좌석 번호 배열

//예약된 좌석번호 set
int[] seatNum=(int[]) request.getAttribute("seatNum");
System.out.println(seatNum);
%>

<script type="text/javascript">
reaserFrmArr=null;
reaserOutpotArr=null;

$(function(){
	var totalCnt=${ param.adultCnt + param.otherCnt };//예약한 인원 수
	
	accessChk();//접근 권한 여부
	
	//예약된 좌석 선택 못하도록
	<% for(int seat: seatNum) {%>
		$("[name='seatNumIn'][value=<%=seat%>]").prop("checked", true);
		$("[name='seatNumIn'][value=<%=seat%>]").prop("disabled", true);
	<%}//end for %>
	
	setChkSeat(totalCnt);//체크된 좌석 set
	
	$("[name='seatNumIn']").click(function(){
		reaserFrmArr = new Array();
		reaserOutpotArr = new Array();
		
		setChkSeat(totalCnt);//체크된 좌석 set
		
		//확인된 체크박스만 가져와서 반복(최소화된 반복을 수행)
		$("[name='seatNumIn']:checked:not(:disabled)").each(function(){
			reaserFrmArr.push($(this).val()); //nextFrm 배열 값
			reaserOutpotArr.push($(this).val()+"번 ");//출력 배열
		});//each
		
		reaserOutpotArr.sort();//버스좌석 정렬
		
		$("#seatNumOutput").html(reaserOutpotArr);//예약한 좌석번호 화면 출력
		
	});//click
	
	$("#nextBtn").click(function(){
		seatChk(reaserFrmArr, totalCnt); //예약한 인원 수와 좌석 수가 동일한지 체크
	});//next click
	
});//ready

function accessChk(){
	
	var id="<%= id %>";
	var tourNum=<%= tourNum %>;
	var reserDate="<%= reserDate %>";
	var chkFlag=true; //true 통과, false 돌아가기
		
	if(id==""){
		alert("로그인 해주세요.");
		location.href="http://211.63.89.140/User/login_process/user_signIn.jsp";
		return;
	}else if(tourNum==0){
		alert("투어를 선택해주세요.");
		chkFlag=false;
	}else if(reserDate==""){
		alert("투어일정을 선택해주세요.");
		chkFlag=false;
	}//end else if
	
	if(!chkFlag){//필요한 파라미터 값이 없을 경우 코스 선택 페이지로 이동
		location.href="http://211.63.89.140/User/reservation_process/user_reservation_course.jsp";
	}//end if
		
}//accessChk

function setChkSeat(totalCnt){//체크된 좌석 set
	var reaserCnt=0;//체크된 좌석 수 저장 값
	
	reaserCnt=$("[name='seatNumIn']:checked:not(:disabled)").length;//체크된 좌석 수
	if(reaserCnt==totalCnt){//예약한 인원 수보다 체크된 좌석 수가 같을 때
		$("[name='seatNumIn']:not(:checked)").prop("disabled", true);
	}else {
		$("[name='seatNumIn']:not(:checked)").prop("disabled", false);
	}//end else
	
}//setSeatChk

function seatChk(reaserFrmArr, totalCnt){
	
	if(reaserFrmArr.length != totalCnt){
		alert("예약하신 인원 수와 체크된 좌석 수가 다릅니다.");
		return;
	}//end if
	
	//hidden에 값들 세팅
	$("#hiddenSeatNumIn").val(reaserFrmArr);
	
	$("#nextFrm").submit();
}//end seatChk

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
						<h1 class="mb-0">좌석 선택</h1>
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
			<li class="_sub"><strong><span>버스 좌석</span></strong></li>
			</ul>
			</div>
			<!-- 상단 투어 메뉴 끝-->
			
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
		<p style="padding-bottom: 20px;">버스 좌석 선택</p>
	</div>
	<!-- 소제목 끝 -->
	
	<div class="container">
	<form action="user_reservation_confirm.jsp" id="nextFrm" method="post">
			<div style="margin-bottom: 80px;">
				<table class="member" style="width: 100%;">
					<tr>
						<th>총 좌석</th>
						<th>예약가능</th>
					</tr>
					<tr>
						<td><span>28</span></td>
						<td><span><%= 28-seatNum.length %></span></td>
					</tr>
				</table>
			</div>
			
			<div style="position: absolute; margin-left: 20px; margin-top: -20px;"> 출입문</div>
			<div style="position: absolute; margin-left: 23px; margin-top: 120px; width: 5px;">운전자</div>
			<div style="display: flex; margin-bottom: 50px; height: 200px; justify-content: space-around;">
				<div style="display: flex; width: 85%; align-items: center; justify-content: space-around; background-color: #fafafa; border-left: 2px solid #ddd; border-right: 2px solid #ddd;">
					<div>
						<div>앞</div>
					</div>
					<div style="width: 90%; height: 100%;">
					
						<table style="width: 100%; height: 100%;">
							<tr>
								<td><input type="checkbox" name="seatNumIn" value="3" class="chkboxZoom"></td>
								<td>03</td>
								<td><input type="checkbox" name="seatNumIn" value="6" class="chkboxZoom"></td>
								<td>06</td>
								<td><input type="checkbox" name="seatNumIn" value="9" class="chkboxZoom"></td>
								<td>09</td>
								<td><input type="checkbox" name="seatNumIn" value="12" class="chkboxZoom"></td>
								<td>12</td>
								<td><input type="checkbox" name="seatNumIn" value="15" class="chkboxZoom"></td>
								<td>15</td>
								<td><input type="checkbox" name="seatNumIn" value="18" class="chkboxZoom"></td>
								<td>18</td>
								<td><input type="checkbox" name="seatNumIn" value="21" class="chkboxZoom"></td>
								<td>21</td>
								<td><input type="checkbox" name="seatNumIn" value="24" class="chkboxZoom"></td>
								<td>24</td>
								<td><input type="checkbox" name="seatNumIn" value="28" class="chkboxZoom"></td>
								<td>28</td>
							</tr>
							<tr>
								<td colspan="16"></td>
								<td><input type="checkbox" name="seatNumIn" value="27" class="chkboxZoom"></td>
								<td>27</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="seatNumIn" value="2" class="chkboxZoom"></td>
								<td>02</td>
								<td><input type="checkbox" name="seatNumIn" value="5" class="chkboxZoom"></td>
								<td>05</td>
								<td><input type="checkbox" name="seatNumIn" value="8" class="chkboxZoom"></td>
								<td>08</td>
								<td><input type="checkbox" name="seatNumIn" value="11" class="chkboxZoom"></td>
								<td>11</td>
								<td><input type="checkbox" name="seatNumIn" value="14" class="chkboxZoom"></td>
								<td>14</td>
								<td><input type="checkbox" name="seatNumIn" value="17" class="chkboxZoom"></td>
								<td>17</td>
								<td><input type="checkbox" name="seatNumIn" value="20" class="chkboxZoom"></td>
								<td>20</td>
								<td><input type="checkbox" name="seatNumIn" value="23" class="chkboxZoom"></td>
								<td>23</td>
								<td><input type="checkbox" name="seatNumIn" value="26" class="chkboxZoom"></td>
								<td>26</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="seatNumIn" value="1" class="chkboxZoom"></td>
								<td>01</td>
								<td><input type="checkbox" name="seatNumIn" value="4" class="chkboxZoom"></td>
								<td>04</td>
								<td><input type="checkbox" name="seatNumIn" value="7" class="chkboxZoom"></td>
								<td>07</td>
								<td><input type="checkbox" name="seatNumIn" value="10" class="chkboxZoom"></td>
								<td>10</td>
								<td><input type="checkbox" name="seatNumIn" value="13" class="chkboxZoom"></td>
								<td>13</td>
								<td><input type="checkbox" name="seatNumIn" value="16" class="chkboxZoom"></td>
								<td>16</td>
								<td><input type="checkbox" name="seatNumIn" value="19" class="chkboxZoom"></td>
								<td>19</td>
								<td><input type="checkbox" name="seatNumIn" value="22" class="chkboxZoom"></td>
								<td>22</td>
								<td><input type="checkbox" name="seatNumIn" value="25" class="chkboxZoom"></td>
								<td>25</td>
							</tr>
						</table>
					</div>
					<div>
						<div>뒤</div>
					</div>
				</div>
				<div style="display: flex; flex-direction: column; justify-content: end;">
					<div>
						<input type="checkbox" checked="checked" disabled="disabled"> 이미 예약된 좌석
					</div>
					<div>
						<input type="checkbox" disabled="disabled"> 예약 가능 좌석
					</div>
				</div>
			</div>
			
			<div style="margin-bottom: 100px;">
				<table class="member" style="width: 100%;">
					<tr>
						<th>예약 가능한 좌석 수</th>
						<td><span>${ param.adultCnt + param.otherCnt }</span>개</td>
					</tr>
					<tr>
						<th>예약한 좌석 번호</th>
						<td><span id="seatNumOutput"></span></td>
					</tr>
				</table>
			</div>
			
			<div style="display: flex; width: 100%; margin-bottom: 20px;">
				<div style="font-size: 25px; border-top: 2px solid #ddd;">
					<div style="padding-top: 10px;">배치선택 시<br> 유의사항</div>
				</div>
				
				<div style="width: 80%; margin-left: 40px;">
					<ul>
						<li>예약가능 좌석이 "0"인 경우 예약이 불가합니다.</li>
						<li>예약(또는 취소)단계에서 회선장애나 기타 통신장애 발생 시 예약(취소)여부를 조회를 통해 반드시 직접 확인하셔야 하며,<br> 
							확인하시지 않으신 경우에도 부도위약금이 청구될 수 있으니 유의하시기 바랍니다.</li>
						<li>미 예약 상태이며 예약시 선택하셨던 좌석은 최소 20분간은 선택 할 수 없습니다.</li>
						<li>예약을 하시려면 다른 좌석으로 선택 또는 최소 20분 후에 좌석을 선택하시면 됩니다.</li>
					</ul>
				</div>
			</div>
			
			<div style="display: flex; justify-content: end; margin-bottom: 100px;">
				<input type="hidden" name="tourNum" id="hiddenTourNum" value="<%= tourNum %>"/>
				<input type="hidden" name="reserDate" id="hiddenReserDate" value=<%= reserDate %> />
				<input type="hidden" name="adultCnt" id="hiddenAdultCnt" value="${ param.adultCnt }"/>
				<input type="hidden" name="otherCnt" id="hiddenOtherCnt" value="${ param.otherCnt }"/>
				<input type="hidden" name="seatNumIn" id="hiddenSeatNumIn" value=""/>
				<input type="button" id="nextBtn" class="mainBtn" value="다음" style="width: 80px; height: 32px;">
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
			display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">버스 좌석 수 확인</div>
			
			<div style="background-color: #f0f6f9;">
				<div style="font-size: 16px; display: flex; justify-content: center; 
				align-items: center; height: 70px ;background-color: #f0f6f9;">예약 가능한 좌석 수와 예약한 좌석 수가 일치하지 않습니다.</div>
				
				<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
					<input type="button" value="확인" class="popupBtn" onclick="closePopup('popup')">
				</div>
			</div>
		</div>
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
		}
		
		function closePopup(id) {
			const popup = document.querySelector("#"+id);
			popup.classList.add('hide');
		}
		
	</script>
</body>

</html>
