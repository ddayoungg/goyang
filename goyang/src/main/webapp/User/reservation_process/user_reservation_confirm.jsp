<%@page import="java.sql.Date"%>
<%@page import="kr.co.goyang.user.vo.TourReservaVO"%>
<%@page import="kr.co.goyang.user.dao.TourReservaDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");//post방식 일 때의 한글 처리
%>
<jsp:useBean id="trVO" class="kr.co.goyang.user.vo.TourReservaVO" scope="page" />
<jsp:setProperty name="trVO" property="tourNum"/>
<jsp:setProperty name="trVO" property="reserDate"/>
<jsp:setProperty name="trVO" property="adultCnt"/>
<jsp:setProperty name="trVO" property="otherCnt"/>
<jsp:setProperty name="trVO" property="seatNumIn"/>

<%
//로그인 권한여부
String id="";//아이디
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if
if(id==""){//로그인되지 않았다면
	response.sendRedirect("http://localhost/goyang/User/login_process/user_signIn.jsp");
	return;
}//end if
%>

<c:catch var="e">
<%

TourReservaDAO trDAO = TourReservaDAO.getInstance();

//파라메터 받기
int tourNum=trVO.getTourNum();
String reserDate=trVO.getReserDate();
int adultCnt=trVO.getAdultCnt();
int otherCnt=trVO.getOtherCnt();
int[] seatNumIn=trVO.getSeatNumIn();
//업무를 처리한 결과가 발생.
TourReservaVO tourInfo=trDAO.selectTourInfo(tourNum);

//뷰 페이지로 보내기 위해 scope객체에 설정( forward method가 호출되기 전에만 하면 됨.)
request.setAttribute("seatNumIn", seatNumIn);
request.setAttribute("tourInfo", tourInfo);

//1. 이동할 페이지 설정
RequestDispatcher rd=request.getRequestDispatcher("user_reservation_confirm_view.jsp");
//2. 이동
rd.forward(request,response);

%>
</c:catch>

<c:if test="${ e ne null }">
잠시 후 다시 한번 시도해 주세요. 
<%-- <c:out value= "${ e }" /> --%>
</c:if>