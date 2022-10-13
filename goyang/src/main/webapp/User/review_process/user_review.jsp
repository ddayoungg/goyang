<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.co.goyang.user.vo.TourReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.goyang.user.dao.TourReviewDAO"%>
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
<link rel="shortcut icon" href="../../favicon.png">

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
<style type="text/css">

</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	<%
	/* String name=(String)session.getAttribute("name"); */
	String id="tester";
	int reviewNum = 0;
	TourReviewDAO trDAO = TourReviewDAO.getInstance();
	
	// 검색 : 투어 코스 선택
	String selectTour = request.getParameter("selTour"); // 1, 화
	
	List<String> tourNames = trDAO.selectTourName(); // 화, 수, 목, 금
	
	TourReviewVO search = new TourReviewVO();
	if(selectTour!=null){
		search.setTourNum(Integer.valueOf(selectTour)+1);
	}
	
	// 검색 : 검색어 입력
	String textSearch = request.getParameter("textSearch");
	search.setTextSearch(textSearch);
	
	List<TourReviewVO> reviewList = trDAO.selectSearchReview(search);
	
	TourReviewVO trVO1 = new TourReviewVO();
	List<Integer> reviewNumList = new ArrayList<Integer>();
	for(int i=0; i<reviewList.size(); i++){
		trVO1 = reviewList.get(i);
		reviewNumList.add(trVO1.getReviewNum());
	}
	%>
	$("#<%= selectTour%>").prop("selected", true);
	
	$("#search").click(function () {
		$("#frm").submit();
	});
	
	pagenation();
	
	function pagenation() {
		var pagenationHTML = ``;
		<% 
		// total_page
		int totalPage = (int)Math.ceil((double)reviewList.size()/10);
		System.out.println("totalPage : "+totalPage);
		
		// page
		String nowPage = request.getParameter("nowPage");
		System.out.println("nowPage : "+nowPage);
		if(nowPage==null){
			nowPage = "1";
			System.out.println("nowPage : "+nowPage);
		}
		
		// page_group
		int pageGroup=(int)Math.ceil(Double.valueOf(nowPage)/10);
		System.out.println("pageGroup : "+pageGroup);
		
		// last
		int lastIdx = Integer.valueOf(nowPage)*10;
		System.out.println("lastIdx : "+lastIdx);
		
		// first
		int firstIdx = lastIdx-9;
		System.out.println("firstIdx : "+firstIdx);%>
		
		// first~last 페이지 프린트
		pagenationHTML += 
			`<li class="page-item">
				<a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
		    </li>`;
		<%for(int i=1; i<=totalPage; i++){%>
			pagenationHTML += 
			`<li class="page-item"><a class="page-link" href="user_review.jsp?nowPage=<%=i%>"><%=i%></a></li>`;
		<%}%>
		pagenationHTML += 
			`<li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>`;
		document.querySelector(".pagination").innerHTML = pagenationHTML;
	}
	
});//ready

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
						<h1 class="mb-0">관광 후기</h1>
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
			<li class="_sub"><a href="#"> <span></span></a></li>
		</ul>
	</div>
			<!-- 상단 투어 메뉴 끝 -->
	
	<!-- 대제목 -->
	<div class="container">
		<img src="../../images/bullet_Tues_sub_style_blue.png" alt="image">
	</div>
	<!-- 대제목 끝 -->
	
	
	
	<div class="container">
		<div style="font-size: 23px;margin: 10px 0px 10px 0px;display: flex;justify-content: space-between;">
			<div> 관광 후기</div>
			<div style="font-size: 13px;display: flex;align-items: end;">목록보기</div>
		</div>

		<div>
			<table class="member" style="width: 100%">
				<tr>
					<th>번호</th>
					<th>코스</th>
					<th style="min-width: 500px;">글제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
				</tr>
				<%for(int i=0;i<reviewList.size(); i++){
					TourReviewVO trVO = reviewList.get(i);
					if(reviewNumList.indexOf(trVO.getReviewNum())>=firstIdx-1 && reviewNumList.indexOf(trVO.getReviewNum())<=lastIdx-1){%>
				<tr>
					<td><%= trVO.getReviewNum() %></td>
					<td><%= tourNames.get(trVO.getTourNum()-1) %></td>
					<td><a href="user_review_detail.jsp?reviewNum=<%= trVO.getReviewNum() %>"><%= trVO.getTitle() %></a></td>
					<td><%= trVO.getId().substring(0,trVO.getId().length()/2) %>****</td>
					<td><%= trVO.getRevWriteDate() %></td>
				</tr>
				<%}} %>
			</table>
		</div>
			
		<div style="margin: 20px 0px 20px; display: flex; justify-content: center; width: 100%; height: 32px;">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
				</ul>
			</nav>
			
			<%-- <input class="pagination" type="button" value="<">
			<input class="pagination pageNow" type="button" value="1">
			<input class="pagination" type="button" value=">"> --%>
		</div>
		
		<span style="position: relative; float: right; margin-top: -52px;">
			<input type="button" class="mainBtn button222" value="글쓰기" style="width: 80px; height: 32px;" onclick="location.href='user_review_write.jsp?id=<%=id%>'">
		</span>
		<form id="frm" action="user_review.jsp" method="get">
			<div style="display: flex; justify-content: center; margin-bottom: 50px; height: 32px;">
				<select name="selTour" style="border: 1px solid #bbb;">
					<option value=-1>코스 선택</option>
					<% for(int i=0; i<tourNames.size(); i++){ %>
					<option id="<%= i %>" value="<%= i %>"><%= tourNames.get(i) %></option>
					<% } %>
				</select>
				<input id="textSearch" name="textSearch" type="text" placeholder="제목을 입력하세요." style="border: 1px solid #bbb; margin: 0px 10px 0px 10px; min-width: 300px;">
				<input id="search" type="button" value="검색" class="mainBtn button222" style="width: 80px;">
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
