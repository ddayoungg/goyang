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
int tourNum=0;
int upResult=0;//update문으로 변환된 행 수
%>
<c:catch var="e">
<%
if(request.getParameter("tourNum") != null){
	tourNum = Integer.parseInt(request.getParameter("tourNum"));
}//end if

TourManagerDAO tmDAO=TourManagerDAO.getInstance();
upResult=tmDAO.updateTourDown(tourNum); //투어 종료
%>
</c:catch>

<c:if test="${ e ne null }">
예외발생 :
<c:out value= "${ e }" />
</c:if>

<%if(upResult==1){%>
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