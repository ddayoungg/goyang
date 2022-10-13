<%@page import="kr.co.goyang.user.vo.MyInfoVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.goyang.user.dao.MyInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- google jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">
	
</style>

<script type="text/javascript">               
/* function changePage(value){                     
	if(value == "0"){ 								// HOME 버튼 클릭시 첫화면으로 이동                          
		location.href="../main/index.jsp";            
	}else if(value == "1"){						// 로그아웃 버튼 클릭시 로그아웃 처리            
		location.href="member/pro/LogoutPro.jsp";            
	}else if(value == "2"){   					// 마이페이지 버튼 클릭시 회원정보 보여주는 화면으로 이동                          
		location.href="user_mypage_inner.jsp";            
	}       
}    */ 
</script>

	<title>고양 시티투어</title>
</head>

<body>
<%
String id="tester";//로그인한 아이디
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if
if(id==null){//로그인되지 않았다면
	response.sendRedirect("http://localhost/goyang/User/login_process/user_signIn.jsp");
	return;
}//end if
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
            <h1 class="mb-0">내 댓글</h1>
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
			style="font-size: 20px; font-weight: bold; padding-top: 20px; margin-bottom: 0;">내 댓글</div>
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
				<!-- <div style="font-weight: bold;"> 내 댓글 </div> -->
			</div>		
			<!-- <hr style="margin-bottom:50px;">	 -->		
			<div style="margin-top:50px; margin-bottom:50px;">
				<table class="member" style="width:100%">
					<tr>
						<th>게시글 번호</th>
						<th style="min-width:300px;">게시글 제목</th>
						<th style="min-width:300px;">작성한 댓글</th>
						<th>작성일</th>
						<th>          </th>
					</tr>
					<%
					//페이징 시작
					int cPage=1;//현재 페이지
					int totalRows=0;//전체 행 수
					int totalPages=0;//전체 페이지 수
					int lenPS=5;//한 페이지 보여줄 행 수
					int startPS=0;//페이지의 시작 지점
					
					MyInfoDAO miDAO=MyInfoDAO.getInstance();
					MyInfoVO miVO=new MyInfoVO();
					
					try {
						 cPage=Integer.parseInt(request.getParameter("page"));
					}catch(NumberFormatException nfe) {//파라미터가 null이 나올 경우
						cPage=1;
					}//end catch
					
					//전체 데이터 개수
					totalRows=miDAO.selectMyCommTotal(id);
					//총 페이지 수
					totalPages = totalRows % lenPS == 0 ? totalRows/lenPS : (totalRows/lenPS) + 1;
					if(totalPages==0) {
						totalPages = 1;
					}//end if
					
					if(cPage > totalPages) {
						cPage = 1;
					}//end if
					
					startPS = (cPage - 1) * lenPS;//각 페이지의 시작 지점
					
					//VO set
					miVO.setId(id);
					miVO.setStartPS(startPS);
					miVO.setLenPS(lenPS);
					
					List<MyInfoVO> commList=miDAO.selectMyCommList(miVO);
					
					pageContext.setAttribute("commList", commList);
					%>
					<% if(commList.size() != 0) { %>
					<c:forEach var="myComm" items="${ commList }">
					<tr>
						<td>${ myComm.commendNum }</td>
						<td><a href="#void"></a>${ myComm.revContent }</td>
						<td><a href="#void"></a>${ myComm.comContent }</td>
						<td>${ myComm.comWriteDate }</td>
						<td><input type="button" value="수정" class="mainBtn" onclick="location.href='#void${ myComm.commendNum }'"style="width:80px; height:32px;"></td>
					</tr>
					</c:forEach>
					<% }else { %>
					<tr>
						<td colspan="4">데이터가 존재하지 않습니다.</td>
					</tr>
					<% }//end else %>
				</table>
			</div>
			
			<div style="margin: 20px 0px 20px; display: flex; justify-content: center; width: 100%; height: 32px;"><!-- 페이지 블럭 -->
			<%
				//페이지 블럭
				int pageLength=5;//페이지 블록 길이 1~5페이지
				int currentBlock=cPage % pageLength == 0 ? cPage / pageLength : (cPage / pageLength) +1;//현재 페이지가 어디 블럭에 속해있는지 알려줌.
				int startPage = (currentBlock - 1) * pageLength + 1;
				int endPage = startPage + pageLength - 1;
				//마지막 페이지 묶음에서 총 페이지 수를 넘어가면 끝 페이즈를 마지막 페이지 숫자로 지정
				if(endPage > totalPages) {
					endPage = totalPages;
				}//end if
			%>
			 <nav>
			  <ul class="pagination justify-content-center">
			   <% if(startPage != 1 ) {%>
			   <li class="page-item"><a class="page-link"
			   		href="user_my_comment.jsp?page=<%= startPage - 1 %>" tabindex="-1"
			   		aria-disabled="true">&lt;<!-- < --></a></li>
			   <% }//end if %>
			   <% for(int i=startPage;i<=endPage;i++) { %>
			   	<li class="page-item">
			   	<a class="page-link" href="user_my_comment.jsp?page=<%= i %>"><%= i %></a></li>
			   <% }//end for %>
			   <%
			   	//마지막 페이지 숫자와 startPage에서 pageLength 더해준 값이 일치할 때
			   	//즉, 마지막 페이지 블록일 때
			   	if(totalPages != endPage) {
			   %>
			   	<li class="page-item">
			   		<a class="page-link" href="user_my_comment.jsp?page=<%=endPage + 1 %>">&gt;<!-- > --></a>
			   	</li>
			   <% }//end if %>
			  </ul> 
			 </nav>
			</div>
			
			<%-- <div style="margin: 20px 0px 20px; display: flex; justify-content: center; width: 100%; height: 32px;">
				<input class="pagination" type="button" value="<">
				<input class="pagination pageNow" type="button" value="1">
				<input class="pagination" type="button" value=">">
			</div> --%>
			
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
	<script>
		$(function() {
			var slides = $('.slides'),
			images = slides.find('img');

			images.each(function(i) {
				$(this).attr('data-id', i + 1);
			})

			var typed = new Typed('.typed-words', {
				strings: ["화요나들이"," 수요나들이"," 목요나들이", " 금요나들이", " 토요나들이"," 일요나들이"],
				typeSpeed: 80,
				backSpeed: 80,
				backDelay: 4000,
				startDelay: 1000,
				loop: true,
				showCursor: true,
				preStringTyped: (arrayPos, self) => {
					arrayPos++;
					console.log(arrayPos);
					$('.slides img').removeClass('active');
					$('.slides img[data-id="'+arrayPos+'"]').addClass('active');
				}

			});
		})
	</script>

	<script src="js/custom.js"></script>

</body>

</html>
