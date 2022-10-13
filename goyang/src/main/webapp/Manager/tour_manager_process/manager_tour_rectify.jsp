<%@page import="java.util.List"%>
<%@page import="kr.co.goyang.manager.vo.TourManagerVO"%>
<%@page import="kr.co.goyang.manager.dao.TourManagerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- google jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">

<%
//초기값 설정
//String id=null;//로그인 하지 않은 경우
String id="admin";//아이디
int tourNum=0;//투어 번호
%>

<%
//로그인 여부(권한여부)
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if
if(id==null){//로그인되지 않았다면
	response.sendRedirect("http://localhost/goyang/Manager/login_manager/manager_signIn.jsp");
	return;
}//end if

//투어 번호 set
if(request.getParameter("tourNum") !=null){//투어 번호 가져오기
	tourNum = Integer.parseInt(request.getParameter("tourNum"));
}//end if
if(tourNum==0){//투어번호를 가져오지 못할 경우
	response.sendRedirect("http://localhost/goyang/Manager/tour_manager_process/manager_tour_manager.jsp");
	return;
}//end if
%>

tableCnt=0;
$(function(){
	
	$("#thumImgFile").change(function(){//대표 사진 세팅
		setFile();
	})//change
	
	tableCnt=$("#tableAction tr").length;//생성된 테이블의 행의 수
	
	$('#btn-add-row').click(function() {
		if($('#tableAction tr').length>12){
			return;
		}
		var tableTemp ="<tr><td><input type='text' name='tourOrderIn' value='" + tableCnt++ + "' size=1 readonly='readonly'/></td>"
		tableTemp +="<td><input type='text' name='spotNameIn' value=''/></td>"
		tableTemp +="<td><input type='text' name='startHourIn' value='' size=3 maxlength='20'/></td>"
		tableTemp +="<td><input type='text' name='endHourIn' value='' size=3 maxlength='20'/></td>"
		tableTemp +="<td><input type='text' name='mapSpoLatiIn' value='' size=3 maxlength='20'/></td>";
		tableTemp +="<td><input type='text' name='mapSpoLongIn' value='' size=3 maxlength='20'/></td></tr>";
		
		$("#tableAction").last().append(tableTemp);
	  });
	
	$("#btn-delete-row").click(function(){
		if($('#tableAction tr').length<4){
			return;
		}
		$("#tableAction tr").last().remove();
		tableCnt--;
		if(tableCnt == -1){tableCnt=0;}
	});//click
	
	$("#rectifyBtn").click(function() { //수정하기 유효성 검사 후 submit
		chkNull();
	});//click
})//ready

function chkNull(){
	if($("#tourName").val().trim()=="") {
		alert("코스명을 입력해주세요.");
		$("#tourName").val("");//화이트 스페이스 초기화
		$("#tourName").focus();//커서 이동
		return;
	}//end if
	
	if($("#explain").val().trim()=="") {
		alert("요약설명을 입력해주세요.");
		$("#explain").val("");//화이트 스페이스 초기화
		$("#explain").focus();//커서 이동
		return;
	}//end if
	
	var spotNameFlag=true;
	$("input[name=spotNameIn]").each(function(index, item){
		if($(item).val().trim()=="") {
			spotNameFlag=false;
		}//end if
	});//each
	
	if(!spotNameFlag) {//관광지명이 하나라도 빈 칸이 있을 경우
		alert("관광지명을 입력해주세요.");
		return;
	}//end if
	
	if($("#adultFee").val().trim()=="") {
		alert("성인 가격을 입력해주세요.");
		$("#adultFee").val("");//화이트 스페이스 초기화
		$("#adultFee").focus();//커서 이동
		return;
	}//end if
	
	if($("#otherFee").val().trim()=="") {
		alert("기타 가격을 입력해주세요.");
		$("#otherFee").val("");//화이트 스페이스 초기화
		$("#otherFee").focus();//커서 이동
		return;
	}//end if
	
	var imgFlag=chkImg(); // 선택한 파일이 이미지 형식인지 검사
	
	if(!imgFlag){
		alert("이미지파일만 업로드 가능");
		return;
	}//end if
	
	showPopup(true,'popup');	
}//chkNull

function chkImg(){
	//확장자가 jpg, gif, jpeg, png, bmp만 업로드 가능하도록 JS 코드 작성
	
	var fileName=$("#hiddThumImg").val();
	var blockExt="jpg,gif,jpeg,png,bmp".split(",");
	var flag=false;
	
	/* if(fileName==""){
		alert("업로드할 파일을 선택해주세요.");
		return;
	}//end if */
	
	var fileExt=fileName.substring(fileName.lastIndexOf(".")+1);
	for(var i=0; i < blockExt.length; i++){
		if(blockExt[i] == fileExt){
			flag=true;
		}//end if
	}//end for
	
	return flag;
	
}//chkImg

