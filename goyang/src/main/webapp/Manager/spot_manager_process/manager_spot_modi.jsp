<%@page import="kr.co.goyang.manager.dao.SpotListDAO"%>
<%@page import="kr.co.goyang.manager.vo.SpotListVO"%>
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

<!-- 인화 수정 시작1 -->
<style type="text/css">
#container{width:1000px;margin: 0px auto;}
.imgSize{width: 300px; height: 200px; border:1px solid #333;}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- Option 1: Bootstrap Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script type="text/javascript">

<%
	request.setCharacterEncoding("UTF-8");
	String tourName=request.getParameter("tourname");
	String tourOrder=request.getParameter("tourorder");
	System.out.println(tourName+tourOrder);
	
	SpotListDAO spotDAO=SpotListDAO.getInstance();
	SpotListVO setting=new SpotListVO();
	setting.setTourName(tourName);
	setting.setTourOrder(Integer.parseInt(tourOrder));
	
	
	SpotListVO spotVO=spotDAO.selectSpot(setting);
	System.out.println(spotVO);
	String Sname=spotVO.getSpotsName();
	String SContent=spotVO.getSpoContent();
	String Simg=spotVO.getSpotsImg();
	
	%>
	
$(function(){
	
	$("#thumImgFile").change(function(){//대표 사진 세팅
		setFile();
	})//change
	
	$("#modiBtn").on('click',function() {
		
		if($("#spot_name").val().trim()==""){
			alert("관광지명을 입력해주세요.");
			$("#spot_name").val("");
			$("#spot_name").focus();
			return;
		}
		
		if($("#spot_info").val().trim()==""){
			alert("관광지소개를 입력해주세요.");
			$("#spot_info").val("");
			$("#spot_info").focus();
			return;
		}
		
		$("#modiFrm").submit();
	});
});

function setFile(){
	var fReader = new FileReader();
	fReader.readAsDataURL($("#thumImgFile")[0].files[0]);
	fReader.onloadend = function(event) {
		console.log(event.target.result);
	$("#thumImgOutput").attr("src", event.target.result);
		
	/* 파일명 hidden 세팅*/
	var fileValue = $("#thumImgFile").val().split("\\");
	var fileName = fileValue[fileValue.length-1]; // 파일명
		$("#hiddThumImg").val(fileName);
	}//end onloadend
}//setFile
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
        <a href="../dashboard_process/manager_dashboard.jsp" class="logo m-0">고양<%=tourName %> <span class="text-primary">.</span></a>

     			<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-center" >
					<li class="active"><a href="../dashboard_process/manager_dashboard.jsp">dash board</a></li>
					<li><a href="../user_manager_process/manager_member_popup.jsp">회원관리</a></li>
					<li><a href="../tour_manager_process/manager_tour_manager.jsp">투어관리</a></li>
					<li><a href="../reservation_manager_process/manager_reservation.jsp">예약관리</a></li>
					<li><a href="manager_spot_list.jsp">관광지 관리</a></li>
					<li><a href="../review_manager_process/manager_review.jsp">후기관리</a></li>
				</ul>
			    <ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li></li>
					<li style="font-size: 5px;font-weight: bold;"><a href="../login_manager/manager_signIn.jsp">로그아웃</a></li>
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
            <h1 class="mb-0">관리자 화면</h1>
          </div>
        </div>
      </div>
    </div>
  </div>


<!-- 메인 화면 -->

<!-- 대제목 -->
	<div class="container" style="margin-top: 20px;">
		<img src="../../images/bullet_Tues_sub_style_green.png" alt=image>
		<p
			style="font-size: 20px; font-weight: bold; padding-top: 20px; margin-bottom: 0;">관광지 수정</p>
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
		<form action="manager_spot_modi_process.jsp?tourname=<%=tourName %>&spotorder=<%=tourOrder %>" method="post" id="modiFrm" enctype="multipart/form-data">
			<!-- <div style="font-size:23px; margin:50px 0px 10px 0px; display:flex; justify-content:space-between;">
				<div style="font-weight: bold;"> 관광지 수정 
				</div>
			</div>		 -->
			<div>
			<!-- <hr style="margin-bottom:50px;"> -->
			<div class="margin20">
				<table style="border-spacing:0px; width:100%;">
					<colgroup>
						<col style="width:58px;"></col>
					</colgroup>
					<tbody>
						<tr>
							<th width="200">코스선택</th>
							<td style="padding-bottom: 10px";>
								<input type="text" value="<%=tourName %>" disabled="disabled">
							</td>
						</tr>
						<tr>
							<th>관광지명</th>
							<td style="padding-bottom: 10px";>
								<input type="text" name="spot_name"  id="spot_name" value="<%=Sname %>"  style="border:1px solid #ddd; width:100%; height:32px;"></td>
						</tr>
						<tr>
							<th>소개 내용</th>
							<td style="padding-bottom: 10px";>
								<input type="text" name="spot_info" id="spot_info" value="<%=SContent %>" style="width:100%; height:200px; border:1px solid #ddd;"></textarea>
							</td>
						</tr>
						<tr>
							<th>사진</th>
							<td style="padding-top:0px;">
							<!-- 인화 수정 시작2 -->
   							  <input type='file' id="thumImgFile" name="thumImgFile" accept="image/*" value="<%=Simg %>">
   							  <input type="hidden" id="hiddThumImg" name="thumImg" value="<%=Simg %>">
   							  <div class="imgSize"><img class="imgSize" id="thumImgOutput"  src="../../images/<%=Simg %>"/></div>
   							  <!-- 인화 수정 끝2 -->	
							</td>
						</tr>
					</tbody>
				</table>
		
		
</div>
				
				<div style="justify-content: end; display: flex; align-items: center; margin-bottom:100px; margin-top:10px;">
					<input type="button" value="수정" class="mainBtn" id="modiBtn" style="width:90px; height:32px;">
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

<!-- 관광지 수정 취소 popup1 -->
	<div id="popup" class="hide popup">
		<div class="content">
			<div style="width:450px;">
				<div style="font-size: 12px; width: 450px; height: 30px; padding-left: 10px;
				display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">관광지 수정 취소</div>
				
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
	
		<!-- 관광지 수정 취소 확인 팝업 - popup2 -->
	<div id="popup2" class="hide popup">
	  <div class="content">
		<div style="width: 450px;">
			<div style="font-size: 12px; width: 450px; height: 30px; padding-left: 12px;
			display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">관광지 수정 취소 확인</div>
			
			<div style="background-color: #f0f6f9;">
				<div style="font-size: 16px; display: flex; justify-content: center; 
				align-items: center; height: 70px ;background-color: #f0f6f9;">관광지 수정을 취소하였습니다.</div>
				
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
