<%@page import="java.util.List"%>
<%@page import="kr.co.goyang.user.vo.MyInfoVO"%>
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

<title>고양 시티투어</title>

<!-- google jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<%
//로그인 여부
String id="";//로그인 한 경우
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
	
	$("#rectifyBtn").click(function(){
		inputChk();//입력 값 유효성 검사
	});//click
	
	//우편번호 찾기
	$("#btnZip").click(function(){
		findZipcode();
	});//click
});//ready

function accessChk(){
	var id="<%= id %>";
	var passFlag="<%= passFlag %>";
		
	if(id==""){
		alert("로그인 해주세요.");
		location.href="http://211.63.89.140/User/login_process/user_signIn.jsp";
		return;
	}//end if
	
	if(passFlag=="fail"){
		alert("비밀번호 확인을 해주세요.");
		location.href="http://211.63.89.140/User/login_process/user_mypage_inner.jsp";
		return;
	}//end if
	
}//accessChk

function inputChk() {
	
	if($("#phone").val().trim()=="") {
		alert("휴대폰 번호를 입력해주세요.");
		$("#phone").val("");//화이트 스페이스 초기화
		$("#phone").focus();//커서 이동
		return;
	}//end if
	
	if($("#email").val().trim()=="") {
		alert("이메일을 입력해주세요.");
		$("#email").val("");//화이트 스페이스 초기화
		$("#email").focus();//커서 이동
		return;
	}//end if
	
	if($("#zipcode").val().trim()=="") {
		alert("우편번호를 입력해주세요.");
		$("#zipcode").val("");//화이트 스페이스 초기화
		$("#zipcode").focus();//커서 이동
		return;
	}//end if
	
	if($("#addr").val().trim()=="") {
		alert("주소를 입력해주세요.");
		$("#addr").val("");//화이트 스페이스 초기화
		$("#addr").focus();//커서 이동
		return;
	}//end if
	
	if($("#deAddr").val().trim()=="") {
		alert("상세주소를 입력해주세요.");
		$("#deAddr").val("");//화이트 스페이스 초기화
		$("#deAddr").focus();//커서 이동
		return;
	}//end if
	
	$("#hiddTourNum").val($("#selTour").val());//form에 전달하기 위해 hidden set
	
	showPopup(true,'popup');
}//inputChk

function changePage(value){                     
	if(value == "0"){ 								// HOME 버튼 클릭시 첫화면으로 이동                          
		location.href="../main/index.jsp";            
	}else if(value == "1"){						// 로그아웃 버튼 클릭시 로그아웃 처리            
		location.href="member/pro/LogoutPro.jsp";            
	}else if(value == "2"){   					// 마이페이지 버튼 클릭시 회원정보 보여주는 화면으로 이동                          
		location.href="user_mypage_inner.jsp";            
	}       
}    
</script>

<!-- 다음 우편번호 API 시작 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function findZipcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr").value = roadAddr;
                document.getElementById("deAddr").focus();
            }
        }).open();
    }
</script>
<!-- 다음 우편번호 API 끝 -->
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
            <h1 class="mb-0">내 정보 수정</h1>
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
		<img src="../../images/bullet_Tues_sub_style_blue.png" alt=image>
		<p
			style="font-size: 20px; font-weight: bold; padding-top: 20px; margin-bottom: 0;">내 정보</div>
	<!-- 대제목 끝 -->

	<!-- 라인 구분 선 -->
	<div class="container">
		<!-- <div class="col-lg-6 text-center"> -->
		<h2 class="section-sub-title text-center mb-3"></h2>
		<!-- </div> -->
	</div>
	<!-- 라인 구분 선 끝-->

 <div class="container">
		<form action="user_mypage_rectify_process.jsp" method="post" id="recFrm">
			<div style="font-size:23px; display:flex; justify-content:space-between;">
				<!-- <div style="font-weight: bold;"> 내 정보 수정 </div> -->
			</div>		
			<!-- <hr style="margin-bottom:50px;">	 -->
			
			<div style="margin: 50px 0 80px 0">
				<table class="member" style="width:100%">
				<%
					MyInfoDAO miDAO=MyInfoDAO.getInstance();
				
					MyInfoVO userInfo=miDAO.selectMyUesrInfo(id);
					pageContext.setAttribute("userInfo", userInfo);
				%>
					<tr>
						<th>이름</th>
						<td><input id="name" name="name" size="10" disabled="disabled" value="${ userInfo.name }"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input id="id" name="id" size="20" disabled="disabled" value="${ userInfo.id }"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" title="pass" size="20" disabled="disabled" value="${ userInfo.password }"></td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td><input type="text" id="phone" name="phone" value="${ userInfo.phone }"  style= width:280px></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" id="email" name="email" value="${ userInfo.email }"  style= width:280px></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>
							<input type="text" id="zipcode" name="zipcode" value="${ userInfo.zipcode }" readonly="readonly" style="width:80px; border:0px none;">
							<input type="button" id="btnZip" value="우편찾기" class="mainBtn" />
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" id="addr" name="addr" value="${ userInfo.addr}" readonly="readonly" style= "width:280px; border:0px none;"></td>
					</tr>
					<tr>
						<th>상세 주소</th>
						<td><input type="text" id="deAddr" name="deAddr" value="${ userInfo.deAddr }"  style= width:280px></td>
					</tr>
					<tr>
						<th>관심있는 코스</th>
						<td><div style="display:flex; height:32px; justify-content:center;">
								<select id="selTour">
								<%
								List<MyInfoVO> tourList=miDAO.selectTourList();
								pageContext.setAttribute("tourList", tourList);
								%>
								<c:forEach var="tour" items="${ tourList }">
									<option value="${ tour.tourNum }" ${ tour.tourNum == userInfo.tourNum ?"selected='selected'":"" } > ${ tour.tourName } </option>
								</c:forEach>
								</select>
								<input type="hidden" id="hiddTourNum" name="tourNum" value="${ userInfo.tourNum }" /><!--  관심 코스 -->
							 </div>
						</td>
					</tr>
				</table>
			</div>
					
			<span style="position: relative; float: right; margin-top: -50px;">
				<input type="button" value="수정" class="mainBtn" id="rectifyBtn" style="width:100px; height:32px;">
				<input type="button" value="취소" class="mainBtn" onclick="location.href='user_mypage.jsp'" style="width: 90px; height: 32px;">
			</span>
			
		</form>
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

	
	<!-- 수정 확인 팝업 -->
	<div id="popup" class="hide popup">
		<div class="content">
			<div style="width: 450px;">
				<div style="font-size: 12px; width: 450px; height: 30px; padding-left: 10px;
				display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">투어 수정 확인</div>
				
				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
					align-items: center; height: 70px ;background-color: #f0f6f9;">내 정보를 수정 하시겠습니까?</div>
					
					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="예" class="popupBtn" onclick="windowMove('popup')">
						<input type="button" value="아니오" class="popupBtn" onclick="closePopup('popup')">
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
			$("#recFrm").submit();//form submit
		}//windowMove()
		
	</script>

</body>

</html>
