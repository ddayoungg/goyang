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

<!-- google jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">

<%
/* 22-10-17 ????????? ????????? ?????? ?????? */
//????????? ??????
String manageId="";//?????????
if(session.getAttribute("manageId") !=null){//???????????? ????????? ????????????.
	manageId = (String) session.getAttribute("manageId");
}//end if
%>
$(function(){
	
	accessChk();//?????? ?????? ??????
});//ready

function accessChk(){
	var Msess="<%= manageId %>";
	
	if(Msess==""){
		alert("????????? ????????????.");
		location.href="http://211.63.89.140/Manager/login_manager/manager_signIn.jsp";
		return;
	}//end if
}//accessChk

</script>

<title>???????????????-????????????</title>
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
				<a href="../dashboard_process/manager_dashboard.jsp" class="logo m-0">??????<span class="text-primary">.</span></a>

				<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-center">
					<li class="active"><a href="../dashboard_process/manager_dashboard.jsp">dash board</a></li>
					<li><a href="../user_manager_process/manager_member.jsp">????????????</a></li>
					<li><a href="../tour_manager_process/manager_tour_manager.jsp">????????????</a></li>
					<li><a href="manager_reservation.jsp">????????????</a></li>
					<li><a href="../spot_manager_process/manager_spot_list.jsp">????????? ??????</a></li>
					<li><a href="../review_manager_process/manager_review.jsp">????????????</a></li>
				</ul>

				<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li style="font-size: 5px; font-weight: bold;"><a
						href="../login_manager/manage_logout.jsp">????????????&nbsp;&nbsp;&nbsp;<%= manageId %></a>
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
						<h1 class="mb-0">????????????</h1>
						<!-- <p class="text-white">???????????? ????????????.</p> -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--  ??????????????? ??????????????? ?????????!!! -->
	
	<!-- ????????? -->
	<div class="container" style="margin-top: 20px;">
		<img src="../../images/bullet_Tues_sub_style_green.png" alt=image>
		<p
			style="font-size: 20px; font-weight: bold; padding-top: 20px; margin-bottom: 0;">?????? ????????????</p>
	</div>
	<!-- ????????? ??? -->

	<!-- ?????? ?????? ??? -->
	<div class="container">
		<!-- <div class="col-lg-6 text-center"> -->
		<h2 class="section-sub-title text-center mb-3"></h2>
		<!-- </div> -->
	</div>
	<!-- ?????? ?????? ??? ???-->

	<div class="container">
