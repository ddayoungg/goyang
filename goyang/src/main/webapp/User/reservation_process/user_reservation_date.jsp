<%@page import="kr.co.goyang.user.vo.TourReservaVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.goyang.user.dao.TourReservaDAO"%>
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

<%
//파라미터, 세션 set
//로그인 여부
String id="";//아이디
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if

//파라미터 투어 번호 set
int tourNum=0;
if(request.getParameter("tourNum") !=null){//투어번호 가져오기.
	tourNum = Integer.parseInt(request.getParameter("tourNum"));
}//end if

%>
<script type="text/javascript">
selLen=0;//예약 가능한 인원 수

$( function() {
	
	var reserDate="";//예약 날짜
	
	accessChk();//접근 권한 여부
	
    $( "#datepicker" ).datepicker({
    	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    	  dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
    	  monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
    	  dateFormat: "yy-mm-dd",
    	  minDate: 1
   	, 
    beforeShowDay: function(date){
		var day = date.getDay();
		return [(day == <%= (tourNum+1)%7 %>)];
    },
    onSelect:function(selectDay){
    	reserDate=selectDay;//선택한 날짜를 예약 날짜에 set                          
	    
	    $.ajax({
	    	url:"user_reservation_resCnt_process.jsp",
	    	data:"reserDate="+reserDate+"&tourNum=<%= tourNum %>",
	    	dataType:"json",
	    	error:function( xhr ){
	    		$("#resCnt").html("처리 중 오류 발생했습니다.");
	    	},
	    	success:function( data ){
	    		
	    		var resCnt=data.resCnt+"명";
	    		
	    		if(data.resCnt==0) {
	    			resCnt="죄송합니다. 해당 예약은 모두 찼습니다.";
	    		}//end if
	    		
	    		$("#resCnt").html(resCnt);
	    		
	    		selLen=5;//최대 5명까지 예약 가능
	    		
	    		if(data.resCnt<5) { //예약 가능한 인원 수가 5보다 작을 경우
	    			selLen=data.resCnt;
	    		}//end if
	    		
	    		var adultCntOutput=setSelectCnt(0, selLen, "selAdultCnt");//출력할 select문 set(기본값, 예약가능한 인원 수, select태그 id)
	    		var otherCntOutput=setSelectCnt(0, selLen, "selOtherCnt");//출력할 select문 set(기본값, 예약가능한 인원 수, select태그 id)
	    		
	    		$("#selAdultCntDiv").html(adultCntOutput);
	    		$("#selOtherCntDiv").html(otherCntOutput);
	    	}//success
	    });//ajax
	    
	    setDate(reserDate);//선택한 날짜를 표시
	    
    }//onSelect
    });//datepicker
      
    $(document).on("change", "#selAdultCnt", function(e){//5-기타 인원 수=예약 가능한 인원 수
    	var selTemp=(selLen-$("#selAdultCnt").val());
    	
		var otherCntOutput=setSelectCnt($("#selOtherCnt").val(), selTemp, "selOtherCnt");//출력할 select문 set 
		
		$("#selOtherCntDiv").html(otherCntOutput);
      });//change
      
    $(document).on("change", "#selOtherCnt", function(e){//5-성인 인원 수=예약 가능한 인원 수
    	var selTemp=(selLen-$("#selOtherCnt").val());
    	
		var adultCntOutput=setSelectCnt($("#selAdultCnt").val(), selTemp, "selAdultCnt");//출력할 select문 set 
		
		$("#selAdultCntDiv").html(adultCntOutput);
      });//change
    
      $("#nextBtn").click(function(){ // 다음 버튼 누를 시
    	  
    	  chkNull(reserDate);//일정 선택, 인원 선택, 예약 가능한 인원 유효성 검사
    	  
      });//click
});//ready
  
function accessChk(){
	var id="<%= id %>";
	var tourNum=<%= tourNum %>;
		
	if(id==""){
		alert("로그인 해주세요.");
		location.href="http://211.63.89.140/User/login_process/user_signIn.jsp";
		return;
	}//end if
	
	if(tourNum==0){
		alert("투어를 선택해주세요.");
		location.href="http://211.63.89.140/User/reservation_process/user_reservation_course.jsp";
		return;
	}//end if
		
}//accessChk

function setSelectCnt(CntVal,selLen, id){
	var selOutput="<select id='"+id+"'>";//select 출력
	var temp="";
	for(var i=0;i<selLen+1;i++){//예약 가능한 인원 수 0~5까지
		temp=(CntVal==i?'selected':'');
		selOutput+="<option value="+i+" "+temp+">"+i+"명</option>";
	}//end for
	selOutput+="</select>"
	
	return selOutput;
}//setSelectCnt

function setDate(reserDate){
	 $( "#datepicker" ).datepicker('setDate', reserDate); //지정한 날짜
	    
	    //지정한 날짜 셋팅 시작
	    var arr=reserDate.split("-");
	    var month=arr[1];
	    var day=arr[2];
	    
	    var dateOutput=month+"월 "+day+"일 "
	    $("#dateOutput").html(dateOutput);
}//end setDate

