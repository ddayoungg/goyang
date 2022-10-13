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

<script type="text/javascript">
$(function(){
	$("#closeBtn").click(function(){//닫기 버튼 누를 시 예약 취소 팝업 닫기
		opener.location.reload();
	    window.close();
	});//click
	
	$("#recCcBtn").click(function(){//예약 취소 버튼
		nullChk();
	});//click
})//ready

function nullChk() {
	if($("#cancelReas").val().trim()==""){
		alert("예약 취소 사유를 적어주세요.");
		$("#cancelReas").val("");//화이트 스페이스 초기화
		$("#cancelReas").focus();//커서 이동
		return;
	}//cancelReas
	
	$("#ccFrm").submit();//frm 전송
}//nullChk

</script>
</head>
<body>
<div id="dubWrap">

<%
String id="user";//로그인한 아이디
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if
if(id==null){//로그인되지 않았다면
	response.sendRedirect("http://localhost/goyang/User/login_process/user_signIn.jsp");
	return;
}//end if
%>

<%
MyInfoDAO miDAO=MyInfoDAO.getInstance();

//파라미터 값 set
miVO.setId(id);
miVO.setReserNum(Integer.parseInt(request.getParameter("reserNum")));

MyInfoVO reserInfo=miDAO.selectReserDetail(miVO);

pageContext.setAttribute("reserInfo", reserInfo);
%>
		
<div style="width: 800px; margin: 0px auto">
			<div style="font-weight: bold; font-size: 15px; width: 800px; height: 50px; padding-left: 15px;
			display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">예약 취소</div>
			
			<form action="user_mypage_rescancel_process.jsp" method="get" id="ccFrm">
			
			<div style="margin: 20px 0px 20px; display: flex; flex-direction: column; justify-content: center; width: 100%;">
			<div><h3>예약 취소 사유</h3></div>
			
			<div><textarea id="cancelReas" name="cancelReas" cols="100" rows="10" placeholder="내용을 입력해주세요."></textarea></div>
			</div>
			
			<!-- hidden 영역 -->
			<input type="hidden" id="hiddReserNum" name="reserNum" value="${ param.reserNum }">
			<input type="hidden" id="hiddReserDate" name="reserDate" value="${ reserInfo.reserDate }">
			<div style="margin: 20px 0px 20px; display: flex; justify-content: center; width: 100%; height: 32px;">
			<input type="button" value="예약 취소" id="recCcBtn" class="popupBtn">
			<input type="button" value="닫기" id="closeBtn" class="popupBtn"/>
			</div>
			</form>
</div>

</div>
</body>
</html>