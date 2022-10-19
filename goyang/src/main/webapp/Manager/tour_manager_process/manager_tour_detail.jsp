<%@page import="java.io.Console"%>
<%@page import="kr.co.goyang.manager.dao.TourManagerDAO"%>
<%@page import="kr.co.goyang.manager.vo.TourManagerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
  <link rel="shortcut icon" href="favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="bootstrap, bootstrap4" />

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="../../css/bootstrap.min.css">
  <link rel="stylesheet" href="../../css/owl.carousel.min.css">
  <link rel="stylesheet" href="../../css/owl.theme.default.min.css">
  <link rel="stylesheet" href="../../css/jquery.fancybox.min.css">
  <link rel="stylesheet" href="../../fonts/icomoon/style.css">
  <link rel="stylesheet" href="../../fonts/flaticon/font/flaticon.css">
  <link rel="stylesheet" href="../../css/daterangepicker.css">
  <link rel="stylesheet" href="../../css/aos.css">
  <link rel="stylesheet" href="../../css/style.css">

  <title>관리자화면-투어관리</title>
  
<style type="text/css">
#container{width:1000px;margin: 0px auto;}
.floatRight{float:right}
.floatLeft{float:left}
.centerText{text-align: center}
.rightText{text-align: right}
.centerAlign{margin: 0px auto;}
.tableSize{width:1000px;margin: 0px auto;}
.textSize{width: 1008px; height: 40px;}
.imgSize{width: 300px; height: 200px; border:1px solid #333;}
.margin20{margin: 20px;}
.marginLR10{margin : 10px 0px 10px 20px}
.inputBorderNone{border:0px none;}
</style>

<!-- google jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
<%
//파라미터, 세선 set
//로그인
String manageId="";//아이디
if(session.getAttribute("manageId") !=null){//세션에서 아이디 가져오기.
	manageId = (String) session.getAttribute("manageId");
}//end if

//투어번호
int tourNum=0;
if(request.getParameter("tourNum") !=null){//세션에서 아이디 가져오기.
	tourNum = Integer.parseInt(request.getParameter("tourNum"));
}//end if
%>

$(function(){
	accessChk();//접근 권한 체크
});//ready

function accessChk(){
	var Msess="<%= manageId %>";
	var tourNum=<%= tourNum %>;
	
	if(Msess==""){
		alert("로그인 해주세요.");
		location.href="http://211.63.89.140/Manager/login_manager/manager_signIn.jsp";
		return;
	}//end if
	
	if(tourNum==null){
		alert("투어를 선택해주세요.");
		location.href="http://211.63.89.140/Manager/tour_manager_process/manager_tour_manager.jsp";
		return;
	}//end if
	
}//accessChk

</script>
</head>

<body>
  <!-- header -->

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
					<li><a href="../user_manager_process/manager_member.jsp">회원관리</a></li>
					<li><a href="manager_tour_manager.jsp">투어관리</a></li>
					<li><a href="../reservation_manager_process/manager_reservation.jsp">예약관리</a></li>
					<li><a href="../spot_manager_process/manager_spot_list.jsp">관광지 관리</a></li>
					<li><a href="../review_manager_process/manager_review.jsp">후기관리</a></li>
				</ul>

				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li></li>
					<li style="font-size: 5px; font-weight: bold;"><a
						href="../login_manager/manager_signIn.jsp">로그아웃&nbsp;&nbsp;&nbsp;<%=manageId %>관리자님</a></li>
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
						<h1 class="mb-0">관리자 화면</h1>
						<!-- <p class="text-white">로그인을 해주세요.</p> -->
					</div>
				</div>
			</div>
		</div>
	</div>



  <!-- container -->
  
  <!-- 대제목 -->
	<div class="container" style="margin-top: 20px;">
		<img src="../../images/bullet_Tues_sub_style_green.png" alt=image>
		<p
			style="font-size: 20px; font-weight: bold; padding-top: 20px; margin-bottom: 0;">투어 정보 상세보기</p>
	</div>
	<!-- 대제목 끝 -->

	<!-- 라인 구분 선 -->
	<div class="container">
		<!-- <div class="col-lg-6 text-center"> -->
		<h2 class="section-sub-title text-center mb-3"></h2>
		<!-- </div> -->
	</div>
	<!-- 라인 구분 선 끝-->
	
  <div class="container">
  <!-- <div style="font-size: 20px; margin: 50px 0px 10px 0px">투어 정보 상세보기</div>
  <hr> -->
  <%
  TourManagerDAO tmDAO=TourManagerDAO.getInstance();
  TourManagerVO tourInfo=tmDAO.selectTourDetail(tourNum);
  
  pageContext.setAttribute("tourInfo", tourInfo);
  %>
  <div><!-- 전체 테이블 -->
  <c:if test="${ tourInfo.runFlag ne 1 }">
  	<div><span style="color: red; font-size: 12px;">*현재 종료된 투어입니다.</span></div>
  </c:if>
  <table class="member">
  <tr>
   <th><span><strong>코스명</strong></span></th>
   <td><span class="margin20">${ tourInfo.tourName }</span></td>
  </tr>
  <tr>
   <th><span><strong>요약 설명</strong></span></th>
   <td><span class="margin20">${ tourInfo.explain }</span></td>
  </tr>
  <tr>
   <th><span><strong>사진</strong></span></th>
   <td><div class="imgSize"><img class="imgSize" name="thumImg" src="http://211.63.89.140/images/${ tourInfo.thumImg }"></div></td>
  </tr>
  <tr><!-- 관광지 등록 -->
   <th><span><strong>코스</strong></span></th>
   <td>
    <div style="text-align: right">
     <span><strong>중심 위도, 경도</strong></span>
     <span class="margin20">${ tourInfo.mapCenLati }, ${ tourInfo.mapCenLong }</span><br/>
    </div>
   	<table class="member tableSize">
  	<tr>
  		<th>순번</th>
  		<th>경유지명/내용</th>
  		<th>시간</th>
  		<th>위도, 경도</th>
  	</tr>
  	<%
  	List<TourManagerVO> tourSportList=tmDAO.selectTourSpots(tourNum);
  	pageContext.setAttribute("tourSportList", tourSportList);
  	%>
	<c:forEach var="tourSport" items="${ tourSportList }">	
  	<tr>
  		<td>${ tourSport.tourOrder }</td>
  		<td>${ tourSport.spotName }</td>
  		<td>${ tourSport.startHour }-${ tourSport.endHour }</td>
  		<td>${ tourSport.mapSpoLati }, ${ tourSport.mapSpoLong }</td>
  	</tr>
  	</c:forEach>  
  </table>
   </td>
  </tr>
  <tr>
   <th><span><strong>탑승료</strong></span><br/><span style="font-size: 13px">(단위:원)</span></th>
   <td>
   <div style="text-align: left">
    <span><strong>성인: </strong></span><span> ${ tourInfo.adultFee } <strong>원</strong></span><br/>
    <span><strong>기타: </strong></span><span> ${ tourInfo.otherFee } <strong>원</strong></span>
   </div>
   </td>
  </tr>
  </table>
  </div><!-- 전체 테이블 끝 -->
  
  <div style="display: flex; justify-content: end; margin-bottom: 5px; margin-top: 20px;">
   <div class="marginLR10">
     <input type="button" value="종료하기" class="mainBtn" onclick="showPopup(true,'popup')"/>
   </div>
   <div class="marginLR10">
     <input type="button" value="수정하기" class="mainBtn" onclick="location.href='manager_tour_rectify.jsp?tourNum=<%= tourNum %>'"/>
   </div>
  </div>
  
  </div><!-- container -->
  
  <!-- footer -->

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
	
	<!-- 투어 종료 확인 팝업 popup -->
	<div id="popup" class="hide popup">
		<div class="content">
			<div style="width: 450px;">
				<div style="font-size: 12px; width: 450px; height: 30px; padding-left: 10px;
				display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">투어 수정 확인</div>
				
				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center;
					align-items: center; height: 70px ;background-color: #f0f6f9;">해당 투어를 종료하시겠습니까?</div>
					
					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="종료" class="popupBtn" onclick="windowMove('popup')">
						<input type="button" value="취소" class="popupBtn" onclick="closePopup('popup')">
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
		}//showPopup
		
		function closePopup(id) {
			const popup = document.querySelector("#"+id);
			popup.classList.add('hide');
		}//closePopup
		
		function windowMove(id) {
			closePopup(id);
			location.href="manager_tour_down_process.jsp?tourNum=<%= tourNum %>"
		}//windowMove()
		
	</script>
	
</body>

</html>
