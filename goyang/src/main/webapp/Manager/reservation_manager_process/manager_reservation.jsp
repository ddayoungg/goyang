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
					<li><a href="../user_manager_process/manager_member_popup.jsp">회원관리</a></li>
					<li><a href="../tour_manager_process/manager_tour_manager.jsp">투어관리</a></li>
					<li><a href="manager_reservation.jsp">예약관리</a></li>
					<li><a href="../spot_manager_process/manager_spot_list.jsp">관광지 관리</a></li>
					<li><a href="../review_manager_process/manager_review.jsp">후기관리</a></li>
				</ul>

				<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li></li>
					<li style="font-size: 5px; font-weight: bold;"><a href="../login_manager/manager_signIn.jsp">로그아웃</a></li>
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
		<form>
			<!-- <div style="font-size: 20px; margin: 50px 0px 10px 0px">예약관리</div>
			<hr> -->

			<div>
				<div style="display: flex; justify-content: end; margin-bottom: 5px; margin-top: 20px;">
					<input type="text" placeholder="고객명을 입력하세요.">
					<input type="button" value="검색" class="mainBtn">
				</div>
				<table class="member" style="width: 100%">
					<tr>
						<th>예약번호</th>
						<th>고객명</th>
						<th>예약일</th>
						<th>투어코스명</th>
						<th>요금</th>
						<th>상태</th>
						<th>기타내용</th>
					</tr>
					<tr>
						<td>01</td>
						<td><a href="#void"><span onclick="showPopup(true,'popupDetail')">김도희</span></a></td>
						<td>2022.09.08</td>
						<td>목요나들이</td>
						<td>20,000원</td>
						<td>예약확정</td>
						<td></td>
					</tr>
					<tr>
						<td>02</td>
						<td><a href="#void">홍다영</a></td>
						<td>2022.09.09</td>
						<td>금요나들이</td>
						<td>12,000원</td>
						<td>예약대기</td>
						<td></td>
					</tr>
					<tr>
						<td>03</td>
						<td><a href="#void">김소현</a></td>
						<td>2022.09.10</td>
						<td>토요나들이</td>
						<td>12,000원</td>
						<td>취소요청</td>
						<td><a href="#void"><span onclick="showPopup(true,'popupCancel')">취소사유</span></a></td>
					</tr>
				</table>
			</div>

			<div style="display: flex; justify-content: space-between; align-items: center;">
				<div>
					<select style="height: 32px; min-width: 120px;">
						<option>상태 검색</option>
						<option>예약확정</option>
						<option>예약대기</option>
						<option>취소확정</option>
						<option>취소요청</option>
					</select>
					<input type="button" value="검색" style="height: 32px" class="mainBtn">
				</div>

				<div style="margin: 20px 0px 20px; display: flex; justify-content: center; height: 32px;">
					<input class="pagination" type="button" value="<">
					<input class="pagination pageNow" type="button" value="1">
					<input class="pagination" type="button" value=">">
				</div>

				<div>
					총 <span>1</span>건의 예약 / 1~2번째
				</div>
			</div>
		</form>
	</div>


	<div class="site-footer">
		<div class="inner first">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<div class="widget">
							<p style="font-size: 20px;font-weight: bold; color: red;font-style:inherit;">매주 월요일은 정기
								휴무입니다.</p>
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
	<div id="popupDetail" class="hide popup">
		<div class="content">
			<div style="width: 800px;">
				<div style="font-weight: bold; font-size: 15px; width: 800px; height: 40px; padding-left: 15px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">예약 상세
				</div>

				<div style="width: 800px">
					<table class="member" style="width: 100%">
						<tr>
							<th>예약자명</th>
							<td>김도희</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>12334@naver.com</td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td>010-1234-5678</td>
						</tr>
						<tr>
							<th>날짜</th>
							<td>2022.09.08</td>
						</tr>
						<tr>
							<th>투어코스</th>
							<td>목요나들이</td>
						</tr>
						<tr>
							<th>인원수 </th>
							<td>성인(6,000원) : 2명<br>기타(4,000원) : 2명</td>
						</tr>
						<tr>
							<th>예약한 좌석 번호</th>
							<td>18, 19, 20, 21</td>
						</tr>
					</table>
				</div>

				<div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
					<input type="button" value="예약확정" class="popupBtn" onclick="showPopup(true,'popupConfirm_1')">
					<input type="button" value="확인" class="popupBtn" onclick="closePopup('popupDetail')">
				</div>
			</div>
		</div>
	</div>
	<!-- 팝업창 : manager_reservation_cancel -->
	<div id="popupCancel" class="hide popup">
		<div class="content">
			<div style="width: 800px;">
				<div style="font-weight: bold; font-size: 15px; width: 800px; height: 40px; padding-left: 15px;
		display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">취소 사유
				</div>

				<div style="width: 800px">
					<table class="member" style="width: 100%">
						<tr>
							<th>예약자명</th>
							<td>김소현</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>56789@naver.com</td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td>010-1234-5678</td>
						</tr>
						<tr>
							<th>날짜</th>
							<td>2022.09.09</td>
						</tr>
						<tr>
							<th>투어코스</th>
							<td>토요나들이</td>
						</tr>
						<tr>
							<th>인원수 </th>
							<td>성인(6,000원) : 2명</td>
						</tr>
						<tr>
							<th>예약한 좌석 번호</th>
							<td>18, 19</td>
						</tr>
						<tr>
							<th>취소 사유</th>
							<td>선약이 있었습니다...</td>
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
	<div id="popupConfirm_2" class="hide popup">
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