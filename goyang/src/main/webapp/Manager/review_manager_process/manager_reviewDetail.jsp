<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="kr.co.goyang.manager.dao.ReviewManagerDAO" %>
   <%@ page import="kr.co.goyang.manager.vo.ReviewManagerVO" %>
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

<!-- <link rel="preconnect" href="https://fonts.googleapis.com"> 이거 없어서 에러 //원래 다 잘됐었는데 갑자기 이럴수가 있나요 ? 제가 body부분만 만지고 다른곳은 건들지않았거든요..
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="../../css/owl.carousel.min.css">
<link rel="stylesheet" href="../../css/owl.theme.default.min.css">
<link rel="stylesheet" href="../../css/jquery.fancybox.min.css">
<link rel="stylesheet" href="../../fonts/icomoon/style.css">
<link rel="stylesheet" href="../../fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../../css/daterangepicker.css">
<link rel="stylesheet" href="../../css/aos.css">
<link rel="stylesheet" href="../../css/style.css">
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<style type="text/css">
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
	.deleteBtn {
	width: 70px;
	height: 35px;
	background-color: #ffffff;
	border: 1px solid #ddd;
	color:black;
	text-align:center;
	vertical-align:middle;
	
}
.delBtn{
	padding-top:5px;
	color:black;
	width:100%;
	height:100%;
	display:block;
	vertical:middle;
}

.delBtn:hover {
	border: 1px solid grey;
	background-color: #ebebeb;
	color:black;
	text-decoration:none;
}

</style>
<script type="text/javascript">
$(function(){
	$("#deleteBtn").click(function(){
		$("#frm").submit();
	});
});
</script>
<title>관리자화면-후기관리</title>
</head>

<body>

	<%
	String upComContent = request.getParameter("comContent");
	if(upComContent == null){
		upComContent="";
	}
		int reviewNum=0;
		if(request.getParameter("reviewNum")!=null){
			reviewNum=Integer.parseInt(request.getParameter("reviewNum"));	
		}
		if(reviewNum == 0){
			PrintWriter pw=response.getWriter();
			pw.println("<script>");
			pw.println("alert('유효하지 않은 글입니다.')");
			pw.println("location.href='manager_review.jsp'");
			pw.println("</script>");

		}
		ReviewManagerVO rmVO = new ReviewManagerVO();

		ReviewManagerDAO rmDAO=ReviewManagerDAO.getInstance();
		ReviewManagerVO rv = rmDAO.getreviewDetail(reviewNum);
		List<ReviewManagerVO> commList = rmDAO.selectCommend(reviewNum);

		
		List<ReviewManagerVO> rmList = rmDAO.selectSearchReview(rmVO);
		List<Integer> reviewNumList = new ArrayList<Integer>();
		for(int i=0; i<rmList.size(); i++){
			rmVO = rmList.get(i);
			reviewNumList.add(rmVO.getReviewNum());
		}
		int reviewIdx = reviewNumList.indexOf(reviewNum);
	%>
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
					<li><a href="../tour_manager_process/manager_tour_manager.jsp">투어관리</a></li>
					<li><a href="../reservation_manager_process/manager_reservation.jsp">예약관리</a></li>
					<li><a href="../spot_manager_process/manager_spot_list.jsp">관광지 관리</a></li>
					<li><a href="manager_review.jsp">후기관리</a></li>
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
						<h1 class="mb-0">후기상세관리</h1>
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
	</div>
	<!-- 대제목 끝 -->
	
	<div class="container">
		
			<div style="font-size: 23px;padding: 10px 0px 10px 0px;display: flex;justify-content: space-between; border-bottom: 2px solid #bbbbbb;">
				<div style="font-weight: bold;"> 관광 후기</div>
			</div>
			
			<div style="display:flex; align-items:center;justify-content:space-between; font-size: 20px; height: 70px; width: 100%; padding: 24px 0; border-bottom: 1px solid #ebebeb; font-weight: bold;">
				<div><%= rv.getTitle()%></div>
				<div style="font-size: 14px; font-weight: lighter;"><%=rv.getId()%> | <%=rv.getRevWriteDate()%></div>
			</div>
			
			<div>
				<div style="width: 100%; padding: 24px 0; ">
					<%=rv.getRevContent() %>
				</div>
				<div><img src="../../images/gal_1.jpg"></div>
			</div>
			
			<div style="font-size: 15px; margin: 50px 0px 10px 10px;">댓글 <strong><%= commList.size() %></strong></div>
			
			<div style="padding: 30px; border-top: 1px solid #ebebeb; background-color: #fafafa">
				<%for(int i=0; i<commList.size(); i++){
						ReviewManagerVO commVO = commList.get(i);%>
					<div id="comm<%=commVO.getCommendNum()%>" style="margin-bottom: 10px;">
						<div style="display: flex; justify-content: space-between; font-size: 13px;">
							<div><%= commVO.getId().substring(0, commVO.getId().length()/2) %>**** <span><%= commVO.getComWriteDate() %></span></div>
							<%-- <%if(id.equals(commVO.getId())){%>
							<div class="hide popup">
							<%}else{ %> --%>
						</div>
						<div style="min-height: 50px; padding: 7px 0 20px 0;"><%= commVO.getComContent() %></div>
					</div>
				<%} %>
		
				
			</div>
			
			<div style="display: flex; justify-content: space-between; margin-bottom: 100px; margin: 20px 0px 20px; width: 100%; height: 32px;">
				<div>
					<%if(reviewIdx>0){ %>
					<input type="button" value="이전 글" style="margin-left: 10px; width: 70px;" class="mainBtn button222" onclick="location.href='manager_reviewDetail.jsp?reviewNum=<%= reviewNumList.get(reviewIdx-1) %>'">
					<%}if(reviewIdx<reviewNumList.size()-1){ %>
					<input type="button" value="다음 글" style="margin-left: 10px; width: 70px;" class="mainBtn button222" onclick="location.href='manager_reviewDetail.jsp?reviewNum=<%= reviewNumList.get(reviewIdx+1) %>'">
					<%} %>
				</div>
				
				<div style="display: flex;">
					<input type="button" value="목록" style="margin-left: 10px; width: 70px;" class="mainBtn" onclick="location.href='manager_review.jsp'">&nbsp;&nbsp;
					<div class="deleteBtn"><a href="manager_review_deleteAction.jsp?reviewNum=<%=reviewNum %>" class="delBtn">삭제</a></div>
				</div>
				
			</div>

		
	</div>
<div id="popup" class="hide popup">
<div class="content">
	<div>
		 <div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">게시글 등록 확인</div>
		
		<div style="background-color: #f0f6f9;">
			<div style="font-size: 16px; display: flex; justify-content: center; 
			align-items: center; height: 70px ;background-color: #f0f6f9;">삭제 하시겠습니까?</div>
			
			<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
				<input type="button" value="확인" class="popupBtn" onclick="closePopup()">
				<input type="button" value="취소" class="popupBtn" onclick="closePopup()">
			</div>
		</div>
	</div>
</div>
</div>


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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 

	<script src="../../js/popper.min.js"></script>
	<script src="../../js/owl.carousel.min.js"></script>
	<script src="../../js/jquery.animateNumber.min.js"></script>
	<script src="../../js/jquery.waypoints.min.js"></script>
	<script src="../../js/jquery.fancybox.min.js"></script>
	<script src="../../js/aos.js"></script>
	<script src="../../js/moment.min.js"></script>
	<script src="../../js/daterangepicker.js"></script>

	<script src="../../js/typed.js"></script>

	<script src="../../js/custom.js"></script>

	<script src="../../js/bootstrap.min.js"></script>
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
