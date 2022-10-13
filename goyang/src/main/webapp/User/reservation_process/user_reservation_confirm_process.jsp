<%@page import="java.sql.Date"%>
<%@page import="kr.co.goyang.user.vo.TourReservaVO"%>
<%@page import="kr.co.goyang.user.dao.TourReservaDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");//post방식 일 때의 한글 처리
%>
<jsp:useBean id="trVO" class="kr.co.goyang.user.vo.TourReservaVO" scope="page" />
<jsp:setProperty name="trVO" property="*"/>

<script type="text/javascript">

<%
String id="tester";
int reserNum=0;
%>

<c:catch var="e">
<%
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if

trVO.setId(id);//Id 세팅

TourReservaDAO trDAO=TourReservaDAO.getInstance();
trVO.setReserNum(trDAO.tranReser(trVO));
//파라메터 받기
reserNum=trVO.getReserNum();

%>
</c:catch>

<c:if test="${ e ne null }">
예외발생 :
<c:out value= "${ e }" />
</c:if>

location.href="user_reservation_success.jsp?reserNum=<%= reserNum %>";
</script>