<%@page import="kr.co.goyang.manager.vo.SpotListVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.goyang.manager.dao.SpotListDAO"%>
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
  <meta name="keywords" contenta="bootstrap, bootstrap4" />

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


 <title>관리자화면-관광지관리</title>
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
		location.href="http://localhost/goyang/Manager/login_manager/manager_signIn.jsp";
		return;
	}//end if
}//accessChk

</script>

	
<script type="text/javascript">

$(function(){
	
	
	$("#selTour").change(function() {
		$("#listFrm").submit();
	});
	
	<%
	String tourName=request.getParameter("selTour");
	if(tourName==null){ //기본값은 화요나들이.(테스트)
		tourName="화요나들이(벽제)";
	}
	SpotListDAO spotDAO=SpotListDAO.getInstance();
	List<SpotListVO> list=spotDAO.selectTourSpots(tourName);
	
	
	 
	
	
	/////////////////////////////////////////////
	
	%>
	
	$("#selTour option[value='<%=tourName %>']").prop("selected",true);
	
	//수정버튼 클릭시 그 행에 대한 td값 가져오기
	$("#modi input").on('click',function() {
		
		var currentRow=$(this).closest('tr');
		var tourOrder=currentRow.find('td:eq(0)').text();
	      
	    location.href="manager_spot_modi.jsp?tourname=<%=tourName %>&tourorder="+tourOrder;
	});
	
	//웹테스트버튼 클릭시 그 행에 대한 td값 가져오기
	$("#webTest input").on('click',function() {	
		
		var currentRow=$(this).closest('tr');
		var tourOrder=currentRow.find('td:eq(0)').text();
		
		location.href="manager_spot_list_popup.jsp?tourname=<%=tourName %>&tourorder="+tourOrder;
		
	    
	});
	
});

</script>
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

				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-center">
					<li class="active"><a href="../dashboard_process/manager_dashboard.jsp">dash board</a></li>
					<li><a href="../user_manager_process/manager_member_popup.jsp">회원관리</a></li>
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
			style="font-size: 20px; font-weight: bold; padding-top: 20px; margin-bottom: 0;">관광지 소개</p>
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
		
			<!-- <div style="font-size:23px; margin:50px 0px 10px 0px; display:flex; justify-content:space-between;">
				<div style="font-weight: bold;"> 관광지 소개 </div>
			</div>
<hr> -->	<%
				
				String[] spots=spotDAO.selectTourList();
			%>
			<form action="manager_spot_list.jsp" id="listFrm" name="listFrm" method="get">
			<div style="display:flex; justify-content:end; margin-bottom:25px; height:35px; align-items:end;">
				<select style="height: 35px" id="selTour" name="selTour">
					<option value="none">-- 코스 선택 --</option>
					<% for(int i=0;i<spots.length;i++){ %>
					<option value="<%=spots[i] %>"><%=spots[i] %></option>
					<%}%>
				</select>
			</div>
			</form>
			
 			<div style="margin-bottom:50px;">
				<table class="member" style="width:100%" id="TspotList">
					<tr>
						<th>번호</th>
						<th style="min-width:300px;">투어코스</th>
						<th style="min-width:300px;">관광지</th>
						<th colspan="2"></th>
						
					</tr>
					
					<%
						SpotListVO listVO=new SpotListVO();
						
						for(int i=0;i<list.size();i++){
							listVO=list.get(i);
					%>
					<tr>
						<td><%=listVO.getTourOrder() %></td>
						<td><%=listVO.getTourName() %></td>
						<td><%=listVO.getSpotsName() %></td>
						<td id="webTest"><input type="button" value="웹테스트" class="mainBtn"  style="width:100px; height:32px;"></td>
						<td id="modi"><input type="button" value="수정" class="mainBtn" style="width:80px; height:32px;"></td>
						<!-- <td><input type="button" value="삭제" class="mainBtn" onclick="showPopup(true,'popup')" style="width:80px; height:32px;"></td> -->
					</tr>
					<%}%>
				</table>
				
				<!-- <div style="justify-content: end; display: flex; align-items: center; margin-bottom:100px; margin-top:10px;">
					<input type="button" value="추가" class="mainBtn" onclick="location.href='manager_spot_addition.jsp'" style="width:90px; height:32px;">
				</div> -->
				
			</div>
		
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
  
  
  <!-- 관광지 삭제 팝업 popup -->
	<div id="popup" class="hide popup">
		<div class="content">
			<div style="width: 450px;">
				<div style="font-size: 12px; width: 450px; height: 30px; padding-left: 10px;
				display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">관광지 삭제 확인</div>
				
				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
					align-items: center; height: 70px ;background-color: #f0f6f9;">해당 관광지를 삭제하시겠습니까?</div>
					
					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="확인" class="popupBtn" onclick="showPopup(true,'popup2')">
						<input type="button" value="취소" class="popupBtn" onclick="closePopup('popup')">
					</div>
				</div>
			</div>
	  </div>
	</div>
	
	<%
		
	%>
	<!-- 관광지 삭제 확인 팝업 - popup2 -->
	<div id="popup2" class="hide popup">
	  <div class="content">
		<div style="width: 450px;">
			<div style="font-size: 12px; width: 450px; height: 30px; padding-left: 10px;
			display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">관광지 삭제 확인</div>
			
			<div style="background-color: #f0f6f9;">
				<div style="font-size: 16px; display: flex; justify-content: center; 
				align-items: center; height: 70px ;background-color: #f0f6f9;">삭제되었습니다.</div>
				
				<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
					<input type="button" value="확인" class="popupBtn" onclick="closePopup('popup2')">
				</div>
			</div>
		</div>
	  </div>
	</div>
	<%-- <% 
	
	SpotListVO setting=new SpotListVO();
	setting.setTourName(tourName);
	setting.setTourOrder(listVO.getTourOrder());
	
	SpotListVO spotVO=spotDAO.selectSpot(setting);
	System.out.println(spotVO);
	String Sname=spotVO.getSpotsName();
	String SContent=spotVO.getSpoContent();
	String Simg=spotVO.getSpotsImg();
	
	if(SContent==null){
		SContent="관광지내용없음.";
	}
	if(Simg==null){
		Simg="no.png";
	}
	
	
	%> --%>

	<!-- 관광지 웹테스트 - popup3 -->
	<%-- <div id="popup3" class="hide popup">
	  <div class="content">
		<div style="width: 600px;">
			<div>
       	 		<div id="modalBar" style="font-size: 20px; font-weight: bold; padding: 20px 0 0 0;
      		 	 margin: 0;"><%=Sname %> 소개
      		 	 </div>
       			 <h2 class="section-sub-title text-center mb-3"></h2>
     		 </div>
      		<div style="text-align: center; padding-top: 20px; padding-bottom: 20px;">
     		   <img src="../../images/<%=Simg %>" width="300px">
     		</div>
      		<div style="padding-bottom: 80px;">
        		<div id="modalTitle" style="font-weight: bold; font-size: 16px; text-align: center;">
        		  <%=Sname %>
        		 </div>
       			 <div id="modalInfo" style="font-size: 16px; padding: 0 80px 0 80px;">
         			<%=SContent %>
         			</div>
      		</div>
				<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
					<input type="button" value="확인" class="popupBtn" onclick="closePopup('popup3')">
				</div>
			</div>
		</div>
	  </div> --%>

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