function chkNull(reserDate){
	  var adultCnt=$("#selAdultCnt").val();
	  var otherCnt=$("#selOtherCnt").val();
	  
	  if(reserDate==""){//일정 선택하지 않을 경우
		  showPopup(true,'popup');
		  return;
	  }//end if
	  
	  if(parseInt($("#possibleCnt").val())<(adultCnt+otherCnt)) {//예약 가능한 인원 수보다 많을 경우
		  alert("예약 가능한 인원 수보다 많습니다.")
		  return;
	  }//end if
	  
	  if(adultCnt==0 && otherCnt==0) { //성인과 기타 인원 둘 다 0일 경우
		  showPopup(true,'popup2');
	  	  return;
	  }//end if
	  
	  //nextFrm의 hidden 세팅
	  $("#hiddAdultCnt").val(adultCnt); //선택한 성인 인원 수 hidden에 값 세팅
	  $("#hiddOtherCnt").val(otherCnt); //선택한 기타 인원 수 hidden에 값 세팅
	  $("#hiddReserDate").val(reserDate); //선택한 예약일 hidden에 값 세팅 
	  
	  $("#nextFrm").submit();
}//chkNull
  </script>
<!-- datapicker 끝 -->

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
						<h1 class="mb-0">일정 선택</h1>
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
			<li class="_sub"><strong><span>투어 일정</span></strong></li>
			</ul>
			</div>
	<!-- 상단 투어 메뉴 끝 -->
	<%
	TourReservaDAO trDAO = TourReservaDAO.getInstance();
	
	TourReservaVO tourInfo=trDAO.selectTourInfo(tourNum);//투어 번호에 대한 투어 정보 출력하는 메소드
	pageContext.setAttribute("tourInfo", tourInfo);
	%>
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
		<p style="padding-bottom: 20px;">
			일정 및 인원 선택
		</p>
	</div>
	<!-- 소제목 끝 -->
	
	<div class="container">
		<!-- 	<div style="padding-bottom: 15px; border-bottom:1px solid grey; font-size: 23px;margin: 50px 0px 10px 0px;display: flex;justify-content: space-between;">
				<div> 화요나들이(벽제)</div>
			</div>
			
			<div style="padding-bottom: 15px; border-bottom:1px solid grey; font-size: 18px;margin: 50px 0px 50px 0px;display: flex;justify-content: space-between;">
				<div> 일정 및 인원 선택</div>
			</div> -->
			<!-- 다음 form 시작 -->
			<form action="user_reservation_seat.jsp" method="post" id="nextFrm">
			
			<div style="display: flex; justify-content: space-around; padding: 0 130px;">
				<div>
					<div id="datepicker"></div>
				</div>
				<div style="display: flex; flex-direction: column; justify-content: space-around;">
					<div>
						<div style="font-size: 13px;"><span><strong>투어 일정: </strong></span><span id="dateOutput">투어 일정을 선택해주세요.</span></div>
						<div><span style="font-size: 13px;"><strong>시간: </strong></span><span style="font-size: 13px;">10:00 ~ 16:00</span></div>
						<div><span style="color: red; font-size: 12px;">*시간은 10:00 ~ 16:00으로 고정 입니다.</span></div>
					</div>
					<div>
						<div><span style="font-size: 13px; margin-bottom: 5px; padding-left: 10px;">예약 가능한 인원 수 :</span>  <span id="resCnt" style="font-size: 15px;"></span></div>
						<div style="color: red; margin-bottom: 25px; font-size: 12px;">*한번에 예약 가능한 최대 인원 수는 성인, 기타 인원 합쳐서 5명까지 가능합니다.</div>
						<div style="display: flex; align-items: center; padding-bottom: 15px;">
							<div style="padding-right: 20px;">성인 : ${ tourInfo.adultFee }원</div>
							<div id="selAdultCntDiv">
								<!-- ajax로 성인 인원 수 선택 가능한 <select> -->
							</div>
						</div>
						<div style="display: flex; align-items: center;">
							<div style="padding-right: 20px;">기타 : ${ tourInfo.otherFee }원</div>
							<div id="selOtherCntDiv">
								<!-- ajax로 기타 인원 수 선택 가능한 <select> -->
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div style="display: flex; justify-content: end; margin: 20px 0 100px 0;">
			
			<input type="hidden" name="tourNum" value="<%= tourNum %>"/> <!-- 다음 frm 투어 번호-->
			<input type="hidden" name="reserDate" id="hiddReserDate"/> <!-- 다음 frm 예약일 -->
			<input type="hidden" name="adultCnt" id="hiddAdultCnt" value="0" /> <!-- 다음 frm 성인 인원 수 -->
			<input type="hidden" name="otherCnt" id="hiddOtherCnt" value="0" /> <!-- 다음 frm 기타 인원 수 -->
			<input type="hidden" name="seatNum" id="hiddSeatNum" value="0" /> <!-- 다음 frm 예약된 좌석번호 -->
				<input type="button" value="다음" class="mainBtn" id="nextBtn">
			</div>
			
		</form>
		<!-- 다음 form 끝 -->
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
					<input type="button" value="확인" class="popupBtn" onclick="closePopup('popup2')">
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