<!-- 		<form> -->
			<!-- <div style="font-size: 20px; margin: 50px 0px 10px 0px">????????????</div>
			<hr> -->

			<div>
			<form method="post" action="manager_reser_search.jsp">
				<div style="display: flex; justify-content: end; margin-bottom: 5px; margin-top: 20px;">
					<input type="text"  name="name" placeholder="???????????? ???????????????.">
					<input type="submit" value="??????" class="mainBtn">
				</div>
				</form>
			<!-- 	<form action=""> -->
				<table class="member" style="width: 100%">
					<tr>
						<th>????????????</th>
						<th>?????????</th>
						<th>?????? ?????? ??????</th>
						<th>?????? ?????? ??????</th>
						<th>???????????????</th>
						<th>??????</th>
						<th>??????</th>
						<th>????????????</th>
					</tr>
			<%
			ReservaManagerDAO reserDAO = ReservaManagerDAO.getInstance();
			ArrayList <ReservaManagerVO> list = reserDAO.selectSearchReserva();
			ReservaManagerVO reVO =new ReservaManagerVO();
			
			int total = 0;
			int totalPage = 0;
			String flagContent="";
			
				for ( ReservaManagerVO reserVO : list ){
					reVO=reserVO;
				if ( reVO.getReserFlag() == 1 ) {
					flagContent="????????????";
				} else if ( reVO.getReserFlag() == 2 ) {
					flagContent="????????????";
				} else if ( reVO.getReserFlag() == 3) {
					flagContent="????????????"; 
				} else if ( reVO.getReserFlag() == 4) {
					flagContent="????????????"; 
				}
				
				String cancelReas = reVO.getCancelReas();
				if ( reVO.getCancelReas() == null ) {
					cancelReas=" ";
				} else {
					cancelReas="????????????";
				}
			%>
			<%
					//??????????????????
					reserVO.setTotal(reserDAO.searchReserTotal(reserVO));
					
					//??? ?????? ??????
					total = reserVO.getTotal();
					//System.out.println( "total : " + total);
					
					//10?????? ????????? ??? ??? ????????? ??????
					totalPage = (int)Math.ceil((double)total/10);
					//System.out.println("totalPage : " + totalPage);
					
					//?????? ????????? ??????
					String nowPage = request.getParameter("nowPage");
					//System.out.println("nowPage : "+ nowPage);
					if( nowPage == null ){
						nowPage = "1";
						//System.out.println("nowPage : "+ nowPage);
					}
					
					//??????????????? ????????? ????????? ??????
					int lastIdx = Integer.valueOf(nowPage)*10;
					//System.out.println("lastIdx : "+ lastIdx );
					
					//??????????????? ????????? ????????? ??????
					int firstIdx = lastIdx-9;
					//System.out.println("firstIdx : "+ firstIdx );
					
					//firstIdx ~ lastIdx?????? ??????
					if (list.indexOf(reserVO)>=firstIdx-1 && list.indexOf(reserVO)<=lastIdx-1){
					%>					
					<tr>
						<td><%= reserVO.getReserNum()%></td>
				 <td><a href="#"><span onclick="location.href='manager_reser_search.jsp?reserNum=<%=reserVO.getReserNum() %>'"><%= reserVO.getName() %></span></a></td>
						<td><%= reserVO.getReserDate() %></td>
						<td><%=reserVO.getReserRegist() %>
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
						<option value="0">?????? ??????</option>
						<option value="1">????????????</option>
						<option value="2">????????????</option>
						<option value="3">????????????</option>
						<option value="4">????????????</option>
					</select>
					<input type="submit" value="??????" style="height: 32px" class="mainBtn">
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
					??? <span><%=total%></span>?????? ?????? 
				</div>
			</div>

	</div>


	<div class="site-footer">
		<div class="inner first">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<div class="widget" style="width:500px">
							<p style="font-size: 20px;font-weight: bold; color: red;font-style:inherit;">?????? ???????????? ??????
								???????????????.</p>
							<p style="font-size: 60px;font-weight: bold;">Goyang Tour</p>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 " style="margin: 0 0 0 auto">
						<div class="widget" style="width:500px">
							<h3 class="heading">??????????????????</h3>
							<ul class="list-unstyled quick-info links">
								<li class="email">goyang@com</li>
								<li class="phone">010-1234-5678</li>
								<li class="address">????????? ????????? ???????????? ?????????</li>
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
	<!-- ????????? : manager_reservation_detail -->
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
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">?????? ??????
				</div>

				<div style="width: 800px">
					<table class="member" style="width: 100%">
						<tr>
							<th>????????????</th>
						<td>dd</td> 
						</tr>
						<tr>
							<th>?????????</th>
							<td>dd</td>
						</tr>
						<tr>
							<th>????????? ??????</th>
							<td>dd</td>
						</tr>
						<tr>
							<th>??????</th>
							<td>dd</td>
						</tr>
						<tr>
							<th>????????????</th>
							<td>dd</td>
						</tr>
						<tr>
							<th>????????? </th>
							<td>dd<br>dd</td>
						</tr>
						<tr>
							<th>????????? ?????? ??????</th>
							<td>dd</td>
						</tr>
					</table>
				</div>
			<!-- 	</form> -->

				<div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
					<input type="button" value="????????????" class="popupBtn" onclick="showPopup(true,'popupConfirm_1')">
					<input type="button" value="??????" class="popupBtn" onclick="closePopup('popupDetail')">
				</div>
			</div>
		</div>
	</div>
	
	<!-- ????????? : manager_reservation_cancel -->
	<div id="popupCancel" class="popup">
	<% 
	 int cancel= Integer.parseInt(request.getParameter("reserNum"));  
	ReservaManagerVO reserVO = new ReservaManagerVO();
	 reserVO = reserDAO.selectDelReserva(cancel);
	%>
	<%
	reserVO.setSeatNums(reserDAO.searchSeatNum(reserVO));
	%>
		<div class="content">
			<div style="width: 800px;">
				<div style="font-weight: bold; font-size: 15px; width: 800px; height: 40px; padding-left: 15px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">?????? ??????
				</div>

				<div style="width: 800px">
					<table class="member" style="width: 100%">
						<tr>
							<th>????????????</th>
						<td><%=reserVO.getReserNum()%></td> 
						</tr>
						<tr>
							<th>????????????</th>
							<td><%=reserVO.getName() %></td>
						</tr>
						<tr>
							<th>????????????</th>
							<%
							if ( reserVO.getReserFlag() == 1 ) {
								flagContent="????????????";
							} else if ( reserVO.getReserFlag() == 2 ) {
								flagContent="????????????";
							} else if ( reserVO.getReserFlag() == 3) {
								flagContent="????????????"; 
							} else if ( reserVO.getReserFlag() == 4) {
								flagContent="????????????"; 
							} 
							%>
							<td><%=flagContent %></td>
						</tr>
						<tr>
							<th>?????????</th>
							<td><%=reserVO.getEmail()%></td>
						</tr>
						<tr>
							<th>????????? ??????</th>
							<td><%=reserVO.getPhone()%></td>
						</tr>
							<tr>
							<th>?????? ?????? ??????</th>
							<td><%=reserVO.getReserDate()%></td>
						</tr>
						<tr>
							<th>?????? ?????? ??????</th>
							<td><%=reserVO.getReserRegist()%></td>
						</tr>
						<tr>
							<th>????????????</th>
							<td><%=reserVO.getTourName()%></td>
						</tr>
						<tr>
							<th>????????? </th>
						<td>??????(<%=reserVO.getAdultFee()%>???) : <%=reserVO.getAdultCnt()%>???<br>??????(<%=reserVO.getOtherFee() %>???) : <%=reserVO.getOtherCnt() %>???</td>
						</tr>
						<tr>
							<th>????????? ?????? ??????</th>
							<td>
							<% for(int i=0; i<reserVO.getSeatNums().length; i++){
								if(reserVO.getSeatNums()[i]==0){%>
									????????????
								<%}else{%>
								<%= reserVO.getSeatNums()[i]  %>???&nbsp;
							<%}}//end for %>
							</td>
						</tr>
						<tr>
							<th>?????? ??????</th>
							<td><%=reserVO.getCancelReas() %></td>
						</tr>
					</table>
				</div>
			</div>
			<div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
				<input   id="cancelButton" type="button" value="????????????" class="popupBtn" 
				onclick="location.href='manager_reser_cancel_up.jsp?reserNum=<%=reserVO.getReserNum() %>'">
				<input type="button" value="??????" class="popupBtn" onclick="location.href='manager_reservation.jsp'">
			</div>
		</div>
	</div>
	<!-- ????????? : manager_reservation_cancel_1 -->
	<div id="popupCancel_1" class="hide popup">
		<div class="content">
			<div style="width: 412px;">
				<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">?????? ?????? ??????
				</div>

				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
			align-items: center; height: 70px ;background-color: #f0f6f9;">?????? ?????????????????????????</div>

					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="??????" class="popupBtn" onclick="showPopup(true,'popupCancel_2')">
						<input type="button" value="??????" class="popupBtn" onclick="closePopup('popupCancel_1')">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ????????? : manager_reservation_cancel_2 -->
	<div id="popupCancel_2" class="hide popup">
		<div class="content">
			<div style="width: 412px;">
				<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">?????? ?????? ??????
				</div>

				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
			align-items: center; height: 70px ;background-color: #f0f6f9;">?????? ?????????????????????.</div>

					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="??????" class="popupBtn"
							onclick="location.href='manager_reservation.jsp'">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ????????? : manager_reservation_confirm_1 -->
	<div id="popupConfirm_1" class="hide popup">
		<div class="content">
			<div style="width: 412px;">
				<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">?????? ?????? ??????
				</div>

				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
			align-items: center; height: 70px ;background-color: #f0f6f9;">?????? ?????????????????????????</div>

					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="??????" class="popupBtn" onclick="showPopup(true,'popupConfirm_2')">
						<input type="button" value="??????" class="popupBtn" onclick="closePopup('popupConfirm_1')">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ????????? : manager_reservation_confirm -->
	<div id="popupConfirm_2" class="hide popup">
		<div class="content">
			<div style="width: 412px;">
				<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">?????? ?????? ??????
				</div>

				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
			align-items: center; height: 70px ;background-color: #f0f6f9;">???????????? ???????????????.</div>

					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="??????" class="popupBtn"
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

	<!-- ??????  -->
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
				
/* jsp??????????????? jquery??? ??? ????????? ( ?????? ????????? ?????? ?????? ???????????? ??????)*/	
<%
for(int i=0; i<reserVO.getSeatNums().length; i++){
if(reserVO.getSeatNums()[i]==0){
	%>
	$("#cancelButton").hide();
<%}else{ %>
	$("#cancelButton").show();
<%} }%>
	

	</script>
</body>

</html>