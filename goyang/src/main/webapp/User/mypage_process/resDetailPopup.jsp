<%@page import="kr.co.goyang.user.vo.MyInfoVO"%>
<%@page import="kr.co.goyang.user.dao.MyInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="아이디 중복확인"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세보기</title>

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

<style type="text/css">
.centerMargin{margin: 0px auto;}
</style>

<!-- JQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<jsp:useBean id="miVO" class="kr.co.goyang.user.vo.MyInfoVO" scope="page" />
<jsp:setProperty name="miVO" property="*"/>

<%
String id="";//로그인한 아이디
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if

//예약번호 set
int reserNum=0;
if(request.getParameter("reserNum") !=null) {
	reserNum=Integer.parseInt(request.getParameter("reserNum"));
}//end if

//자신의 창 닫기
String closeFlag="pass";//"pass"=창 닫기 O "close"=창 닫기 X
if(request.getParameter("closeFlag") !=null){
	closeFlag = request.getParameter("closeFlag");
}//end if

%>

<script type="text/javascript">
$(function(){
	
	accessChk();//접근 권한 확인
	
	<%if(closeFlag.equals("commit")) {%>
		opener.location.reload();
		window.close();
		return;
	<%}//end if%>
	
	$("#closeBtn").click(function(){
	    window.close();
	});//click
})//ready

function accessChk(){
	var id="<%= id %>";
	var reserNum=<%= reserNum %>;
	var closeFlag="<%= closeFlag %>";
	
	if(id==""){
		<%if(!closeFlag.equals("logout")) {%>//자식 팝업 창에서 이미 메시지를 띄울 경우
			alert("로그인 해주세요.");
		<%}//end if%>
		opener.location.href="http://211.63.89.140/User/login_process/user_signIn.jsp";
		window.close();
		return;
	}//end if
	
	if(closeFlag=="commit") {//예약취소 성공 시 팝업 닫기
		window.close();
		return;
	}//end if
	
	if(reserNum==0){
		if(closeFlag!="reserNumNon"){//자식 팝업 창에서 이미 메시지를 띄울 경우
			alert("존재하지 않은 예약번호 입니다.");
		}//end if
		opener.location.reload();
	    window.close();
		return;
	}//end if
	
}//accessChk

function ccPopup(reserNum) {//예약 취소 팝업
	var leftVal=(document.body.offsetWidth / 2) - (220 / 2);
	var topVal=(window.screen.height / 2) - (320 / 2);
	window.open("ccPopup.jsp?reserNum="+reserNum, "예약 취소", "width=800, height=500, left="+leftVal+", top="+topVal+"");
}//ccPopup

</script>
</head>
<body>
<div id="dubWrap">

<%
MyInfoDAO miDAO=MyInfoDAO.getInstance();

//파라미터 값 set
miVO.setId(id);
miVO.setReserNum(reserNum);

MyInfoVO reserInfo=miDAO.selectReserDetail(miVO);//예약 정보
int[] resSeatNum=miDAO.selectResSeatNum(miVO.getReserNum());//예약된 좌석 번호

pageContext.setAttribute("reserInfo", reserInfo);//예약한 등록 정보
pageContext.setAttribute("resSeatNum", resSeatNum);//예약한 버스 좌석 번호
%>
		
<div style="width: 800px; margin: 0px auto">
			<div style="font-weight: bold; font-size: 15px; width: 800px; height: 50px; padding-left: 15px;
			display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">예약 상세보기</div>
			<table class="member" style="width: 100%">
				<tr>
					<th>예약자명</th>
					<td>${ reserInfo.name }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${ reserInfo.email }</td>
				</tr>
				<tr>
					<th>휴대폰 번호</th>
					<td>${ reserInfo.phone }</td>
				</tr>
				<tr>
					<th>투어 시작 날짜</th>
					<td>${ reserInfo.reserDate }</td>
				</tr>
				<tr>
					<th>투어 코스</th>
					<td>${ reserInfo.tourName }</td>
				</tr>
				<tr>
					<th>인원수 </th>
					<td>
						성인(${ reserInfo.adultFee }원) : ${ reserInfo.adultCnt }명, 
						기타(${ reserInfo.otherFee }원) : ${ reserInfo.otherCnt }명
					</td>
				</tr>
				<tr>
					<th>예약한 좌석 번호</th>
					<%if(resSeatNum.length!=0){ %>
					<td>
						<c:forEach var="seatNum" items="${ resSeatNum }">
							<c:out value="${ seatNum }"/>번&nbsp;
						</c:forEach>
					</td>
					<%}else {%>
					<td>
						<c:out value="좌석없음"/>
					</td>
					<%}//end else %>
				</tr>
				
				<c:if test="${ not empty reserInfo.cancelReas }">
				<tr>
					<th>취소 사유</th>
					<td>${ reserInfo.cancelReas }</td>
				</tr>
				</c:if>
			</table>
			<div style="margin: 20px 0px 20px; display: flex; justify-content: center; width: 100%; height: 32px;">
			<input type="button" value="예약취소" id="recCcBtn" onclick="ccPopup(${ param.reserNum })" class="popupBtn">
			<input type="button" value="닫기" id="closeBtn" class="popupBtn"/>
			</div>
</div>

</div>
</body>
</html>