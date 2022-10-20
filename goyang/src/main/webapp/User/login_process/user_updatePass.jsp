<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="kr.co.goyang.user.dao.UserDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
function fn(){
	var f=document.frm;
	if(f.password.value == ""){
		alert("새 비밀번호를 입력해주세요");
		f.password.focus();
		return false;
	}
	if(f.conpassword.value == ""){
		alert("새 비밀번호 재입력을 입력해주세요");
		$("#conpassword").val("");
		f.conpassword.focus();
		return false;
	}
	if(f.password.value != f.conpassword.value){
		alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
		$("#password").val("");
		$("#conpassword").val("");
		f.conpassword.focus();
		return false;
	}
	
	var pwdCheck=/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	var pass=$("#password").val();
	if( !pwdCheck.test(pass)){
		alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다")
		f.password.focus();
		return;
	}//end if
	
	f.submit();
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
						<h1 class="mb-0">비밀번호 찾기</h1>
						<!-- <p class="text-white">로그인을 해주세요.</p> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--  여기사이에 구상하시면 됩니다!!! -->
	<%
	
	String id=request.getParameter("id");
	String name= request.getParameter("name");
	String email= request.getParameter("email");
	UserDAO userDAO=new UserDAO();
	String result = userDAO.selectFindPass(id, name, email);
	System.out.println("확인============="+id);
	%>
	<div style="width:100%; display:flex; flex-direction:column; align-items:center; margin-top: 36px; margin-bottom: 36px;">
	<div style="background:white; width:100%">
		<header>
			<div style="margin-top:15px;display:flex; flex-direction:column; align-items:center; ">
				<span style="font-size:30px;"><strong>Goyang Citytour</strong></span>
			</div>
		</header>
		<form method="post" action="user_updatePassAction.jsp?id=<%=id%>" name="frm">
		<%
		if(result!=null){
		%>
		<section style="padding-top:60px; display:flex; flex-direction:column; align-items:center;">
		
			<input type="password" style="width:465px; height:48px; font-size:18px; padding-left:10px;  "
			 placeholder="새 비밀번호" id="password" name="password"></input><br>
			<input type="password" style="width:465px; height:48px; font-size:18px; padding-left:10px;  "
			 placeholder="새 비밀번호 확인" id="conpassword" name="conpassword"></input><br>
			
			<div style="padding-top:13px;">
				<button type="submit" style="width:465px; height:48px; font-size:18px;
				border:solid 1px #333;" class="btn btn-primary btn-block" onclick="fn(); return false;" >비밀번호 변경</button>
			</div>
			<div style="width:465px; height:48px;">
			</div>
		</section>
		<%
		}else{
		%>
		<section style="padding-top:60px; display:flex; flex-direction:column; align-items:center;">
			<div style="width: 465px; height:148px; border: solid 1px gray; 
			background: white; ">	
			<h4>등록된 정보가 없습니다.</h4>
			</div>
			<div style="padding-top:13px;">
				<button style="width:465px; height:48px; font-size:18px;
				border:solid 1px #333;" class="btn btn-primary btn-block" onclick="javascript:form.action='user_findProfile.jsp'">다시 찾기</button>
			</div>
			<div style="width:465px; height:48px;">
			</div>
		</section>
		<%
		}
		%>
		</form>
	</div>
	</div>

<div id="popup" class="hide popup">
<div class="content">
	<div>
		<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">게시글 등록 확인</div>
		
		<div style="background-color: #f0f6f9;">
			<div style="font-size: 16px; display: flex; justify-content: center; 
			align-items: center; height: 70px ;background-color: #f0f6f9;">비밀번호 변경되었습니다.</div>
			
			<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
				<input type="button" value="확인" class="popupBtn" onclick="location.href='user_signIn.jsp'">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 

<!-- 	<script src="js/jquery-3.4.1.min.js"></script> -->
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
