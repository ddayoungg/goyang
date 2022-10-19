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
String id="";
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
	
	$("#confirmBtn").click(function(){
		passChk();//패스워드 입력 사항 체크
	});//click
	
})//reday

function accessChk(){
	var id="<%= id %>";
	var passFlag="<%= passFlag %>";
		
	if(id==""){
		alert("로그인 해주세요.");
		location.href="http://211.63.89.140/User/login_process/user_signIn.jsp";
		return;
	}//end if
	
	if(passFlag=="pass"){
		location.href="http://211.63.89.140/User/mypage_process/user_mypage.jsp";
		return;
	}//end if
	
}//accessChk

function passChk() {
	
	if($("#password").val().trim()==""){//비밀번호를 입력 안할 경우
		$("#passMsg").html("비밀번호를 입력해 주세요.");
		$("#password").val("");//초기화
		$("#password").focus();
		return;
	}//end if
	
	$("#passFrm").submit();
}//passChk

           
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
            <h1 class="mb-0">마이페이지 비밀번호확인</h1>
          </div>
        </div>
      </div>
    </div>
  </div>

 <div style="width:100%; display:flex; flex-direction:column; align-items:center; margin-top: 36px; margin-bottom: 36px;">
	<div style="background:#eff0f2; width:30%">
		<form action="user_mypage_pass_process.jsp" method="post" id="passFrm">
			<div style="margin-top:15px;display:flex; flex-direction:column; align-items:center; ">
				<span style="font-size:20px;  padding-bottom:15px; "><strong>비밀번호 확인</strong></span>
				
				<input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요."
				style="font-size: 20px; display: flex; justify-content: center; align-items: center; height: 40px;"><br/>
				<span id="passMsg"></span>
			</div>
		
			<div style="display: flex; align-items: center; justify-content: center; padding-top: 15px; padding-bottom: 15px;">
				<input type="button" value="확인" class="mainBtn" id="confirmBtn">
			</div>
		</form>
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
