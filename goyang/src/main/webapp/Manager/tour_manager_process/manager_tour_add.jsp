<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
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

  <title>관리자화면-투어관리</title>
  
<style type="text/css">
#container{width:1000px;margin: 0px auto;}
.floatRight{float:right}
.floatLeft{float:left}
.centerText{text-align: center}
.rightText{text-align: right}
.centerAlign{margin: 0px auto;}
.tableSize{width:1000px;margin: 0px auto;}
.textSize{width: 1008px; height: 40px;}
.imgTextSize{width: 550px; height: 40px;}
.imgSize{width: 300px; height: 200px; border:1px solid #333;}
.margin20{margin: 20px;}
.marginLR10{margin : 10px 0px 10px 20px}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
tableCnt=0;
$(function(){
	tableCnt=$("#tableAction tr").length;
	
	$('#btn-add-row').click(function() {
		if($('#tableAction tr').length>12){
			return;
		}
		var tableTemp ="<tr><td>"+ tableCnt++ +"</td><td><input type='text' value=''></td>";
		tableTemp+="<td><input type='text' value=''></td>";
		tableTemp+="<td><input type='text' value=''></td></tr>";
		
		$("#tableAction").last().append(tableTemp);
	  });
	
	$("#btn-delete-row").click(function(){
		if($('#tableAction tr').length<3){
			return;
		}
		$("#tableAction tr").last().remove();
		tableCnt--;
		if(tableCnt == -1){tableCnt=0;}
	});//click
})

function fileInput(fileInput, output){
	var file = document.getElementById(fileInput);
	var fReader = new FileReader();
	fReader.readAsDataURL(file.files[0]);
	fReader.onloadend = function(event) {
		document.getElementById(output).src=event.target.result;
	}//end onloadend
}//fileInput

</script>
</head>

<body>
  <!-- header -->

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
					<li><a href="../user_manager_process/manager_member_popup.jsp">회원관리</a></li>
					<li><a href="manager_tour_manager.jsp">투어관리</a></li>
					<li><a href="../reservation_manager_process/manager_reservation.jsp">예약관리</a></li>
					<li><a href="../spot_manager_process/manager_spot_list.jsp">관광지 관리</a></li>
					<li><a href="../review_manager_process/manager_review.jsp">후기관리</a></li>
				</ul>

				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li></li>
					<li style="font-size: 5px; font-weight: bold;"><a
						href="../login_manager/manager_signIn.jsp">로그아웃</a></li>
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



  <!-- container -->
  
  <!-- 대제목 -->
	<div class="container" style="margin-top: 20px;">
		<img src="../../images/bullet_Tues_sub_style_green.png" alt=image>
		<p
			style="font-size: 20px; font-weight: bold; padding-top: 20px; margin-bottom: 0;">투어 정보 추가</p>
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
  <!-- <div style="font-size: 20px; margin: 50px 0px 10px 0px">투어 정보 추가</div>
  <hr> -->
  <div class="margin20"><!-- 코스명, 요약 설명, 사진, 맵 -->
   <div class="margin20">
    <span><strong>코스명</strong></span><br/>
    <input type="text" class="textSize" value="" placeholder="코스명을 입력하세요." maxlength=20/><br/>
    </div>
    <div class="margin20">
    <span><strong>요약 설명</strong></span><br/>
    <input type="text" class="textSize" value="" placeholder="내용을 입력하세요." maxlength=30/>
   </div>
   
   <div class="margin20"><!-- 대표 사진 -->
   <span><strong>대표 사진</strong></span><br/>
   <div style="display: flex; justify-content: left; margin:20px 20px 0px 5px;">
    <div>
     <input type='file' id='potoFileInput' onchange="fileInput('potoFileInput', 'potoOutput')">
    </div>
     <div class="imgSize"><img class="imgSize" id="potoOutput" src=""/></div>
    </div>
   </div>
   
   <div class="margin20"><!-- MAP -->
    <span><strong>MAP</strong></span><br/>
   <div style="display: flex; justify-content: left; margin:20px 20px 0px 5px;">
    <div>
     <input type='file' id='mapFileInput' onchange="fileInput('mapFileInput', 'mapOutput')">
    </div>
     <div class="imgSize"><img class="imgSize" id="mapOutput" src=""/></div>
   </div>
   </div>
   
  </div>
  
  
  <div class="margin20"><!-- 코스 테이블 -->
  <span class="margin20"><strong>코스</strong></span><br/>
  <table class="member tableSize" id="tableAction">
  	<tr>
  		<th>순번</th>
  		<th>경유지명/내용</th>
  		<th>시작 시간</th>
  		<th>끝나는 시간</th>
  	</tr>
  	<tr>
  		<td>1</td>
  		<td><input type="text" value=""></td>
  		<td><input type="text" value=""></td>
  		<td><input type="text" value=""></td>
  	</tr>
  	<tr>
  		<td>2</td>
  		<td><input type="text" value=""></td>
  		<td><input type="text" value=""></td>
  		<td><input type="text" value=""></td>
  	</tr>
  	<tr>
  		<td>3</td>
  		<td><input type="text" value=""></td>
  		<td><input type="text" value=""></td>
  		<td><input type="text" value=""></td>
  	</tr>
  </table>
   <div style="display: flex; justify-content: space-evenly;">
    <input type="button" value="항목추가" class="mainBtn" id="btn-add-row"/>
    <input type="button" value="항목제거" class="mainBtn" id="btn-delete-row"/>
   </div>
  </div>
  
  <div class="margin20"> <!-- 탑승료, 종료하기/수정하기 버튼 -->
   <div class="margin20"><strong>탑승료</strong></div>
   <div class="margin20"><strong>성인:</strong><input type="text" value=""/></div>
   <div class="margin20"><strong>기타:</strong><input type="text" value=""/></div>
   <div style="display: flex; justify-content: end; margin-bottom: 5px; margin-top: 20px;">
    <div class="marginLR10"></div><div class="marginLR10"><input type="button" value="추가하기" class="mainBtn" onclick="showPopup(true, 'popup')"/></div>
   </div>
  </div>
  </div>
  
  <!-- footer -->

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
	
	<!-- 팝업창 -->
	<div id="popup" class="hide popup">
	  <div class="content">
		<div style="width: 412px;">
			<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
			display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">투어 추가</div>
			
			<div style="background-color: #f0f6f9;">
				<div style="font-size: 16px; display: flex; justify-content: center; 
				align-items: center; height: 70px ;background-color: #f0f6f9;">해당 투어를 추가하시겠습니까?</div>
				
				<div style="display: flex; align-items: center; justify-content: space-evenly; padding-bottom: 10px;">
					<input type="button" value="예" class="popupBtn" onclick="windowMove('popup')">
					<input type="button" value="아니오" class="popupBtn" onclick="closePopup('popup')">
				</div>
			</div>
		</div>
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
		}//showPopup
		
		function closePopup(id) {
			const popup = document.querySelector("#"+id);
			popup.classList.add('hide');
		}//closePopup
		
		function windowMove(id) {
			closePopup(id);
			alert("해당 투어가 추가되었습니다.");
			location.href='manager_tour_manager.jsp';
		}//windowMove()
		
	</script>
	

</body>

</html>
