<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ page import="kr.co.goyang.user.dao.UserDAO" %>
	    <%@ page import="kr.co.goyang.user.vo.UserVO" %>
	
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

<link rel="stylesheet" href="../../css/style.css">
<link rel="stylesheet" href="../../css/owl.carousel.min.css">
<link rel="stylesheet" href="../../css/owl.theme.default.min.css">
<link rel="stylesheet" href="../../css/jquery.fancybox.min.css">
<link rel="stylesheet" href="../../fonts/icomoon/style.css">
<link rel="stylesheet" href="../../fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../../css/daterangepicker.css">
<link rel="stylesheet" href="../../css/aos.css">
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<style type="text/css">
#wrap {
	width: 500px;
	margin: 0px auto
}

#loginHeader {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 40px
}

.size {
	width: 500px;
	height: 50px;
	font-size: 18px;
	margin-bottom: 10px
}

.zipbtn {
	width: 145px;
	height: 50px;
	font-size: 18px;
	margin-bottom: 10px;
	background-color: #ffffff;
	border: 1px solid #ddd;
}

.zipcodebox {
	width: 350px;
	height: 50px;
	font-size: 18px;
	margin-bottom: 10px
}

.idbox {
	width: 350px;
	height: 50px;
	font-size: 18px;
	margin-bottom: 10px
}

.btnDesign {
	width: 410px;
	height: 50px;
	background-color: #4C87EE;
	font-weight: bold;
	color: #FFFFFF;
	font-size: 18px
}

.boxname {
	margin-bottom: 5px;
}

#idWarnMsg, #passWarnMsg, #conpassWarnMsg, #emailWarnMsg, #nameWarnMsg,
	#phoneWarnMsg, #zcodeWarnMsg, #addrWarnMsg, #deaddrWarnMsg, #passChk, #emailChk, #phoneChk{
	font-weight: bold;
	font-size: 15px;
	color: #FF0000;
	margin-bottom: 10px;
	display: none
}
/* Table */
.member {
	border-collapse: collapse;
	border-top: 3px solid #168;
}

.member th {
	color: #168;
	background: #f0f6f9;
	text-align: center;
	height: 48px;
}

/* 수정 */
.member td {
	text-align: center;
}

.member th, .member td {
	padding: 10px;
	border: 1px solid #ddd;
	border-right: 0;
	border-left: 0;
}

/* 수정
	.member th:first-child, .member td:first-child {
	   border-left: 0;
	}
	
	.member th:last-child, .member td:last-child {
	   border-right: 0;
	} */
.member tr td:first-child {
	text-align: center;
}

.member caption {
	caption-side: bottom;
	display: none;
}

.page111 {
	width: 30px;
	background-color: white;
	border: 1px solid #ebebeb;
}

.page111:hover {
	border: 1px solid #333;
}

.pageNow {
	margin: 0px 20px 0px;
	cursor: none;
}

.pageNow:hover {
	border: 1px solid #ebebeb;
	cursor: none;
}

.popup {
	display: flex;
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .7);
	z-index: 1;
}

.popup.hide {
	display: none;
}

.popup.has-filter {
	backdrop-filter: blur(4px);
	-webkit-backdrop-filter: blur(4px);
}

.popup .content {
	padding: 20px;
	background: #fff;
	border-radius: 5px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
}

.popupBtn {
	width: 100px;
	height: 40px;
	margin: 10px;
	background-color: #f0f6f9;
	border: 1px solid #ebebeb;
}

.popupBtn:hover {
	border: 1px solid #168;
}

.mainBtn {
	width: 80px;
	height: 35px;
	background-color: #ffffff;
	border: 1px solid #ddd;
}

.mainBtn:hover {
	border: 1px solid grey;
	background-color: #ebebeb;
}

