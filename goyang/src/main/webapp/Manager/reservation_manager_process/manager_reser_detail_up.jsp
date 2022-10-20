<%@page import="java.lang.reflect.Array"%>
<%@page import="kr.co.goyang.user.vo.TourListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.co.goyang.manager.dao.ReservaManagerDAO" %>
    <%@ page import="kr.co.goyang.manager.vo.ReservaManagerVO" %>
    
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
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
	<link rel="preconnect" href="https://fonts.gstatic.com" >
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

<!-- google jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">

<%
/* 22-10-17 남상민 아이디 세션 추가 */
//아이디 세션
String manageId="";//아이디
if(session.getAttribute("manageId") !=null){//세션에서 아이디 가져오기.
	manageId = (String) session.getAttribute("manageId");
}//end if
%>
$(function(){
	
	accessChk();//접근 권한 체크
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

<title>관리자화면-예약관리</title>
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
				<a href="../dashboard_process/manager_dashboard.jsp" class="logo m-0">고양<span class="text-primary">.</span></a>

				<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-center">
					<li class="active"><a href="../dashboard_process/manager_dashboard.jsp">dash board</a></li>
					<li><a href="../user_manager_process/manager_member.jsp">회원관리</a></li>
					<li><a href="../tour_manager_process/manager_tour_manager.jsp">투어관리</a></li>
					<li><a href="manager_reservation.jsp">예약관리</a></li>
					<li><a href="../spot_manager_process/manager_spot_list.jsp">관광지 관리</a></li>
					<li><a href="../review_manager_process/manager_review.jsp">후기관리</a></li>
				</ul>

				<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li style="font-size: 5px; font-weight: bold;"><a
						href="../login_manager/manage_logout.jsp">로그아웃&nbsp;&nbsp;&nbsp;<%= manageId %></a>
						</li>
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
						<h1 class="mb-0">예약관리</h1>
						<!-- <p class="text-white">로그인을 해주세요.</p> -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--  여기사이에 구상하시면 됩니다!!! -->
	
	<!-- 대제목 -->
	<div class="container" style="margin-top: 20px;">
		<img src="../../images/bullet_Tues_sub_style_green.png" alt=image>
		<p
			style="font-size: 20px; font-weight: bold; padding-top: 20px; margin-bottom: 0;">투어 정보 관리 리스트</p>
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
<!-- 		<form> -->
			<!-- <div style="font-size: 20px; margin: 50px 0px 10px 0px">예약관리</div>
			<hr> -->

			<div>
			<form method="post" action="manager_reser_search.jsp">
				<div style="display: flex; justify-content: end; margin-bottom: 5px; margin-top: 20px;">
					<input type="text"  name="name" placeholder="고객명을 입력하세요.">
					<input type="submit" value="검색" class="mainBtn">
				</div>
				</form>
			<!-- 	<form action=""> -->
				<table class="member" style="width: 100%">
					<tr>
						<th>예약번호</th>
						<th>고객명</th>
						<th>투어 시작 날짜</th>
						<th>예약 신청 날짜</th>
						<th>투어코스명</th>
						<th>요금</th>
						<th>상태</th>
						<th>기타내용</th>
					</tr>
			<%
			ReservaManagerDAO reserDAO = ReservaManagerDAO.getInstance();
			ArrayList <ReservaManagerVO> list = reserDAO.selectSearchReserva();
			ReservaManagerVO reVO =new ReservaManagerVO();
			
			int total = 0;
			int totalPage = 0;
			String flagContent ="";
			
				for ( ReservaManagerVO reserVO : list ){
					reVO=reserVO;
				if ( reVO.getReserFlag() == 1 ) {
					flagContent="예약대기";
				} else if ( reVO.getReserFlag() == 2 ) {
					flagContent="예약확정";
				} else if ( reVO.getReserFlag() == 3) {
					flagContent="취소요청"; 
				} else if ( reVO.getReserFlag() == 4) {
					flagContent="취소확정"; 
				}
				
				String cancelReas = reVO.getCancelReas();
				if ( reVO.getCancelReas() == null ) {
					cancelReas=" ";
				} else {
					cancelReas="취소사유";
				}
			%>
					<%
					//페이지네이션
					reserVO.setTotal(reserDAO.searchReserTotal(reserVO));
					
					//총 예약 개수
					total = reserVO.getTotal();
					//System.out.println( "total : " + total);
					
					//10개씩 보여줄 때 총 페이지 개수
					totalPage = (int)Math.ceil((double)total/10);
					//System.out.println("totalPage : " + totalPage);
					
					//현재 페이지 번호
					String nowPage = request.getParameter("nowPage");
					//System.out.println("nowPage : "+ nowPage);
					if( nowPage == null ){
						nowPage = "1";
						//System.out.println("nowPage : "+ nowPage);
					}
					
					//페이지에서 보여줄 마지막 목록
					int lastIdx = Integer.valueOf(nowPage)*10;
					//System.out.println("lastIdx : "+ lastIdx );
					
					//페이지에서 보여줄 첫번째 목록
					int firstIdx = lastIdx-9;
					//System.out.println("firstIdx : "+ firstIdx );
					
					//firstIdx ~ lastIdx까지 출력
					if (list.indexOf(reserVO)>=firstIdx-1 && list.indexOf(reserVO)<=lastIdx-1){
					%>
					<tr>
						<td><%= reserVO.getReserNum()%></td>
				 <td><a href="#"><span onclick="location.href='manager_reser_search.jsp?reserNum=<%=reserVO.getReserNum() %>'"><%= reserVO.getName() %></span></a></td>
					
						<td><%= reserVO.getReserDate() %></td>
						<td><%= reserVO.getTourName( ) %></td>
						<td><%= reserVO.getAdultCnt()*reserVO.getAdultFee()+reserVO.getOtherCnt()*reserVO.getOtherFee() %></td>
						<td><%=flagContent %></td>
						<td><a href="#void"><span onclick="location.href='manager_reser_cancel.jsp?reserNum=<%=reserVO.getReserNum() %>'"><%= cancelReas %></span></a></td>
					</tr>
			<%
					}}					
			%>
				</table>
			</div>
	
		
			

			<div style="display: flex; justify-content: space-between; align-items: center;">
				<div>
				<form action="manager_reservation_search.jsp" method="post">
					<select name="state" style="height: 32px; min-width: 120px;">
						<option value="0">상태 검색</option>
						<option value="1">예약대기</option>
						<option value="2">예약확정</option>
						<option value="3">취소요청</option>
						<option value="4">취소확정</option>
					</select>
					<input type="submit" value="검색" style="height: 32px" class="mainBtn">
				</form>
				</div>

				<div style="margin: 20px 0px 20px; display: flex; justify-content: center; height: 32px;">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item">
							 	<a class="page-link" href="#" aria-label="Previous">
							 		<span aria-hidden="true">&laquo;</span>
							 	</a>
							 	</li>
							 	<% for(int i=1; i<=totalPage; i++){ %>
							 	<li class="page-item">
							 		<a class="page-link" href="manager_reservation.jsp?nowPage=<%= i %>"><%= i %></a>
							 	</li>
							 	<%} %>
							 	<li class="page-item">
							 		<a class="page-link" href="#" aria-label="Next"> 
							 				<span aria-hidden="true">&raquo;</span>
							 			</a>
							 	</li>
						</ul>
					</nav>
				</div>

				<div>
					총 <span><%=total%></span>건의 예약 
				</div>
			</div>

	</div>


	<div class="site-footer">
		<div class="inner first">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<div class="widget" style="width:500px">
							<p style="font-size: 20px;font-weight: bold; color: red;font-style:inherit;">매주 월요일은 정기
								휴무입니다.</p>
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
							. All Rights Reserved. &mdash; Designed with love by <a href="https://untree.co"
								class="link-highlight">Untree.co</a>
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
	<!-- 팝업창 : manager_reservation_detail -->
	<form id="popupFrm">
	<div id="popupDetail" class="hide popup">
<%-- 	<%
	 int num = Integer.parseInt(request.getParameter("reserNum"));  
	ReservaManagerVO reserVO = new ReservaManagerVO();
	reserVO = reserDAO.selectReserva(num);
	%> --%>
		<div class="content">
			<div style="width: 800px;">
	<!-- <form method="post"> -->
				<div style="font-weight: bold; font-size: 15px; width: 800px; height: 40px; padding-left: 15px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">예약 상세
				</div>

				<div style="width: 800px">
					<table class="member" style="width: 100%">
						<tr>
							<th>예약자명</th>
						<td>dd</td> 
						</tr>
						<tr>
							<th>이메일</th>
							<td>dd</td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td>dd</td>
						</tr>
						<tr>
							<th>날짜</th>
							<td>dd</td>
						</tr>
						<tr>
							<th>투어코스</th>
							<td>dd</td>
						</tr>
						<tr>
							<th>인원수 </th>
							<td>dd<br>dd</td>
						</tr>
						<tr>
							<th>예약한 좌석 번호</th>
							<td>dd</td>
						</tr>
					</table>
				</div>
			<!-- 	</form> -->

				<div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
					<input type="button" value="예약확정" class="popupBtn" onclick="showPopup(true,'popupConfirm_1')">
					<input type="button" value="확인" class="popupBtn" onclick="closePopup('popupDetail')">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 팝업창 : manager_reservation_cancel -->
	<div id="popupCancel" class="hide popup">
<%-- 	<% 
	 int cancel= Integer.parseInt(request.getParameter("reserNum"));  
	ReservaManagerVO reserVO = new ReservaManagerVO();
	 reserVO = reserDAO.selectDelReserva(cancel);
	%> --%>
		<div class="content">
			<div style="width: 800px;">
				<div style="font-weight: bold; font-size: 15px; width: 800px; height: 40px; padding-left: 15px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">취소 사유
				</div>

				<div style="width: 800px">
					<table class="member" style="width: 100%">
						<tr>
							<th>예약자명</th>
							<td>dd</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>dd</td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td>dd</td>
						</tr>
						<tr>
							<th>날짜</th>
							<td>dd</td>
						</tr>
						<tr>
							<th>투어코스</th>
							<td>dd</td>
						</tr>
						<tr>
							<th>인원수 </th>
						<td>dd<br>dd</td>
						</tr>
						<tr>
							<th>예약한 좌석 번호</th>
							<td>dd</td>
						</tr>
						<tr>
							<th>취소 사유</th>
							<td>dd</td>
						</tr>
					</table>
				</div>
			</div>
			<div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
				<input type="button" value="취소확정" class="popupBtn" onclick="showPopup(true,'popupCancel_1')">
				<input type="button" value="확인" class="popupBtn" onclick="closePopup('popupCancel')">
			</div>
		</div>
	</div>
	<!-- 팝업창 : manager_reservation_cancel_1 -->
	<div id="popupCancel_1" class="hide popup">
		<div class="content">
			<div style="width: 412px;">
				<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">취소 확정 확인
				</div>

				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
			align-items: center; height: 70px ;background-color: #f0f6f9;">취소 확정하시겠습니까?</div>

					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="확인" class="popupBtn" onclick="showPopup(true,'popupCancel_2')">
						<input type="button" value="취소" class="popupBtn" onclick="closePopup('popupCancel_1')">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 팝업창 : manager_reservation_cancel_2 -->
	<div id="popupCancel_2" class="hide popup">
		<div class="content">
			<div style="width: 412px;">
				<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">취소 확정 확인
				</div>

				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
			align-items: center; height: 70px ;background-color: #f0f6f9;">취소 확정되었습니다.</div>

					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="확인" class="popupBtn"
							onclick="location.href='manager_reservation.jsp'">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 팝업창 : manager_reservation_confirm_1 -->
	<div id="popupConfirm_1" class="hide popup">
		<div class="content">
			<div style="width: 412px;">
				<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">예약 확정 확인
				</div>

				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
			align-items: center; height: 70px ;background-color: #f0f6f9;">예약 확정하시겠습니까?</div>

					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="확인" class="popupBtn" onclick="showPopup(true,'popupConfirm_2')">
						<input type="button" value="취소" class="popupBtn" onclick="closePopup('popupConfirm_1')">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 팝업창 : manager_reservation_confirm -->
	<div id="popupConfirm_2" class="popup">
	<%
	int upFlag = Integer.parseInt(request.getParameter("reserNum"));
	ReservaManagerVO reserVO = new ReservaManagerVO();
	 reserVO = reserDAO.updateReserva(upFlag); 
	%>
		<div class="content">
			<div style="width: 412px;">
				<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">예약 확정 확인
				</div>

				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
			align-items: center; height: 70px ;background-color: #f0f6f9;">예약확정 되었습니다.</div>

					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="확인" class="popupBtn"
							onclick="location.href='manager_reservation.jsp'">
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>

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

	<!-- 도희  -->
	<script type="text/javascript">
		function showPopup(hasFilter, id) {
			const popup = document.querySelector('#' + id);
			if (hasFilter) {
				popup.classList.add('has-filter');
			} else {
				popup.classList.remove('has-filter');
			}
			popup.classList.remove('hide');
		}
		
		
		function closePopup(id) {
			const popup = document.querySelector('#' + id);
			popup.classList.add('hide');
		}	
				
	
	</script>
</body>

</html>