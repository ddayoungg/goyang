<%@page import="java.util.List"%>
<%@page import="kr.co.goyang.user.vo.TourListVO"%>
<%@page import="kr.co.goyang.user.dao.TourListDAO"%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap4" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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

<title>고양 시티투어</title>

<%
	/* int tournum=request.getParameter("tournum"); */ //전 페이지에서 선택한 투어의번호를 가져옴
	
	

%>

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
				<a href="../main/index.jsp" class="logo m-0">고양<span
					class="text-primary">.</span></a>

				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-center">
					<li class="active"><a href="../main/index.jsp">home</a></li>
					<li><a
						href="../reservation_process/user_reservation_course.jsp">투어예약</a></li>
					<li><a href="user_introduceTour.jsp">관광지소개</a></li>
					<li><a href="../review_process/user_review.jsp">관광지후기</a></li>
					<li><a href="../mypage_process/user_mypage_inner.jsp">마이페이지</a></li>
				</ul>
				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li></li>
					<li style="font-size: 5px; font-weight: bold;"><a
						href="../login_process/user_signIn.jsp">로그인</a></li>
					<li style="font-size: 5px; font-weight: bold;"><a
						href="../login_process/user_signUp.jsp">회원가입</a></li>
				</ul>

				<a href="#"
					class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light"
					data-toggle="collapse" data-target="#main-navbar"> <span></span>
				</a>

			</div>
		</div>
	</nav>

	<div class="hero">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 mx-auto text-center">
					<div class="intro-wrap">
						<h1 class="mb-0">관광지 보기</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
    <%
    /* nsm 22-10-17 세션 추가 시작 */
	//아이디 세션 
  	String id ="";
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}//end if
    
    TourListDAO tourDAO = TourListDAO.getInstance();
	TourListVO tourVO = new TourListVO();
	List <TourListVO> list = tourDAO.selectAllTour(tourVO);	
    %>
	<%
	TourListVO toli = new TourListVO();
	tourVO = tourDAO.selectTourSpots(toli.getTourNum());
	System.out.println(toli.getTourNum());
	%> 

	<!-- 상단 투어 메뉴 -->
	<div class="untree_co-section">
		<ul class="list_sub_menu">
			<li class="_sub"><a href="user_introduceTour.jsp"> <span>시티
						투어 코스</span>
			</a></li>
			<li class="_sub">
				<%
				  for (int i=0; i<list.size(); ){ 
						TourListVO toVO = (TourListVO) list.get(i);	
						 
						int tourNum = toVO.getTourNum();
				%> 
			<a href="user_introduceDay.jsp?tourNum=<%=tourNum%>" > <span>화요나들이</span>
			</a>
			<%break; } %> 
			</li>
			<li class="_sub">
			<%
				  for (int i=1; i<list.size(); ){ 
						TourListVO toVO = (TourListVO) list.get(i);	
						 
						int tourNum = toVO.getTourNum();
				%> 
			<a href="user_introduceDay.jsp?tourNum=<%=tourNum%>" >  <span>수요나들이</span>
			</a>
			<%break; } %> 
			</li>
			<li class="_sub">
			<%
				  for (int i=2; i<list.size(); ){ 
						TourListVO toVO = (TourListVO) list.get(i);	
						 
						int tourNum = toVO.getTourNum();
				%> 
			<a href="user_introduceDay.jsp?tourNum=<%=tourNum%>" ><span
					class="menu_text">목요나들이</span>
			</a>
			<%break; } %> 
			</li>
			<li class="_sub">
			<%
				  for (int i=3; i<list.size(); ){ 
						TourListVO toVO = (TourListVO) list.get(i);	
						 
						int tourNum = toVO.getTourNum();
				%> 
			<a href="user_introduceDay.jsp?tourNum=<%=tourNum%>" > <span
					class="menu_text">금요나들이</span>
			</a>
			<%break; } %> 
			</li>
			<li class="_sub">
			<%
				  for (int i=4; i<list.size(); ){ 
						TourListVO toVO = (TourListVO) list.get(i);	
						 
						int tourNum = toVO.getTourNum();
				%> 
			<a href="user_introduceDay.jsp?tourNum=<%=tourNum%>" > <span>토요나들이</span>
			</a>
			<%break; } %> 
			</li>
			<li class="_sub">
				<%
				  for (int i=5; i<list.size(); ){ 
						TourListVO toVO = (TourListVO) list.get(i);	
						 
						int tourNum = toVO.getTourNum();
				%> 
			<a href="user_introduceDay.jsp?tourNum=<%=tourNum%>" > <span>일요나들이</span>
			</a>
			<%break; } %> 
			</li>
		</ul>
	</div>
	<!-- 상단 투어 메뉴 끝 -->

	<div class="container">
	<%

		  for (int i=0; i<list.size(); ){ 
				TourListVO toVO = (TourListVO) list.get(i);	
				
				 String thumImg = toVO.getThumImg();
				  String tourName =toVO.getTourName(); 
				  String explain = toVO.getExplain();
				  int adultFee = toVO.getAdultFee();
				  int otherFee = toVO.getOtherFee(); 
	%>
	<!-- 상단 4개 여행지 -->
<%-- 	<%
	TourListVO toli = new TourListVO();
	tourVO = tourDAO.selectTourSpots(toli.getTourNum());
	System.out.println(toli.getTourNum());
	%> --%>
		<div class="row">
			<div class="col-6 col-md-6 col-lg-3">
				<div class="media-1">
					<!-- <form> -->
					<div class="img-align">
						<a class="d-block mb-3" href="user_introduceDay.jsp?tourNum=<%=toVO.getTourNum() %>">
						<%-- <img src="/goyang/<%=request.getContextPath()+thumImg%>" alt="Image" class="img-fluid"> --%>
						<img src="http://211.63.89.140/images/<%=thumImg%>" alt="Image" class="img-fluid">
						</a>
					</div>
					<!-- </form> -->
					<div class="d-flex">
						<div>
						
							<h3 class="p-text-align">
								<a href="user_introduceDay.jsp?tourNum=<%=toVO.getTourNum() %>"><b><%=tourName%></b></a>
							</h3>
							<p class="p-text-align">10:00 ~ 16:00</p>
							<p class="p-text-align"><%=explain%></p>
							<p class="p-text-align-size">
								<b><%=adultFee%>원/<%=otherFee%>원</b>
							</p>
						</div>
						<%
						break;
  					}
						%>
					</div>
				</div>
			</div>
			<div class="col-6 col-md-6 col-lg-3">
				<div class="media-1">
				<%
				  for (int i=1; i<list.size(); ){ 
						TourListVO toVO = (TourListVO) list.get(i);	
						
						 String thumImg = toVO.getThumImg();
						  String tourName =toVO.getTourName(); 
						  String explain = toVO.getExplain();
						  int adultFee = toVO.getAdultFee();
						  int otherFee = toVO.getOtherFee(); 
				%>
					<div class="img-align">
						<a class="d-block mb-3"  href="user_introduceDay.jsp?tourNum=<%=toVO.getTourNum() %>"><img
							src="http://211.63.89.140/images/<%=thumImg%>" alt="Image" class="img-fluid"></a>
					</div>
					<div class="d-flex">
						<div>
							<h3 class="p-text-align">
								<a href="user_introduceDay.jsp?tourNum=<%=toVO.getTourNum() %>"><b><%=tourName%></b></a>
							</h3>
							<p class="p-text-align">10:00 ~ 16:00</p>
							<p class="p-text-align"><%=explain%></p>
							<p class="p-text-align-size">
								<b><%=adultFee%>원/<%=otherFee%>원</b>
							</p>
						</div>
					<%
						break;
  					}
						%>
					</div>
				</div>
			</div>
			<div class="col-6 col-md-6 col-lg-3">
				<div class="media-1">
			<%
				  for (int i=2; i<list.size();){ 
						TourListVO toVO = (TourListVO) list.get(i);	
						
						 String thumImg = toVO.getThumImg();
						  String tourName =toVO.getTourName(); 
						  String explain = toVO.getExplain();
						  int adultFee = toVO.getAdultFee();
						  int otherFee = toVO.getOtherFee(); 
				%>
					<div class="img-align">
						<a class="d-block mb-3" href="user_introduceDay.jsp?tourNum=<%=toVO.getTourNum() %>" >
						<img  src="http://211.63.89.140/images/<%=thumImg%>"  alt="Image" class="img-fluid">
							</a>
					</div>
					<div class="d-flex">
						<div>
							<h3 class="p-text-align">
								<a href="user_introduceDay.jsp?tourNum=<%=toVO.getTourNum() %>"><b><%=tourName%></b></a>
							</h3>
							<p class="p-text-align">10:00 ~ 16:00</p>
							<p class="p-text-align"><%=explain%></p>
							<p class="p-text-align-size">
								<b><%=adultFee%>원/<%=otherFee%>원</b>
							</p>
						</div>
				<%
						break;
  					}
						%>
					</div>
				</div>
			</div>
			<div class="col-6 col-md-6 col-lg-3">
				<div class="media-1">
			<%
				  for (int i=3; i<list.size(); ){ 
						TourListVO toVO = (TourListVO) list.get(i);	
						
						 String thumImg = toVO.getThumImg();
						  String tourName =toVO.getTourName(); 
						  String explain = toVO.getExplain();
						  int adultFee = toVO.getAdultFee();
						  int otherFee = toVO.getOtherFee(); 
				%>
					<div class="img-align">
						<a class="d-block mb-3" href="user_introduceDay.jsp?tourNum=<%=toVO.getTourNum() %>"  ><img
							src="http://211.63.89.140/images/<%=thumImg%>" alt="Image" class="img-fluid"></a>
					</div>
					<div class="d-flex">
						<div>
							<h3 class="p-text-align">
								<a href="user_introduceDay.jsp?tourNum=<%=toVO.getTourNum() %>" ><b><%=tourName%></b></a>
							</h3>
							<p class="p-text-align">10:00 ~ 16:00</p>
							<p class="p-text-align"><%=explain%></p>
							<p class="p-text-align-size">
								<b><%=adultFee%>원/<%=otherFee%>원</b>
							</p>
						</div>
					<%
						break;
  					}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 4개 여행지 끝 -->

	<!-- 중간 구분선 -->
	<!--   <div class="untree_co-section">
    <div class="container"> -->
	<div class="row mb-5 justify-content-center">
		<div class="col-lg-6 text-center">
			<h2 class="section-title text-center mb-3"></h2>
		</div>
	</div>
	<!-- 중간 구분선 끝 -->

	<!-- 하단 2개 여행지 -->
	<div class="container">
		<div class="row">
			<div class="col-6 col-md-6 col-lg-3"></div>
			<div class="col-6 col-md-6 col-lg-3">
				<div class="media-1">
			<%
				  for (int i=4; i<list.size(); ){ 
						TourListVO toVO = (TourListVO) list.get(i);	
						
						 String thumImg = toVO.getThumImg();
						  String tourName =toVO.getTourName(); 
						  String explain = toVO.getExplain();
						  int adultFee = toVO.getAdultFee();
						  int otherFee = toVO.getOtherFee(); 
				%>
					<div class="img-align">
						<a class="d-block mb-3" href="user_introduceDay.jsp?tourNum=<%=toVO.getTourNum() %>" ><img
							src="http://211.63.89.140/images/<%=thumImg%>" alt="Image" class="img-fluid"></a>
					</div>
					<div class="d-flex">
						<div>
							<h3 class="p-text-align">
								<a href="user_introduceDay.jsp?tourNum=<%=toVO.getTourNum() %>" ><b><%=tourName%></b></a>
							</h3>
							<p class="p-text-align">10:00 ~ 16:00</p>
							<p class="p-text-align"><%=explain%></p>
<!-- 							<p class="p-text-align">그리고 유네스코 세계문화유산</p> -->
							<p class="p-text-align-size">
								<b><%=adultFee%>원/<%=otherFee%>원</b>
							</p>
						</div>
					<%
						break;
  					}
						%>
					</div>
				</div>
			</div>
			<div class="col-6 col-md-6 col-lg-3">
				<div class="media-1">
					<div class="img-align">
			 <%
				  for (int i=5; i<list.size(); ){ 
						TourListVO toVO = (TourListVO) list.get(i);	
						
						 String thumImg = toVO.getThumImg();
						  String tourName =toVO.getTourName(); 
						  String explain = toVO.getExplain();
						  int adultFee = toVO.getAdultFee();
						  int otherFee = toVO.getOtherFee(); 
				%>
						<a class="d-block mb-3" href="user_introduceDay.jsp?tourNum=<%=toVO.getTourNum() %>"><img
							src="http://211.63.89.140/images/<%=thumImg%>" alt="Image" class="img-fluid"></a>
					</div>
					<div class="d-flex">
						<div>
							<h3 class="p-text-align">
								<a href="user_introduceDay.jsp?tourNum=<%=toVO.getTourNum() %>"><b><%=tourName%></b></a>
							</h3>
							<p class="p-text-align">10:00 ~ 16:00</p>
							<p class="p-text-align"><%=explain%></p>
					<!-- 		<p class="p-text-align">아빠~생태공원으로 놀러가요^^</p> -->
							<p class="p-text-align-size">
								<b><%=adultFee%>원/<%=otherFee%>원</b>
							</p>
						</div>
				<%
						break;
  					}
						%>
					</div>
				</div>
 		<%--  <%
				}
		%> --%>
			</div>
			<div class="col-6 col-md-6 col-lg-3"></div>
		</div>
	</div>
	<!-- 하단 2개 여행지 끝 -->

	<!-- 중간 구분선 -->
	<div class="row mb-5 justify-content-center">
		<div class="col-lg-6 text-center">
			<h2 class="section-title text-center mb-3"></h2>
		</div>
	</div>
	<!-- 중간 구분선 끝 -->

	<!-- 버스 사진 & 고양 시티투어 운영안내 -->
	<div class="untree_co-section">
		<div class="container">
			<div class="row align-items-stretch">
				<div class="order-lg-1">
					<!--         <div class="col-lg-4 order-lg-1"> -->
					<div class="h-100">
						<div class="frame h-100">
							<div class="feature-img-bg h-100"
								style="background-image: url('http://211.63.89.140/images/버스사진.jpg'); background-size: contain;"></div>
						</div>
					</div>
					<!--           <div class="h-100"><div class="frame h-100"><div class="feature-img-bg h-100" style="background-image: url('images/버스사진.jpg'); "></div></div></div> -->
				</div>

				<div
					class="col-6 col-sm-6 feature-1-wrap d-md-flex flex-md-column order-lg-1">
					<!--         <div class="col-6 col-sm-6 col-lg-4 feature-1-wrap d-md-flex flex-md-column order-lg-1" > -->

					<div class="feature-1 p-introduce">
						<!-- <div class="feature-1 d-md-flex p-introduce"> -->
						<div class="align-self-center" style="margin-bottom: 42px;">
							<span class="text-primary"></span>
							<!--               <span class="flaticon-house display-4 text-primary"></span> -->
							<h3 class="p-text-align-tour" style="margin-bottom: 12px;">
								<b>고양 시티투어 운영안내</b>
							</h3>
							<p style="margin-bottom: 8px;">
								<b>● 운행요일 : </b>화~일 (월요일 정기휴무)
							</p>
							<!-- <p class="mb-0"><b>● 운행요일 : </b>화~일 (월요일 정기휴무)</p> -->
							<p style="margin-bottom: 8px;">
								<b>● 시간 : </b>10:00 ~ 16:00
							</p>
							<p style="margin-bottom: 8px;">
								<b>● 탑승장소 : </b>경기도 고양시 일산동구 장항동<br> &nbsp;(정발산역 2번 출구)
							</p>
							<p style="margin-bottom: 8px;">
								<b>● 요금표</b>
							</p>
							<div style="display: flex; justify-content: center;">
								<table border="1" cellspacin="0">
									<thead bgcolor="#dcdcdc" align="center"
										style="font-weight: bold;">
										<tr>
											<td>성인</td>
											<td>기타</td>
											<td>무료</td>
										</tr>
									</thead>
									<tbody align="center">
										<%
										 for (int i=0; i<list.size(); ){ 
												TourListVO toVO = (TourListVO) list.get(i);	
										 int adultFee = toVO.getAdultFee();
										 int otherFee = toVO.getOtherFee();
										%>
										<tr>
											<td width="80px"><%=adultFee%>원</td>
											<td width="80px"><%=otherFee %>원</td>
											<td width="120px">경로,장애인,<br>유치원~초중고,<br>36개월
												미만
											</td>
										</tr>
										<% 
										break;
										  }
										%>
									</tbody>
								</table>
							</div>
							<div style="display: flex; justify-content: center;">
								<table>
									<tr style="color: #16A085;">
										<td colspan="3" style="font-weight: bold;">※ 입장료,체험비,중식비는
											별도</td>
									</tr>
								</table>
							</div>
						</div>
					</div>

					<!-- 원래 있던 코드 -->
					<!--       <div class="feature-1 ">
            <div class="align-self-center">
              <span class="flaticon-restaurant display-4 text-primary"></span>
              <h3>Restaurants & Cafe</h3>
              <p class="mb-0">Even the all-powerful Pointing has no control about the blind texts.</p>
            </div>
          </div> -->
					<!-- 원래 있던 코드 끝 -->

				</div>

				<!-- 원래 있던 코드 -->
				<!--         <div class="col-6 col-sm-6 col-lg-4 feature-1-wrap d-md-flex flex-md-column order-lg-3" >

          <div class="feature-1 d-md-flex">
            <div class="align-self-center">
              <span class="flaticon-mail display-4 text-primary"></span>
              <h3>Easy to Connect</h3>
              <p class="mb-0">Even the all-powerful Pointing has no control about the blind texts.</p>
            </div>
          </div>

          <div class="feature-1 d-md-flex">
            <div class="align-self-center">
              <span class="flaticon-phone-call display-4 text-primary"></span>
              <h3>24/7 Support</h3>
              <p class="mb-0">Even the all-powerful Pointing has no control about the blind texts.</p>
            </div>
          </div>

        </div> -->
				<!-- 원래 있던 코드 끝-->
			</div>
		</div>
	</div>
	<!-- 버스 사진 & 고양 시티투어 운영안내 끝 -->

	<div class="py-5 cta-section">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-12">
					<h2 class="mb-2 text-white">고양이 궁금한 당신, 지금 바로 예약하세요!</h2>
					<p class="mb-4 lead text-white text-white-opacity">고양시 시티투어는
						요일마다 특색있게 운영됩니다.</p>
					<p class="mb-0">
						<a href="../reservation_process/user_reservation_course.jsp"
							class="btn btn-outline-white text-white btn-md font-weight-bold">예약하기</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="site-footer">
		<div class="inner first">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<div class="widget">
							<p
								style="font-size: 20px; font-weight: bold; color: red; font-style: inherit;">매주
								월요일은 정기 휴무입니다.</p>
							<p style="font-size: 60px; font-weight: bold;">Goyan Tour</p>
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

		<!-- <div class="site-footer">
    <div class="inner first">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-lg-4">
            <div class="widget">
              <h3 class="heading">About Tour</h3>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
            </div>
            <div class="widget">
              <ul class="list-unstyled social">
                <li><a href="#"><span class="icon-twitter"></span></a></li>
                <li><a href="#"><span class="icon-instagram"></span></a></li>
                <li><a href="#"><span class="icon-facebook"></span></a></li>
                <li><a href="#"><span class="icon-linkedin"></span></a></li>
                <li><a href="#"><span class="icon-dribbble"></span></a></li>
                <li><a href="#"><span class="icon-pinterest"></span></a></li>
                <li><a href="#"><span class="icon-apple"></span></a></li>
                <li><a href="#"><span class="icon-google"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-6 col-lg-2 pl-lg-5">
            <div class="widget">
              <h3 class="heading">Pages</h3>
              <ul class="links list-unstyled">
                <li><a href="#">Blog</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-6 col-lg-2">
            <div class="widget">
              <h3 class="heading">Resources</h3>
              <ul class="links list-unstyled">
                <li><a href="#">Blog</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-6 col-lg-4">
            <div class="widget">
              <h3 class="heading">Contact</h3>
              <ul class="list-unstyled quick-info links">
                <li class="email"><a href="#">mail@example.com</a></li>
                <li class="phone"><a href="#">+1 222 212 3819</a></li>
                <li class="address"><a href="#">43 Raymouth Rd. Baltemoer, London 3910</a></li>
              </ul>
            </div>
          </div>y
        </div>
      </div>
    </div> -->



		<div class="inner dark">
			<div class="container">
				<div class="row text-center">
					<div class="col-md-8 mb-3 mb-md-0 mx-auto">
						<p>
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
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

</body>

</html>