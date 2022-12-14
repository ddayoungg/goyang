<%@page import="java.util.List"%>
<%@page import="kr.co.goyang.user.dao.TourReviewDAO"%>
<%@page import="kr.co.goyang.user.vo.TourReviewVO"%>
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
#container{width:1000px;margin: 0px auto;}
.imgSize{width: 300px; height: 200px; border:1px solid #333;}
th{
	padding: 12px 0;
	vertical-align: baseline;
}
td{
	padding: 8px 0;
	padding-left: 10px;
}
</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

	$(function () {
		
		
		$("#thumImgFile").change(function () {
			setFile();
		});
		
		<%
		/* nsm 22-10-17 ?????? ?????? ?????? */
		//????????? ?????? 
	  	String id ="";
		if(session.getAttribute("id")!=null){
			id=(String)session.getAttribute("id");
		}//end if
	  	
		TourReviewDAO trDAO = TourReviewDAO.getInstance();
		TourReviewVO reviewVO = new TourReviewVO();
		String selectedTourName = "?????? ??????";
		String process = "??????";
		
		String reviewNumber = request.getParameter("reviewNum");
		if(reviewNumber != null){
			int reviewNum = Integer.valueOf(reviewNumber);
			reviewVO = trDAO.selectReview(reviewNum);
			process = "??????";
		}else{
			reviewVO.setRevContent("");
			reviewVO.setTitle("");
		}
		
		List<String> tourNames = trDAO.selectTourName();
		%>
		
		accessChk();//?????? ?????? ??????
		
		$("#reviewRegi").click(function () {
			$("#reviewFrm").submit();
		})
		
	})
	
function accessChk(){
	var id="<%= id %>";
		
	if(id==""){
		alert("????????? ????????????.");
		location.href="http://211.63.89.140/User/login_process/user_signIn.jsp";
		return;
	}//end if
	
}//accessChk
	
	function setFile(){
	var fReader = new FileReader();
	fReader.readAsDataURL($("#thumImgFile")[0].files[0]);
	fReader.onloadend = function(event) {
		console.log(event.target.result);
	$("#thumImgOutput").attr("src", event.target.result);
		
	/* ????????? hidden ??????*/
	var fileValue = $("#thumImgFile").val().split("\\");
	var fileName = fileValue[fileValue.length-1]; // ?????????
		$("#hiddThumImg").val(fileName);
	}//end onloadend
}//setFile
	
</script>
<title>?????? ????????????</title>
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
				<a href="../main/index.jsp" class="logo m-0">??????<span
					class="text-primary">.</span></a>

				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-center">
					<li class="active"><a href="../main/index.jsp">home</a></li>
					<li><a href="../reservation_process/user_reservation_course.jsp">????????????</a></li>
					<li><a href="../spot_process/user_introduceTour.jsp">???????????????</a></li>
					<li><a href="user_review.jsp">???????????????</a></li>
					<li><a href="../mypage_process/user_mypage_inner.jsp">???????????????</a></li>
				</ul>

				<ul
					class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li></li>
					<li style="font-size: 5px; font-weight: bold;"><a href="../main/index.jsp">????????????</a></li>
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
						<h1 class="mb-0">?????? ????????????</h1>
						<!-- <p class="text-white">???????????? ????????????.</p> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--  ??????????????? ??????????????? ?????????!!! -->
	
	<!-- ?????? ?????? ?????? -->
	<div class="untree_co-section">
		<ul class="list_sub_menu">
			<li class="_sub"><a href="#"> <span></span>
			</a></li>
			</ul>
			</div>
			<!-- ?????? ?????? ?????? ??? -->
	
	<!-- ????????? -->
	<div class="container">
		<img src="http://211.63.89.140/images/bullet_Tues_sub_style_blue.png" alt="image">
	</div>
	<!-- ????????? ??? -->
	
	
	<div class="container">
		<form id="reviewFrm" name="reviewFrm" action="user_review_insert_process.jsp" enctype="multipart/form-data" method="post">
			<input type="hidden" name="id" value="<%=id%>">
			<input type="hidden" name="reviewNum" value="<%= reviewNumber%>">
			
			<div style="font-size: 23px;padding: 10px 0px 10px 0px;display: flex;justify-content: space-between; border-bottom: 2px solid #bbbbbb;">
				<div style="font-weight: bold;"> ?????? ??????</div>
			</div>
			
			<div>
				<table style="border-spacing: 0px; width: 100%;">
					<colgroup>
						<col style="width: 58px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>?????????</th>
							<td><%=id.substring(0, id.length()/2) %>****</td>
						</tr>
						<tr>
							<th>??????</th>
							<td>
								<select name="selTour" style="width: 100%; height: 32px; border: 1px solid #ddd;">
								<%if(reviewVO.getTourNum()!=0){ %>
									<option value="<%= reviewVO.getTourNum()-1%>"><%= tourNames.get(reviewVO.getTourNum()-1) %></option>
								<%}else{ %>
									<option value="-1">?????? ??????</option>
									<%for(int i=0; i<tourNames.size(); i++){selectedTourName = tourNames.get(i); %>
									<option value="<%=i%>"><%=tourNames.get(i) %></option>
								<%}} %>
								</select>
							</td>
						</tr>
						<tr>
							<th>??????</th>
							<td>
								<input name="title" type="text" value="<%= reviewVO.getTitle() %>" placeholder="????????? ??????????????????." style="border: 1px solid #ddd; width: 100%; height: 32px;">
							</td>
						</tr>
						<tr>
							<th>??????</th>
							<td style="padding-bottom: 0px;">
								<textarea name="revContent" placeholder="????????? ??????????????????." style="width: 100%; height: 280px; border: 1px solid #ddd;"><%= reviewVO.getRevContent() %></textarea>
							</td>
						</tr>
						<tr>
							<th>??????</th>
							<td style="padding-top:0px;">
   							  <input type='file' id="thumImgFile" name="thumImgFile" accept="image/*" value="<%=reviewVO.getReviewImg() %>">
   							  <input type="hidden" id="hiddThumImg" name="thumImg" value="<%=reviewVO.getReviewImg() %>">
   							  <div class="imgSize"><img class="imgSize" id="thumImgOutput"  src="http://211.63.89.140/images/<%=reviewVO.getReviewImg() %>"/></div>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div style="justify-content: end;display: flex;align-items: center; margin-bottom: 100px; margin-top: 10px;">
					<input type="button" value="<%= process %>" class="mainBtn" onclick="showPopup(true,'popup')">
					<input type="button" value="??????" style="margin-left: 15px;" class="mainBtn" onclick="showPopup(true,'popup3')">
				</div>
			</div>
			
			<!-- ????????? : user_review_post -->
			<div id="popup" class="hide popup">
				<div class="content">
					<div style="width: 412px;">
						<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
						display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">????????? <%= process %> ??????</div>
						
						<div style="background-color: #f0f6f9;">
							<div style="font-size: 16px; display: flex; justify-content: center; 
							align-items: center; height: 70px ;background-color: #f0f6f9;">???????????? <%= process %> ???????????????????</div>
							
							<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
								<input type="button" value="<%= process %>" class="mainBtn" onclick="showPopup(true,'popup2')">
								<input type="button" value="??????" class="mainBtn" onclick="closePopup('popup')">
							</div>
						</div>
					</div>
			  </div>
			</div>
			
			<!-- ????????? : user_review_post -->
			<div id="popup2" class="hide popup">
				<div class="content">
					<div style="width: 412px;">
						<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
						display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">????????? <%= process %> ??????</div>
						
						<div style="background-color: #f0f6f9;">
							<div style="font-size: 16px; display: flex; justify-content: center; 
							align-items: center; height: 70px ;background-color: #f0f6f9;">???????????? <%= process %> ???????????????.</div>
							
							<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
								<input type="button" value="??????" class="mainBtn" id="reviewRegi">
							</div>
						</div>
					</div>
			  </div>
			</div>
			
			<!-- ????????? : user_review_post -->
			<div id="popup3" class="hide popup">
				<div class="content">
					<div style="width: 412px;">
						<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
						display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">????????? ?????? ?????? ??????</div>
						
						<div style="background-color: #f0f6f9;">
							<div style="font-size: 16px; display: flex; justify-content: center; 
							align-items: center; height: 70px ;background-color: #f0f6f9;">????????? ????????? ?????????????????????????</div>
							
							<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
								<input type="button" value="??????" class="mainBtn" onclick="showPopup(true,'popup4')">
								<input type="button" value="??????" class="mainBtn" onclick="closePopup('popup3')">
							</div>
						</div>
					</div>
			  </div>
			</div>
			
			<!-- ????????? : user_review_post -->
			<div id="popup4" class="hide popup">
				<div class="content">
					<div style="width: 412px;">
						<div style="font-size: 10px; width: 400px; height: 30px; padding-left: 10px;
						display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">????????? ?????? ?????? ??????</div>
						
						<div style="background-color: #f0f6f9;">
							<div style="font-size: 16px; display: flex; justify-content: center; 
							align-items: center; height: 70px ;background-color: #f0f6f9;">????????? ????????? ?????????????????????.</div>
							
							<div style="display: flex; align-items: center; justify-content: center; padding-bottom: 10px;">
								<input type="button" value="??????" class="mainBtn" onclick="location.href='user_review.jsp'">
							</div>
						</div>
					</div>
			  </div>
			</div>
		</form>
	</div>


	<div class="site-footer">
		<div class="inner first">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-4" >
						<div class="widget" style="width:500px">
							<p style="font-size: 20px;font-weight: bold; color: red;font-style:inherit;" >?????? ???????????? ?????? ???????????????.</p>
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

	<!-- ?????? -->
	<script type="text/javascript">
		function showPopup(hasFilter,id) {
			const popup = document.querySelector("#"+id);
			
			if(id=='popup2'){
				document.querySelector('#popup').classList.add('hide');
			}else if(id=='popup4'){
				document.querySelector('#popup3').classList.add('hide');
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
