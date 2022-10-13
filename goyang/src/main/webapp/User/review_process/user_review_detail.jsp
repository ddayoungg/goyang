<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="oracle.jdbc.proxy.oracle$1jdbc$1replay$1driver$1NonTxnReplayableOthers$2java$1sql$1SQLOutput$$$Proxy"%>
<%@page import="kr.co.goyang.user.vo.TourReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.goyang.user.dao.TourReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
<link rel="shortcut icon" href="../../favicon.png">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap4" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
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

<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
	$(function () {
		<%
		int reviewNum = Integer.valueOf(request.getParameter("reviewNum"));
		String upComContent = request.getParameter("comContent");
		String upCommendNum = request.getParameter("commendNum");
		String upComWriteDate = request.getParameter("comWriteDate");
		
		if(upComContent == null){
			upComContent="";
		}
		
		TourReviewDAO trDAO = TourReviewDAO.getInstance();
		TourReviewVO reviewVO = trDAO.selectReview(reviewNum);
		List<TourReviewVO> commList = trDAO.selectCommend(reviewNum);
		
		String id="";
		
		TourReviewVO trVO = new TourReviewVO();
		List<TourReviewVO> trList = trDAO.selectSearchReview(trVO);
		List<Integer> reviewNumList = new ArrayList<Integer>();
		for(int i=0; i<trList.size(); i++){
			trVO = trList.get(i);
			reviewNumList.add(trVO.getReviewNum());
		}
		int reviewIdx = reviewNumList.indexOf(reviewNum);
		%>
		
		//세션에 존재하는 값을 얻는다.
		//String id=(String)session.getAttribute("id");
		<%-- String id="";
		if( id == null ){//세션에 값이 없음.(1.interval이 초과, 2.직접 요청(비정상적 요청).)
			//redirect 페이지 이동.
			response.sendRedirect("로그인페이지.jsp");
			return;
		}//end if
		if(id.equals(reviewVO.getId())){%>
		document.querySelector("#corBtn").classList.remove('hide');
		document.querySelector("#corBtn").classList.remove('popup');
		document.querySelector("#corBtn").classList.remove('hide');
		document.querySelector("#delBtn").classList.remove('popup'); 
		<%}%>--%>
		
		
		$("#commBtn").click(function () {
			$("#detailFrm").submit();
		})
		
	})
	
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

