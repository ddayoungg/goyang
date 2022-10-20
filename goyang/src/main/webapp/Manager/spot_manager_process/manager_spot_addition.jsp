<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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


<!-- 인화 수정 시작1 -->
<style type="text/css">
#container{width:1000px;margin: 0px auto;}
.imgSize{width: 300px; height: 200px; border:1px solid #333;}

</style>

<%
/* nsm 22-10-17 아이디 세션 */
//아이디 세션
String manageId="";//아이디
if(session.getAttribute("manageId") !=null){//세션에서 아이디 가져오기.
	manageId = (String) session.getAttribute("manageId");
}//end if
%>

<script type="text/javascript">
$(function(){
	accessChk();//접근 권한 체크
	
	$("#deleteBtn").click(function(){
		$("#frm").submit();
	});
});//ready

function accessChk(){
	var Msess="<%= manageId %>";
	
	if(Msess==""){
		alert("로그인 해주세요.");
		location.href="http://211.63.89.140/Manager/login_manager/manager_signIn.jsp";
		return;
	}//end if
}//accessChk

</script>

<script type="text/javascript">
$(function(){
	
	$("#deleteBtn").click(function(){
		$("#frm").submit();
	});
});//ready

<script type="text/javascript">
function fileInput(fileInput, output){
	var file = document.getElementById(fileInput);
	var fReader = new FileReader();
	fReader.readAsDataURL(file.files[0]);
	fReader.onloadend = function(event) {
		document.getElementById(output).src=event.target.result;
	}//end onloadend
}//fileInput
</script>
<!-- 인화 수정 끝1  -->



 <title>관리자화면-관광지관리</title>
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
        <a href="../dashboard_process/manager_dashboard.jsp" class="logo m-0">고양 <span class="text-primary">.</span></a>

     			<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-center" >
					<li class="active"><a href="../dashboard_process/manager_dashboard.jsp">dash board</a></li>
					<li><a href="../user_manager_process/manager_member.jsp">회원관리</a></li>
					<li><a href="../tour_manager_process/manager_tour_manager.jsp">투어관리</a></li>
					<li><a href="../reservation_manager_process/manager_reservation.jsp">예약관리</a></li>
					<li><a href="manager_spot_list.jsp">관광지 관리</a></li>
					<li><a href="../review_manager_process/manager_review.jsp">후기관리</a></li>
				</ul>
			    <ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li style="font-size: 5px; font-weight: bold;"><a
						href="../login_manager/manage_logout.jsp">로그아웃&nbsp;&nbsp;&nbsp;<%= manageId %></a>
						</li>
				</ul>

        <a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light" data-toggle="collapse" data-target="#main-navbar">
          <span></span>
        </a>
      </div>
    </div>
  </nav>

<!-- 헤더 -->
  <div class="hero hero-inner">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6 mx-auto text-center">
          <div class="intro-wrap">
            <h1 class="mb-0">관광지 관리</h1>
          </div>
        </div>
      </div>
    </div>
  </div>

<!-- 메인 화면 -->

<!-- 대제목 -->
	<div class="container" style="margin-top: 20px;">
		<img src="E:/web_service_goyang/images/bullet_Tues_sub_style_green.png" alt=image>
		<p
			style="font-size: 20px; font-weight: bold; padding-top: 20px; margin-bottom: 0;">관광지 추가</p>
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
		<form>
			<!-- <div style="font-size:23px; margin:50px 0px 10px 0px; display:flex; justify-content:space-between;">
				<div style="font-weight: bold;"> 관광지 추가 </div>
			</div>		
			<hr style="margin-bottom:50px;">	 -->
		
			<div>
				<table style="border-spacing:0px; width:100%;">
					<colgroup>
						<col style="width:58px;"></col>
					</colgroup>
					<tbody>
						<tr>
							<th width="200">코스선택</th>
							<td style="padding-bottom: 10px";>
								<select style="width:1000px; height:32px; border:1px solid #ddd;">
									<option>-- 코스 선택 --</option>
									<option>화요나들이(벽제)</option>
									<option>수요나들이(행주)</option>
									<option>목요나들이(일산)</option>
									<option>금요나들이(고양관광특구)</option>
									<option>토요나들이(왕릉)</option>
									<option>일요나들이(패밀리)</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>관광지명</th>
							<td style="padding-bottom: 10px";>
								<input type="text" placeholder="내용을 입력해주세요." style="border:1px solid #ddd; width:100%; height:32px;"></td>
						</tr>
						<tr>
							<th>소개 내용</th>
							<td style="padding-bottom: 10px";>
								<textarea placeholder="내용을 입력해주세요." style="width:100%; height:200px; border:1px solid #ddd;"></textarea>
							</td>
						</tr>
						<tr>
							<th>사진</th>
							<td style="padding-top:0px;">
							<!-- 인화 수정 시작2 -->
   							  <input type='file' id='potoFileInput' onchange="fileInput('potoFileInput', 'potoOutput')">
   							  <div class="imgSize"><img class="imgSize" id="potoOutput" src=""/></div>
   							  <!-- 인화 수정 끝2 -->
							</td>
						</tr>
					</tbody>
				</table>
				
				<div style="justify-content: end; display: flex; align-items: center; margin-bottom:100px; margin-top:10px;">
					<input type="button" value="추가" class="mainBtn" style="width:90px; height:32px;">
					<input type="button" value="취소" class="mainBtn" onclick="showPopup(true,'popup')" style="width:90px; height:32px; margin-left:15px;">
				</div>
			</div>
		</form>
	</div>

<!-- 푸터 -->
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

<!-- 관광지 추가 취소 popup -->
	<div id="popup" class="hide popup">
		<div class="content">
			<div style="width: 450px;">
				<div style="font-size: 12px; width: 450px; height: 30px; padding-left: 10px;
				display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">관광지 추가 취소</div>
				
				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
					align-items: center; height: 70px ;background-color: #f0f6f9;">작성하신 내용이 저장되지 않았습니다.<br>취소하시겠습니까?</div>
					
					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="확인" class="popupBtn" onclick="showPopup(true,'popup2')">
						<input type="button" value="취소" class="popupBtn" onclick="closePopup('popup')">
					</div>
				</div>
			</div>
	  </div>
	</div>
	
	<!-- 관광지 추가 취소 확인 팝업 - popup2 -->
	<div id="popup2" class="hide popup">
	  <div class="content">
		<div style="width: 450px;">
			<div style="font-size: 12px; width: 450px; height: 30px; padding-left: 10px;
			display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">관광지 추가 취소 확인</div>
			
			<div style="background-color: #f0f6f9;">
				<div style="font-size: 16px; display: flex; justify-content: center; 
				align-items: center; height: 70px ;background-color: #f0f6f9;">관광지 추가를 취소하였습니다.</div>
				
				<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
					<input type="button" value="확인" class="popupBtn" onclick="location.href='manager_spot_list.jsp'">
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
