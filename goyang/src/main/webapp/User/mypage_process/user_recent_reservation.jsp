<%@page import="kr.co.goyang.user.vo.MyInfoVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.goyang.user.dao.MyInfoDAO"%>
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

<!-- google jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<%
String id="";//아이디
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if

//비밀번호 확인 여부
String passFlag="fail";//로그인 한 경우
if(session.getAttribute("passFlag") !=null){//"pass"=접근 허용  // "fail"=접근 불가
	passFlag = (String) session.getAttribute("passFlag");
}//end if
%>

<script type="text/javascript">
$(function(){
	accessChk();//접근 권한 확인
	
	pageClick(1);//초기 리스트 set
});//ready

function accessChk(){
	var id="<%= id %>";
	var passFlag="<%= passFlag %>";
		
	if(id==""){
		alert("로그인 해주세요.");
		location.href="http://localhost/goyang/User/login_process/user_signIn.jsp";
		return;
	}//end if
	
	if(passFlag=="fail"){
		alert("비밀번호 확인을 해주세요.");
		location.href="http://localhost/goyang/User/login_process/user_mypage_inner.jsp";
		return;
	}//end if
	
}//accessChk

function pageClick(page){
	$.ajax({
		url:"user_my_reservation_process.jsp",
		data:"page="+page,
		type:"get",
		dataType:"json",
		error:function( xhr ){
			$("#tableDiv").show();
			/* $("#tableDiv").html(xhr.status); */
			$("#tableDiv").html("처리 중 문제가 발생 했습니다. 다시 시도해 주세요.");
		},
		success:function(jsonObj){
				/* 페이징 테이블 */
				$("#tableDiv").show();
				var tbOutput="<table class='member' style='width: 100%'>";
				tbOutput+="<tr><th>예약번호</th><th>투어 시작 날짜</th><th>예약 신청 날짜</th><th>투어 코스</th><th>인원</th><th>예약 상태</th><th></th></tr>";
				if(!jsonObj.isEmpty){
					$(jsonObj.list).each(function(i, json){
						tbOutput+="<tr>";
						tbOutput+="<td>"+json.reserNum+"</td>";
						tbOutput+="<td>"+json.reserDate+"</td>";
						tbOutput+="<td>"+json.reserRegist+"</td>";
						tbOutput+="<td>"+json.tourName+"</td>";
						tbOutput+="<td>성인("+json.adultFee+"원) : "+json.adultCnt+"명<br/>";
						tbOutput+="	 기타("+json.otherFee+"원) : "+json.otherCnt+"명</td>";
						tbOutput+="<td><span>"+json.reserInfo+"</span></td>";
						tbOutput+="<td><input type='button' value='상세보기' class='mainBtn' onclick='detailPopup("+json.reserNum+")'/></td>";
						tbOutput+="</tr>";
					});//each
				}else {
					tbOutput+="<tr><td colspan='5'>데이터가 존재하지 않습니다.</td></tr>";
				}//end else
				tbOutput+="</table>";
					
				$("#tableDiv").html(tbOutput);
				/* 페이징 버튼 */
				var pgOutput="<nav><ul class='pagination justify-content-center'>";
				if( jsonObj.startPage != 1 ) {
					pgOutput+="<li class='page-item'><a class='page-link'";
					pgOutput+="href='#void' onclick='pageClick("+ (jsonObj.startPage-1) +")' tabindex='-1'";
					pgOutput+="aria-disabled='true'>&lt;<!-- < --></a></li>";
				}//end if
				for(var i=jsonObj.startPage;i<=jsonObj.endPage;i++){
					pgOutput+="<li class='page-item'>"
					pgOutput+="<a class='page-link href='#void' onclick='pageClick("+ i +")'>"+ i +"</a></li>";
				}//end for
				if(jsonObj.totalPages != jsonObj.endPage) {
					pgOutput+="<li class='page-item'>";
					pgOutput+="<a class='page-link' href='#void' onclick='pageClick("+ (jsonObj.endPage + 1) +")'>&gt;<!-- > --></a></li>"
				}//end if
				pgOutput+="</ul></nav>";
				
				$("#pageDiv").html(pgOutput);
		}//success
	});//ajax
}//pageClick