<title>고양 시티투어</title>
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
					<li><a href="../reservation_process/user_reservation_course.jsp">투어예약</a></li>
					<li><a href="../spot_process/user_introduceTour.jsp">관광지소개</a></li>
					<li><a href="user_review.jsp">관광지후기</a></li>
					<li><a href="../mypage_process/user_mypage_inner.jsp">마이페이지</a></li>
				</ul>

				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li></li>
					<li style="font-size: 5px; font-weight: bold;"><a href="../main/index.jsp">로그아웃</a></li>
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
						<h1 class="mb-0">후기 상세보기</h1>
						<!-- <p class="text-white">로그인을 해주세요.</p> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--  여기사이에 구상하시면 됩니다!!! -->
	
	
	<!-- 상단 투어 메뉴 -->
	<div class="untree_co-section">
		<ul class="list_sub_menu">
			<li class="_sub"><a href="#"> <span></span>
			</a></li>
			</ul>
			</div>
			<!-- 상단 투어 메뉴 끝 -->
	
	<!-- 대제목 -->
	<div class="container">
		<img src="../../images/bullet_Tues_sub_style_blue.png" alt="image">
	</div>
	<!-- 대제목 끝 -->
	
	<div class="container">
		<form name="detailFrm" id="detailFrm" action="user_commend_insert_process.jsp">
			<div style="font-size: 23px;padding: 10px 0px 10px 0px;display: flex;justify-content: space-between; border-bottom: 2px solid #bbbbbb;">
				<div> 관광 후기</div>
			</div>
			
			<div style="display:flex; align-items:center; justify-content:space-between; font-size: 20px; height: 70px; width: 100%; padding: 24px 0; border-bottom: 1px solid #ebebeb;">
				<input type="hidden" name="reviewNum" value="<%=reviewVO.getReviewNum()%>">
				<input type="hidden" name="id" value="<%= reviewVO.getId()%>">
				<div><%= reviewVO.getTitle() %></div>
				<div style="font-size: 14px; font-weight: lighter;"><span><%= reviewVO.getId().substring(0,reviewVO.getId().length()/2) %>****</span> | <span><%= reviewVO.getRevWriteDate() %></span></div>
			</div>
			
			<div>
				<div style="width: 100%; padding: 24px 0; ">
					<%= reviewVO.getRevContent() %>
				</div>
				<div><img src="../upload/<%= reviewVO.getReviewImg() %>"></div>
			</div>
			
			<div style="font-size: 15px; margin: 50px 0px 10px 10px;">댓글 <strong><%= commList.size() %></strong></div>
			
			<%-- 수정 --%>
			<div style="padding: 30px; border-top: 1px solid #ebebeb; background-color: #fafafa">
				<%for(int i=0; i<commList.size(); i++){
						TourReviewVO commVO = commList.get(i);%>
					<div id="comm<%=commVO.getCommendNum()%>" style="margin-bottom: 10px;">
						<div style="display: flex; justify-content: space-between; font-size: 13px;">
							<div><%= commVO.getId().substring(0, commVO.getId().length()/2) %>**** <span><%= commVO.getComWriteDate() %></span></div>
							<%-- <%if(id.equals(commVO.getId())){%>
							<div class="hide popup">
							<%}else{ %> --%>
							<div>
							<%-- <%} %> --%>
								<a href="user_commend_update_process.jsp?reviewNum=<%=reviewNum%>&commendNum=<%=commVO.getCommendNum()%>&comDelFlag=0&comContent=<%=commVO.getComContent()%>&comWriteDate=<%=commVO.getComWriteDate()%>">수정</a> | <a href="user_commend_delete_process.jsp?reviewNum=<%=reviewNum%>&commendNum=<%=commVO.getCommendNum()%>&comDelFlag=0&comContent=<%=commVO.getComContent()%>">삭제</a>
							</div>
						</div>
						<div style="min-height: 50px; padding: 7px 0 20px 0;"><%= commVO.getComContent() %></div>
					</div>
				<%} %>
		
				<div style="display: flex; height: 100px; min-width: 885px;">
					<input type="hidden" name="upCommendNum" value="<%=upCommendNum%>">
					<input type="hidden" name="upComWriteDate" value="<%=upComWriteDate%>">
					<textarea name="comContent" id="comContent" placeholder="내용을 입력해주세요." style="width: 100%; border: 1px solid #ebebeb;"><%=upComContent%></textarea>
					<input id="commBtn" type="button" value="댓글 입력" style="border: 1px solid #ebebeb;">
				</div>
			</div>
			
			<div style="display: flex; justify-content: space-between; margin-bottom: 100px; margin: 20px 0px 20px; width: 100%; height: 32px;">
				<div>
					<%if(reviewIdx>0){ %>
					<input type="button" value="이전 글" style="margin-left: 10px; width: 70px;" class="mainBtn button222" onclick="location.href='user_review_detail.jsp?reviewNum=<%= reviewNumList.get(reviewIdx-1) %>'">
					<%}if(reviewIdx<reviewNumList.size()-1){ %>
					<input type="button" value="다음 글" style="margin-left: 10px; width: 70px;" class="mainBtn button222" onclick="location.href='user_review_detail.jsp?reviewNum=<%= reviewNumList.get(reviewIdx+1) %>'">
					<%} %>
				</div>
				<div style="display: flex;">
					<input type="button" value="목록" class="mainBtn button222" style="width: 70px;" onclick="location.href='user_review.jsp'">
					<input id="corBtn" type="button" value="수정" style="margin-left: 10px; width: 70px;" class="mainBtn button222 hide popup" onclick="location.href='user_review_write.jsp?reviewNum=<%= reviewNum %>'">
					<input id="delBtn" type="button" value="삭제" style="margin-left: 10px; width: 70px;" class="mainBtn button222 hide popup" onclick="showPopup(true,'popup')">
				</div>
			</div>
		</form>
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
	
	<!-- 팝업창 : user_review_post -->
	<div id="popup" class="hide popup">
		<div class="content">
			<div style="width: 412px;">
				<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
				display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">게시글 삭제 확인</div>
				
				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
					align-items: center; height: 70px ;background-color: #f0f6f9;">게시글을 삭제 하시겠습니까?</div>
					
					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="확인" class="mainBtn" onclick="showPopup(true,'popup2')">
						<input type="button" value="취소" class="mainBtn" onclick="closePopup('popup')">
					</div>
				</div>
			</div>
	  </div>
	</div>
	
	<!-- 팝업창 : user_review_post -->
	<div id="popup2" class="hide popup">
		<div class="content">
			<div style="width: 412px;">
				<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
				display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">게시글 삭제 확인</div>
				
				<div style="background-color: #f0f6f9;">
					<div style="font-size: 16px; display: flex; justify-content: center; 
					align-items: center; height: 70px ;background-color: #f0f6f9;">게시글이 삭제 되었습니다.</div>
					
					<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
						<input type="button" value="확인" class="mainBtn" onclick="location.href='user_review_delete_process.jsp?reviewNum=<%=reviewNum%>'">
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
</body>

</html>
