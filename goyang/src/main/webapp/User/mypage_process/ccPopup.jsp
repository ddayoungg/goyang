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
//아이디 set
String id="";//아이디
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if

//예약번호 set
int reserNum=0;
if(request.getParameter("reserNum") !=null) {
	reserNum=Integer.parseInt(request.getParameter("reserNum"));
}//end if

//창 닫기
String closeFlag="pass";//"pass"=창 닫기 X  // "close","commit","logout"=창 닫기 O
if(request.getParameter("closeFlag") !=null){
	closeFlag = request.getParameter("closeFlag");
}//end if

%>

<script type="text/javascript">
$(function(){
	accessChk();//접근 권한 확인
	
	$("#closeBtn").click(function(){//닫기 버튼 누를 시 예약 취소 팝업 닫기
	    window.close();
	});//click
	
	$("#recCcBtn").click(function(){//예약 취소 버튼
		nullChk();
	});//click
})//ready

function accessChk(){
	var id="<%= id %>";
	var reserNum=<%= reserNum %>;
	var closeFlag="<%= closeFlag %>";
		
	if(id==""){
		if(closeFlag != "logout") {//user_mypage_rescancel_process에서 로그인 하지 않은 상태에서 넘어올 경우
			alert("로그인 해주세요.");
		}//end if
		opener.location.href="http://211.63.89.140/User/mypage_process/resDetailPopup.jsp?closeFlag=logout";
		window.close();
		return;
	}//end if
	
	if(closeFlag=="commit") {//예약취소 성공 시 팝업 닫기
		opener.location.href="http://211.63.89.140/User/mypage_process/resDetailPopup.jsp?closeFlag=commit";
		window.close();
		return;
	}//end if
	
	if(reserNum==0){
		alert("존재하지 않은 예약번호 입니다.");
		opener.location.href="http://211.63.89.140/User/mypage_process/resDetailPopup.jsp?closeFlag=reserNum";
		window.close();
		return;
	}//end if
	
	
}//accessChk      

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
MyInfoDAO miDAO=MyInfoDAO.getInstance();

//파라미터 값 set
miVO.setId(id);
miVO.setReserNum(reserNum);

MyInfoVO reserInfo=miDAO.selectReserDetail(miVO);

pageContext.setAttribute("reserInfo", reserInfo);
%>
		
<div style="width: 800px; margin: 0px auto">
			<div style="font-weight: bold; font-size: 15px; width: 800px; height: 50px; padding-left: 15px;
			display: flex; align-items: center; background-color: #f0f6f9; border: 1px solid #ddd; margin-bottom: 5px">예약 취소</div>
			
			<form action="user_mypage_rescancel_process.jsp" method="post" id="ccFrm">
			
			<div style="margin: 20px 0px 20px; display: flex; flex-direction: column; justify-content: center; width: 100%;">
			<div><h3>예약 취소 사유</h3></div>
			
			<div><textarea id="cancelReas" name="cancelReas" cols="100" rows="10" placeholder="내용을 입력해주세요."></textarea></div>
			</div>
			
			<!-- hidden 영역 시작 -->
			<input type="hidden" id="hiddReserNum" name="reserNum" value="${ param.reserNum }">
			<input type="hidden" id="hiddReserDate" name="reserDate" value="${ reserInfo.reserDate }">
			<!-- hidden 영역 끝 -->
			<div style="margin: 20px 0px 20px; display: flex; justify-content: center; width: 100%; height: 32px;">
			<input type="button" value="예약 취소" id="recCcBtn" class="popupBtn">
			<input type="button" value="닫기" id="closeBtn" class="popupBtn"/>
			</div>
			</form>
</div>

</div>
</body>
</html>