function detailPopup(reserNum){
	var leftVal=(document.body.offsetWidth / 2) - (200 / 2);
	var topVal=(window.screen.height / 2) - (300 / 2);
	window.open("resDetailPopup.jsp?reserNum="+reserNum, "상세보기", "width=800, height=500, left="+leftVal+", top="+topVal+"");
}//recPopup
               
/* function changePage(value){                     
	if(value == "0"){ 								// HOME 버튼 클릭시 첫화면으로 이동                          
		location.href="../main/index.jsp";            
	}else if(value == "1"){						// 로그아웃 버튼 클릭시 로그아웃 처리            
		location.href="member/pro/LogoutPro.jsp";            
	}else if(value == "2"){   					// 마이페이지 버튼 클릭시 회원정보 보여주는 화면으로 이동                          
		location.href="user_mypage_inner.jsp";            
	}       
}     */
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
				<a href="../main/index.jsp" class="logo m-0">고양<span class="text-primary">.</span></a>

				<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-center" >
					<li class="active"><a href="../main/index.jsp">home</a></li>
					<li><a href="../reservation_process/user_reservation_course.jsp">투어예약</a></li>
					<li><a href="../spot_process/user_introduceTour.jsp">관광지소개</a></li>
					<li><a href="../review_process/user_review.jsp">관광지후기</a></li>
					<li><a href="user_mypage_inner.jsp">마이페이지</a></li>
				</ul>
			    <ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li></li>
					<li style="font-size: 5px; font-weight: bold;"><a href="../login_process/user_logout.jsp">로그아웃</a></li>
				</ul>

				<a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light" data-toggle="collapse" data-target="#main-navbar">
					<span></span>
				</a>
			</div>
		</div>
	</nav>

 <div class="hero">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6 mx-auto text-center">
          <div class="intro-wrap">
            <h1 class="mb-0">최근 예매 조회</h1>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- 상단 투어 메뉴 -->
	<div class="untree_co-section">
		<ul class="list_sub_menu">
			<li class="_sub"><a href="user_mypage.jsp"> <span>내 정보</span>
			</a></li>
			<li class="_sub"><a href="user_recent_reservation.jsp"> <span>최근 예매 조회</span>
			</a></li>
			<li class="_sub"><a href="user_my_review.jsp"> <span>내 후기</span>
			</a></li>
			<li class="_sub"><a href="user_my_comment.jsp"> <span
					class="menu_text">내 댓글</span>
			</a></li>
			</ul>
			</div>
			<!-- 상단 투어 메뉴 끝-->
			
				<!-- 대제목 -->
	<div class="container">
		<img src="../../images/bullet_Tues_sub_style_blue.png" alt="image">
		<p
			style="font-size: 20px; font-weight: bold; padding-top: 20px; margin-bottom: 0;">최근 예매 조회</p>
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
			<div style="font-size:23px;  display:flex; justify-content:space-between;">
				<!-- <div style="font-weight: bold;"> 최근 예매 조회 </div> -->
			</div>		
			<!-- <hr style="margin-bottom:50px;">	 -->
				
 			<div id="tableDiv" style="margin: 50px 0 20px 0">
				<!-- ajax 내 예약 관리 테이블 -->
			</div>
			<div id="pageDiv" style="margin: 20px 0px 20px; display: flex; justify-content: center; width: 100%; height: 32px;"><!-- 페이지 블럭 -->
				<!-- ajax 내 예약 관리 패이징 버튼 -->
			</div>
	</div>	

	
  <div class="site-footer">
    <div class="inner first">
	  <div class="container">
	    <div class="row">
	 	  <div class="col-md-6 col-lg-4" >
			<div class="widget">
				<p style="font-size:20px; font-weight:bold; color:red; font-style:inherit;" >매주 월요일은 정기 휴무입니다.</p>
				<p style="font-size:50px; font-weight:bold;">Goyang Tour</p>
				 </div>
				 
            <div class="widget">
            </div>
          	</div>
          	<div class="col-md-6 col-lg-2 pl-lg-5">
            <div class="widget">
            </div>
          	</div>
          	<div class="col-md-6 col-lg-2">
            <div class="widget">
            
            
            </div>
          </div>
          <div class="col-md-6 col-lg-4">
            <div class="widget">
              <h3 class="heading">고양시티투어 | 3조</h3>
              <ul class="list-unstyled quick-info links">
                <li class="email"><a href="mailto:goyang@com">goyang@com</a></li>
                <li class="phone"><a href="tel:010-1234-5678">010-1234-5678</a></li>
                <li class="address"><a href="#" class="link-highlight">경기도 고양시 일산동구 장항동</a></li><!-- 지도 링크 -->
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
            <p>사업자 등록번호 : 123-45-678 통신판매업신고번호 | <a href="#" class="link-highlight">신고하기</a>
            </p>
          </div>
          
        </div>
      </div>
    </div>
  </div>

	<!-- 예약취소사유작성 팝업 - popup -->
	<div id="popup" class="hide popup">
		<div class="content">
			<div style="width: 415px;">
				<div style="font-size: 12px; width: 415px; height: 30px; padding-left: 10px;
				display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">예약취소사유</div>
				
				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
					align-items: center; height: 70px ;background-color: #f0f6f9;">
					<textarea placeholder="취소사유를 입력해주세요." style=" margin-top:20px; width:400px; height:70px; border:1px solid #ddd;"></textarea>
					</div>
					
					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="submit" value="확인" class="popupBtn" onclick="showPopup(true,'popup2')">
						<input type="button" value="취소" class="popupBtn" onclick="closePopup('popup')">
					</div>
				</div>
			</div>
	  </div>
	</div>
	
	<!-- 예약취소 신청 완료- popup2 -->
	<div id="popup2" class="hide popup">
	  <div class="content">
		<div style="width: 415px;">
			<div style="font-size: 12px; width: 415px; height: 30px; padding-left: 10px;
			display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">예약취소 신청완료</div>
			
			<div style="background-color: #f0f6f9;">
				<div style="font-size: 16px; display: flex; justify-content: center; 
				align-items: center; height: 70px ;background-color: #f0f6f9;">취소신청이 완료되었습니다.<br>승인 후 환불이 완료되기까지 약 2~3일 소요됩니다.</div>
				
				<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
					<input type="button" value="확인" class="popupBtn" onclick="closePopup('popup2')">
				</div>
			</div>
		</div>
	  </div>
	</div>
	
	 <!-- 예약 상세보기 popup3 -->
	<div id="popup3" class="hide popup">
		<div class="content">
			<div style="font-weight: bold; font-size: 15px; width: 800px; height: 40px; padding-left: 15px;
			display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">예약 상세보기</div>
		
		<div style="width: 800px">
			<table class="member" style="width: 100%">
				<tr>
					<th>예약자명</th>
					<td>홍다영</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>hhh123@naver.com</td>
				</tr>
				<tr>
					<th>휴대폰 번호</th>
					<td>010-1234-5678</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>2022.09.13</td>
				</tr>
				<tr>
					<th>투어코스</th>
					<td>화요나들이(벽제)</td>
				</tr>
				<tr>
					<th>인원수 </th>
					<td>성인(6,000원) : 2명, 기타(4,000원) : 0명</td>
				</tr>
				<tr>
					<th>예약 좌석번호</th>
					<td>3, 4</td>
				</tr>
				<tr>
					<th>취소 사유</th>
					<td>일기예보에 비가 주륵주륵</td>
				</tr>
			</table>
		</div>
		
		<div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
			<input type="button" value="확인" class="popupBtn" onclick="closePopup('popup3')" class="button111">
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

<!-- 팝업 -->
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
