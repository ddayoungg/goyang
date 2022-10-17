<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.goyang.manager.dao.TourManagerDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="kr.co.goyang.user.vo.TourReservaVO"%>
<%@page import="kr.co.goyang.user.dao.TourReservaDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<script type="text/javascript">

<%
//초기값
int upResult=0;//update문으로 변환된 행 수

//로그인 여부
String manageId="";//아이디
if(session.getAttribute("manageId") !=null){//세션에서 아이디 가져오기.
	manageId = (String) session.getAttribute("manageId");
}//end if

if(manageId==""){//로그인되지 않았다면
	response.sendRedirect("http://localhost/goyang/Manager/login_manager/manager_signIn.jsp");
	return;
}//end if
//투어 번호
int tourNum=0;
if(request.getParameter("tourNum") != null){
	tourNum = Integer.parseInt(request.getParameter("tourNum"));
}//end if
%>

<%
TourManagerDAO tmDAO=TourManagerDAO.getInstance();

try{
	upResult=tmDAO.updateTourDown(tourNum); //투어 종료
}catch(SQLException se){
	se.printStackTrace();
}//end catch

if(upResult==1){
%>
	alert("해당 투어가 종료되었습니다.");
	history.back();
<%}else {%>
	alert("해당 투어가 종료되지 못했습니다.");
	history.back();
<%}//end else%>
</script>
<body>

</body>
</html>