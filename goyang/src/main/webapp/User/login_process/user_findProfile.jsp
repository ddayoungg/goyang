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

<!-- <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> -->
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
<script type="text/javascript">


function id_search(){
	var frm=document.idfrm;
	
	if(frm.name.value==""){
		
		alert("이름을 입력해주세요")
		frm.name.focus();
		return;
	}
	if(frm.email.value==""){
		alert("이메일을 입력해주세요")
		frm.email.focus();
		return;
	}
	$("#idfrm").submit();
}

function pass_search(){
	var frm=document.passfrm;
	
	if(frm.id.value==""){
		alert("아이디를 입력해주세요")
		frm.id.focus();
		return;
	}
	if(frm.name.value==""){
		alert("이름을 입력해주세요")
		frm.name.focus();
		return;
	}
	if(frm.email.value==""){
		alert("이메일을 입력해주세요")
		frm.email.focus();
		return;
	}
	$("#passfrm").submit();
}
</script>
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
						<h1 class="mb-0">관리자 화면</h1>
						<!-- <p class="text-white">로그인을 해주세요.</p> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--  여기사이에 구상하시면 됩니다!!! -->
		<div style="width:100%; height:100%; background:white;
    	display:flex; justify-content:center; align-items:center; margin-top:36px; margin-bottom:36px;">
        <div style="background:white; width:860px; height:500px; display:flex; flex-direction:row;
    	box-shadow:10px black; border-radius:10px;">
            <div style="width:50%; border-radius:10px 0px 0px 10px; display:flex; flex-direction:column;
    		align-items:center; padding:40px; background:white;  ">
    		
   			<div style="margin-top:15px; display:flex; flex-direction:column; justify-content:flex-start; width:100% ">
				<span style="font-size:30px;"><strong>아이디 찾기</strong></span>
			</div>
   			<div style="margin-top:15px; display:flex; flex-direction:column; align-items:left; ">
				<span style="font-size:14px;"><strong>회원가입 시, 입력하신 이름+이메일로 아이디를 확인하실 수 있습니다.</strong></span>
			</div>
   			<section style="width:430px; padding-top:60px; display:flex; flex-direction:column; align-items:center;">
			<form method="post" id="idfrm" name="idfrm" action="user_findID.jsp">
			<div style="width: 350px; height:48px; border: solid 1px gray; 
			background: white;">	
				<input placeholder="Username" type="text" id="name" name="name" style="border:none; width:330px;
				margin-top:10px; font-size:14px; margin-left:10px"></input>
			</div>
			<div style="width:350px; height:48px; border:solid 1px gray; 
			background: white; margin-top:13px;">	
				<input placeholder="Email" type="text" id="email" name="email" style="border:none; width:330px;
				margin-top:10px; font-size:14px; margin-left:10px"></input>
			</div>
			</form>
			<div style="padding-top:13px;">
				<button style="width:350px; height:48px; font-size:18px;"
				class="btn btn-primary btn-block" id="findBtn" onclick="id_search()">아이디 찾기</button>
			</div>
			
			<div style="display:flex; justify-content:flex-start; align-items:center; width:400px; margin-top:40px; ">
                    <button style=" width:115px; font-size:13px; " 
                    class="btn btn-primary btn-block" onclick="location.href='user_signIn.jsp'">
					로그인</button>
                </div>
			</section>
            </div>
            
            <div style="width:50%; border-radius:0px 10px 10px 0px; display:flex; flex-direction:column;
    		align-items:center; padding:40px; background:white; border-left:1px solid gray">
                <div style="margin-top:15px; display:flex; flex-direction:column; justify-content:flex-start; width:100%">
				<span style="font-size:30px;" ><strong>비밀번호 변경</strong></span>
			</div>
   			<div style="margin-top:15px; display:flex; flex-direction:column; align-items:left; ">
				<span style="font-size:14px;"><strong>회원가입 시, 입력하신 이름+이메일+아이디로 비밀번호를 변경하실 수 있습니다.</strong></span>
			</div>
   			<section style="width:430px; padding-top:10px; display:flex; flex-direction:column; align-items:center;">
			<form method="post" id="passfrm" name="passfrm" action="user_updatePass.jsp">
			<div style="width: 350px; height:48px; border: solid 1px gray; 
			background: white;">	
				<input placeholder="id" type="text" id="id" name="id" style="border:none; width:330px;
				margin-top:10px; font-size:14px; margin-left:10px"></input>
			</div>
			<div style="width:350px; height:48px; border:solid 1px gray; 
			background:white; margin-top:8px;">	
				<input placeholder="Username" type="text" id="name" name="name" style="border:none; width:330px;
				margin-top:10px; font-size:14px; margin-left:10px"></input>
			</div>
			<div style="width:350px; height:48px; border:solid 1px gray; 
			background:white; margin-top:8px;">	
				<input placeholder=Email type="text" id="email" name="email" style="border:none; width:330px;
				margin-top:10px; font-size:14px; margin-left:10px"></input>
			</div>
			</form>
			<div style="padding-top:13px;">
				<button style="width:350px; height:48px; font-size:18px;"
				class="btn btn-primary btn-block" onclick="pass_search()">비밀번호 변경</button>
			</div>
			<div style="display:flex; justify-content:flex-end; align-items:center; width:400px; margin-top:40px; ">
                    <span style="color:black; font-size:11px; padding-right:15px; ">
                    Goyang Citytour</span>
                    <button style=" width:115px; font-size:13px; " 
                    class="btn btn-primary btn-block" onclick="location.href='user_signUp.jsp'">
					회원가입</button>
                </div>
			</section>
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

	<!-- <script src="js/jquery-3.4.1.min.js"></script> -->
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

</body>

</html>