.button222 {
	margin: 0px;
	height: 35px;
}
</style>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById("addr").value = roadAddr;
			}
		}).open();
	}
	
	
	 $(function(){
		
	
		
			//아이디 중복확인 창
	$("#btnDup").click(function(){
		window.open("id_dup.jsp","id_dup","width=510,height=310")
	});//click
		
	
	});//ready


	function chkNull(){
		

		//아이디에 입력한 값을 얻는다.
		var id=$("#id").val();
		if(id.trim() == ""){
			$("#idWarnMsg").show();
			$("#id").val("");//입력된 공백 아이디를 초기화한다.
			return;
		}else{
			$("#idWarnMsg").hide();
			$("#password").focus();
		}//end if
		
		//비밀번호에 입력한 값을 얻는다.
		var pass=$("#password").val();
		if( pass.trim() == ""){
			$("#passWarnMsg").show();
			$("#password").val("");//입력된 공백 아이디를 초기화한다.
			return;
		}else{
			$("#passWarnMsg").hide();
			$("#conpassword").focus();
		}//end if
		
		var pwdCheck=/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		var pass=$("#password").val();
		if( !pwdCheck.test(pass)){
			$("#passChk").show();
			$("#password").val("");//입력된 공백 아이디를 초기화한다.
			return;
		}else{
			$("#passChk").hide();
			$("#conpassword").focus();
		}//end if
		
		var conpass=$("#conpassword").val();
			if(pass != conpass){
			$("#conpassWarnMsg").show();
			$("#conpassword").val("");//입력된 공백 아이디를 초기화한다.		
			return;
		}else {
			$("#conpassWarnMsg").hide();
			$("#email").focus();
		}
		
		
		var email=$("#email").val();
		if( email.trim() == ""){
			$("#emailWarnMsg").show();
			$("#email").val("");//입력된 공백 아이디를 초기화한다.
			return;
		}else{
			$("#emailWarnMsg").hide();
			$("#name").focus();
		}//end if
		
		var emailCheck=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var email=$("#email").val();
		if(!emailCheck.test(email)){
			$("#emailChk").show();
			$("#email").val("");//입력된 공백 아이디를 초기화한다.
			return;
		}else{
			$("#emailChk").hide();
			$("#name").focus();
		}//end if
		
		var name=$("#name").val();
		if( name.trim() == ""){
			$("#nameWarnMsg").show();
			$("#name").val("");//입력된 공백 아이디를 초기화한다.
			return;
		}else{
			$("#nameWarnMsg").hide();
			$("#phone").focus();
		}//end if
		
		var phone=$("#phone").val();
		if( phone.trim() == ""){
			$("#phoneWarnMsg").show();
			$("#phone").val("");//입력된 공백 아이디를 초기화한다.
			return;
		}else{
			$("#phoneWarnMsg").hide();
			$("#zipcode").focus();
		}//end if
		
		var phoneCheck=/^[0-9]+/g;
		var phone=$("#phone").val();
		if( !phoneCheck.test(phone)){
			$("#phoneChk").show();
			$("#phone").val("");//입력된 공백 아이디를 초기화한다.
			return;
		}else{
			$("#phoneChk").hide();
			$("#zipcode").focus();
		}//end if
		
		var zcode=$("#zipcode").val();
		if( zcode.trim() == ""){
			$("#zipcodeWarnMsg").show();
			$("#zipcode").val("");//입력된 공백 아이디를 초기화한다.
			return;
		}else{
			$("#zipcodeWarnMsg").hide();
			$("#address").focus();
		}//end if
		
		var addr=$("#addr").val();
		if( addr.trim() == ""){
			$("#addrWarnMsg").show();
			$("#addr").val("");//입력된 공백 아이디를 초기화한다.
			return;
		}else{
			$("#addrWarnMsg").hide();
			$("#deAddr").focus();
		}//end if
		
		var deaddr=$("#deAddr").val();
		if( deaddr.trim() == ""){
			$("#deaddrWarnMsg").show();
			$("#deAddr").val("");//입력된 공백 아이디를 초기화한다.
			return;
		}else{
			$("#deaddrWarnMsg").hide();
		}//end if
		
		//아이디와 비밀번호가 모두 입력된 후 form 태그의 action으로 설정된페이지로 요청을
		//보낸다.

		$("#frm").submit();
		
		
	}//chkNull
	// 회원가입 화면의 입력값들을 검사한다.




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
					<li><a
						href="../reservation_process/user_reservation_course.jsp">투어예약</a></li>
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


	<div id="wrap">
		<div id="loginHeader">
			<b><font size="6">Sign Up</font></b>
		</div>
		<div id="loginContent">
			<form name="userInfo" id="frm" method="post" action="user_signUpAction.jsp" >
				<div class="boxname">아이디</div>
				<input type="text" name="id" id="id" class="idbox" placeholder="Id"
					maxlength="20" autofocus="autofocus" readonly="readonly" /> 
					<input type="button" class="mainBtn" value="중복확인" id="btnDup" style="width:145px; height:50px;">
					<br>
				<div id="idWarnMsg">아이디를 입력해주세요.</div>
				<div id="id_check"></div>

				<div class="boxname">비밀번호</div>
				<input type="password" name="password" id="password"
					class="inputbox size" placeholder="Password" maxlength="20" /><br>
				<div id="passWarnMsg">비밀번호를 입력해주세요.</div>
				<div id="passChk">비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다</div>

				<div class="boxname">비밀번호 확인</div>
				<input type="password" name="conpassword" id="conpassword"
					class="inputbox size" placeholder="Confirm password" maxlength="20" /><br>
				<div id="conpassWarnMsg">비밀번호가 일치하지 않았습니다. 다시 시도해주세요</div>

				<div class="boxname">이메일</div>
				<input type="text" name="email" id="email" class="inputbox size"
					placeholder="Email" maxlength="50" /><br>
				<div id="emailWarnMsg">이메일을 입력해주세요.</div>
				<div id="emailChk">이메일 형식이 올바르지 않습니다.</div>

				<div class="boxname">이름</div>
				<input type="text" name="name" id="name" class="inputbox size"
					placeholder="Name" maxlength="50" /><br>
				<div id="nameWarnMsg">이름을 입력해주세요.</div>

				<div class="boxname">휴대폰번호</div>
				<input type="text" name="phone" id="phone" class="inputbox size"
					placeholder="Phone" maxlength="15" /><br>
				<div id="phoneWarnMsg">휴대폰번호를 입력해주세요.</div>
				<div id="phoneChk">숫자만 입력할 수 있습니다.</div>

				<div class="boxname">주소</div>
				<input type="text" name="zipcode" id="zipcode" class="zipcodebox"
					placeholder="Zipcode" maxlength="10" /> <input type="button"
					value="우편번호 검색" class="zipbtn" onclick="execDaumPostcode()">
				<br>
				<div id="zcodeWarnMsg">우편번호를 입력해주세요.</div>

				<input type="text" name="addr" id="addr" class="inputbox size"
					placeholder="Address" maxlength="50" /><br>
				<div id="addrWarnMsg">주소를 입력해주세요.</div>

				<input type="text" name="deAddr" id="deAddr"
					class="inputbox size" placeholder="Detail Address" maxlength="50" /><br>
				<div id="deaddrWarnMsg">상세주소를 입력해주세요.</div>

				<!--다영수정-->
				<%
					UserDAO userDAO = UserDAO.getInstance();
					List<UserVO> tourNames = userDAO.selectTourNameNum();
				%>
				<div class="boxname">관심있는 코스</div>
				<%
					for(UserVO uVO:tourNames){
				%>
				<input type="radio" name="cose" id="tournum" value="<%=uVO.getTourNum() %>" /><%=uVO.getTourName() %><br>
				<%} %>
				<!--다영수정-->
				
				<br> 
				<div>
				<input type="hidden"/>
				<input type="button" value="Sign Up" id="signUp"
					class="btn btn-primary btn-block" onclick="chkNull()"/><br>
					</div>
			</form>
		</div>
		<div id="loginFooter"></div>
	</div>


	<div class="site-footer">
		<div class="inner first">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<div class="widget">
							<p
								style="font-size: 20px; font-weight: bold; color: red; font-style: inherit;">매주
								월요일은 정기 휴무입니다.</p>
							<p style="font-size: 60px; font-weight: bold;">Goyang Tour</p>
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
							<script>
									document.write(new Date().getFullYear());
								</script>
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

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
