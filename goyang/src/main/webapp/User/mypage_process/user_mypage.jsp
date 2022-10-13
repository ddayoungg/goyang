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
					<li style="font-size: 5px; font-weight: bold;"><a href="../main/index.jsp">로그아웃</a></li>
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
		<form>
			<div style="font-size:23px; display:flex; justify-content:space-between;">
				<!-- <div style="font-weight: bold;"> 내 정보 수정 </div> -->
			</div>		
			<!-- <hr style="margin-bottom:50px;">	 -->
			
			<div style="margin: 50px 0 80px 0">
				<table class="member" style="width:100%">
					<tr>
						<th>이름</th>
						<td>홍*영</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>ekdanabab</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>******</td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td>010-1234-5678</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>hhh123@naver.com </td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>06235</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>서울특별시 강남구 역삼동 한독빌딩</td>
					</tr>
					<tr>
						<th>관심있는 코스</th>
						<td><div style="display:flex; height:32px; justify-content:center;">
								<select>
									<option>-- 코스 선택 --</option>
									<option>화요나들이(벽제)</option>
									<option>수요나들이(행주)</option>
									<option>목요나들이(일산)</option>
									<option>금요나들이(고양관광특구)</option>
									<option>토요나들이(왕릉)</option>
									<option>일요나들이(패밀리)</option>
								</select>
							 </div>
						</td>
					</tr>
				</table>
			</div>
					
			<span style="position: relative; float: right; margin-top: -50px;">
				<input type="button" value="변경"  class="mainBtn" onclick="location.href='user_mypage2.jsp'"style="width:100px; height:32px;">
				<input type="button" value="회원탈퇴" class="mainBtn"onclick="showPopup(true,'popup')" style="width: 110px; height: 32px;">
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

<!-- 회원탈퇴 비민번호 확인- popup -->
<div id="popup" class="hide popup">
	<div class="content">
		<div style="width: 500px;">
			<div style="font-size: 12px; width: 500px; height: 30px; padding-left: 10px;
			display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">회원탈퇴</div>
		
			<div style="background-color: #f0f6f9;">
					<div style="font-size: 14px; display: flex; justify-content: center; 
					align-items: center; height:70px ;background-color: #f0f6f9;">
						<div style="font-size: 14px; display: flex; justify-content: center; 
						align-items: center; height: 70px ;background-color: #f0f6f9;">비밀번호 확인 </div>
						<input type="password" name="pass" style=" margin-left:10px; width:200px; height:30px; border:1px solid #ddd;">
						</div>
						<div style="font-size: 16px; display: flex; justify-content: center; 
						align-items: center; height: 70px ;background-color: #f0f6f9;">
						탈퇴한 아이디로는 다시 가입할 수 없으며, <br>아이디 및 데이터는 복구할 수 없습니다. <br>탈퇴하시겠습니까?
						</div>
					
					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="submit" value="탈퇴" class="popupBtn" onclick="showPopup(true,'popup2')">
						<input type="button" value="취소" class="popupBtn" onclick="closePopup('popup')">
					</div>
				</div>
		</div>
	</div>
</div>
	
	<!-- 회원탈퇴완료- popup2 -->
	<div id="popup2" class="hide popup">
	  <div class="content">
		<div style="width: 415px;">
			<div style="font-size: 12px; width: 415px; height: 30px; padding-left: 10px;
			display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">회원탈퇴완료</div>
			
			<div style="background-color: #f0f6f9;">
				<div style="font-size: 16px; display: flex; justify-content: center; 
				align-items: center; height: 70px ;background-color: #f0f6f9;">탈퇴가 완료되었습니다.<br></div>
				
				<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
					<input type="button" value="확인" class="popupBtn" onclick="location.href='../main/index.jsp'">
				</div>
			</div>
		</div>
	  </div>
	</div>

<!-- 내 정보 변경 비밀번호 확인- popup3 -->
<div id="popup3" class="hide popup">
	<div class="content">
		<div style="width: 500px;">
			<div style="font-size: 12px; width: 500px; height: 30px; padding-left: 10px;
			display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">비밀번호 확인</div>
		
			<div style="background-color: #f0f6f9;">
					<div style="font-size: 14px; display: flex; justify-content: center; 
					align-items: center; height:70px ;background-color: #f0f6f9;">
						<div style="font-size: 14px; display: flex; justify-content: center; 
						align-items: center; height: 70px ;background-color: #f0f6f9;">비밀번호 확인 </div>
						<input type="password" name="pass" style=" margin-left:10px; width:200px; height:30px; border:1px solid #ddd;">
						</div>

					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="submit" value="확인" class="popupBtn" >
						<input type="button" value="취소" class="popupBtn" onclick="closePopup('popup3')">
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