function setFile(){
	var fReader = new FileReader();
	fReader.readAsDataURL($("#thumImgFile")[0].files[0]);
	fReader.onloadend = function(event) {
	$("#thumImgOutput").attr("src", event.target.result);
		
	/* 파일명 hidden 세팅*/
	var fileValue = $("#thumImgFile").val().split("\\");
	var fileName = fileValue[fileValue.length-1]; // 파일명
		$("#hiddThumImg").val(fileName);
	}//end onloadend
}//setFile
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
			style="font-size: 20px; font-weight: bold; padding-top: 20px; margin-bottom: 0;">투어 정보 수정</p>
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
  <%
  TourManagerDAO tmDAO=TourManagerDAO.getInstance();
  TourManagerVO tourInfo=tmDAO.selectTour(tourNum);
  
  pageContext.setAttribute("tourInfo", tourInfo);
  %>
  <div class="container">
  <form id="recitfyFrm" action="manager_tour_rectify_process.jsp" method="post" enctype="multipart/form-data">
   <div class="margin20">
    <span><strong>코스명</strong></span><br/>
    <input type="text" class="textSize" name="tourName" id="tourName" value="${ tourInfo.tourName }" placeholder="코스명을 입력하세요." maxlength=20/><br/>
    </div>
    <div class="margin20">
    <span><strong>요약 설명</strong></span><br/>
    <input type="text" class="textSize" name="explain" id="explain" value="${ tourInfo.explain }" placeholder="내용을 입력하세요." maxlength=30/>
   </div>

   
  <div style="display: flex; justify-content: left; margin:20px 20px 0px 5px;">

    <div class="margin20"><!-- 중심 위도 경도 -->
    <span><strong>중심 위도</strong></span>
    <input type="text" name="mapCenLati" class="margin20" value="${ tourInfo.mapCenLati }" /><br/>
    <span><strong>중심 경도</strong></span>
    <input type="text" name="mapCenLong" class="margin20" value="${ tourInfo.mapCenLong }" /><br/>
   </div>
   
   <div class="margin20"><!-- 대표 사진 -->
   <span><strong>대표 사진</strong></span><br/>
   <div style="display: flex; justify-content: left; margin:20px 20px 0px 5px;">
    <div>
     <input type='file' id="thumImgFile" name="thumImgFile" accept="image/*" value="${ tourInfo.thumImg }">
     <input type="hidden" id="hiddThumImg" name="thumImg" value="${ tourInfo.thumImg }"/>
    </div>
     <div class="imgSize"><img class="imgSize" id="thumImgOutput" src="http://localhost/goyang/images/${ tourInfo.thumImg }"/></div>
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
  		<th>위도</th>
  		<th>경도</th>
  	</tr>
  	<%
  	List<TourManagerVO> tourSportList=tmDAO.selectTourSpots(tourNum);
  	pageContext.setAttribute("tourSportList", tourSportList);
  	%>
	<c:forEach var="tourSport" items="${ tourSportList }">	
  	<tr>
  		<td><input type="text" name="tourOrderIn" value="${ tourSport.tourOrder }" size=1 readonly="readonly"/></td>
  		<td><input type="text" name="spotNameIn" value="${ tourSport.spotName }" /></td>
  		<td><input type="text" name="startHourIn" value="${ tourSport.startHour }" size=3 maxlength='20'/></td>
  		<td><input type="text" name="endHourIn" value="${ tourSport.endHour }" size=3 maxlength='20'/></td>
  		<td><input type="text" name="mapSpoLatiIn" value="${ tourSport.mapSpoLati }" size=3 maxlength='20'/></td>
  		<td><input type="text" name="mapSpoLongIn" value="${ tourSport.mapSpoLong }" size=3 maxlength='20'/></td>
  	</tr>
  	</c:forEach>
  </table>
   <div style="display: flex; justify-content: space-evenly;">
    <input type="button" value="항목추가" class="mainBtn" id="btn-add-row"/>
    <input type="button" value="항목제거" class="mainBtn" id="btn-delete-row"/>
   </div>
  </div>
  
  <div class="margin20"> <!-- 탑승료, 종료하기/수정하기 버튼 -->
   <div class="margin20"><strong>탑승료</strong></div>
   <div class="margin20"><strong>성인:</strong><input type="text" name="adultFee" id="adultFee" value="${ tourInfo.adultFee }"/></div>
   <div class="margin20"><strong>기타:</strong><input type="text" name="otherFee" id="otherFee" value="${ tourInfo.otherFee }"/></div>
   <div style="display: flex; justify-content: end; margin-bottom: 5px; margin-top: 20px;">
   <input type="hidden" name="tourNum" value="<%= tourNum %>"/>
    <div class="marginLR10"></div><div class="marginLR10"><input type="button" id="rectifyBtn" value="수정하기" class="mainBtn"/></div>
   </div>
  </div>
  </form>
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
	
	<!-- 투어 수정 확인 팝업 popup -->
	<div id="popup" class="hide popup">
		<div class="content">
			<div style="width: 450px;">
				<div style="font-size: 12px; width: 450px; height: 30px; padding-left: 10px;
				display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">투어 수정 확인</div>
				
				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
					align-items: center; height: 70px ;background-color: #f0f6f9;">해당 투어를 수정하시겠습니까?</div>
					
					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="확인" class="popupBtn" onclick="windowMove('popup')">
						<input type="button" value="취소" class="popupBtn" onclick="closePopup('popup')">
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
			$("#recitfyFrm").submit();
		}//windowMove()
		
	</script>

</body>

</html>
