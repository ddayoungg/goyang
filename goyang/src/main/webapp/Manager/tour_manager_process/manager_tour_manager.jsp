<%@page import="java.util.List"%>
<%@page import="kr.co.goyang.manager.vo.TourManagerVO"%>
<%@page import="kr.co.goyang.manager.dao.TourManagerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
#tableDiv{width: 100%;}
</style>

<!-- google jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<%
//로그인 여부
String manageId="";//아이디
if(session.getAttribute("manageId") !=null){//세션에서 아이디 가져오기.
	manageId = (String) session.getAttribute("manageId");
}//end if

TourManagerDAO tmDAO=TourManagerDAO.getInstance();
TourManagerVO tmVO=new TourManagerVO();

%>

<script type="text/javascript">

$(function(){
	
	var listSearch=$("#listSearch").val();//코스명, 코스번호
	var textSearch=$("#textSearch").val().trim();//검색 input text
	
	accessChk();//접근 권한 확인
	
	tourList(listSearch, textSearch);//초기 화면 set
	
	$("#searchBtn").click(function() { //투어 검색
		listSearch=$("#listSearch").val();
		textSearch=$("#textSearch").val().trim();	
	
		if(typeChk(listSearch, textSearch)){//코스번호 일때 text 타입이 숫자인지 확인
			alert("숫자를 입력해주세요.");
			return;
		}//end if
		
		tourList(listSearch, textSearch);//검색 ajax 호출
		
	});//click
	
	$("#textSearch").keydown(function(keyNum){
		//현재의 키보드의 입력값을 keyNum으로 받음
		if(keyNum.keyCode == 13){ //keyCode=13 : Enter
			$("#searchBtn").click()	
		}//end if
	});//keydown
	
	$("#addBtn").click(function(){//투어 추가 페이지로 이동
		location.href="manager_tour_add.jsp";
	});//click
	
});//ready

function accessChk(){
	var Msess="<%= manageId %>";
	
	if(Msess==""){
		alert("로그인 해주세요.");
		location.href="http://211.63.89.140/Manager/login_manager/manager_signIn.jsp";
		return;
	}//end if
	
}//accessChk

function tourList(listSearch, textSearch){
	$.ajax({
		url:"manager_tour_manager_process.jsp",
		data:"listSearch="+listSearch+"&textSearch="+textSearch,
		type:"get",
		dataType:"json",
		error:function( xhr ){
			$("#tableDiv").show();
			$("#tableDiv").html("처리 중 문제가 발생 했습니다. 다시 시도해 주세요.");
		},
		success:function(jsonObj){
			$("#tableDiv").show();
			
			var output="<table class='member' style='width: 100%'>";
			output+="<tr><th>투어번호</th><th>투어명</th><th>시간</th><th>요금</th><th></th></tr>";
			if(!jsonObj.isEmpty){
				$(jsonObj.list).each(function(i, json){
					output+="<tr>";
					output+="<td>"+json.tourNum+"</td>";
					output+="<td>"+json.tourName+"</td>";
					output+="<td>10:00-16:00</td>";
					output+="<td>성인: "+json.adultFee+"원<br/>기타: "+json.otherFee+"원</td>";
					output+="<td><input type='button' value='상세보기' class='mainBtn' onclick=\"location.href='manager_tour_detail.jsp?tourNum="+json.tourNum+"'\"/></td>";
					output+="</tr>";
				});//each
			}else {
				output+="<tr><td colspan='5'>데이터가 존재하지 않습니다.</td></tr>";
			}//end else
			output+="</table>";
				
			$("#tableDiv").html(output);
			$("#totalCnt").html($(jsonObj.list).length);
		}//success
	});//ajax
}//tourList

function typeChk(listSearch, textSearch){
	var flag=false;
	
	var textSearch=parseInt(textSearch);//String을 Int로 변경
	
	if(listSearch=="tourNum" && typeof(textSearch)!="number"){
		flag=true;
	}//end if
	
	return flag;
}//typeChk

</script>

<title>관리자화면-투어관리</title>
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
						<h1 class="mb-0">투어 관리</h1>
						<!-- <p class="text-white">로그인을 해주세요.</p> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--  여기사이에 구상하시면 됩니다!!! -->
	
	<!-- 대제목 -->
	<div class="container" style="margin-top: 20px;">
		<img src="E:/web_service_goyang/images/bullet_Tues_sub_style_green.png" alt=image>
		<p
			style="font-size: 20px; font-weight: bold; padding-top: 20px; margin-bottom: 0;">투어 정보 관리</p>
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
			<!-- <div style="font-size: 20px; margin: 50px 0px 10px 0px">투어 정보 관리</div>
			<hr> -->
		
			<div>
				<div style="display: flex; justify-content: end; margin-bottom: 5px; margin-top: 20px;">
					<select id="listSearch" name="listSearch">
     					<option value="tourName" selected>투어명</option>
     					<option value="tourNum">투어번호</option>
    				</select>
					<input type="text" id="textSearch" name="textSearch" placeholder="내용을 입력하세요." value="<%  %>">
					<input type="button" id="searchBtn" value="검색" class="mainBtn">
				</div>
				<div id="tableDiv">
				<!-- ajax로 투어를 테이블로 표시 -->
				</div>
			</div>
			
			<div style="display: flex; justify-content: end; align-items: center;">
				<div >
					총 <span id="totalCnt"></span>건
				</div>
			</div>
			<div style="display: flex; justify-content: end; margin-bottom: 5px; margin-top: 20px;">
			  <input type="button" value="추가하기" class="mainBtn" id="addBtn"/>
			</div>
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

</body>

</html>
