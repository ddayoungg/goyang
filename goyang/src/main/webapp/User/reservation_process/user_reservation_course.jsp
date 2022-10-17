<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="kr.co.goyang.user.vo.TourReservaVO"%>
<%@page import="kr.co.goyang.user.dao.TourReservaDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");//post방식 일 때의 한글 처리
%>

<%
//파라미터, 세션 얻기
//로그인 여부
String id="";//아이디
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if
%>

<c:catch var="e">
<%
TourReservaDAO trDAO = TourReservaDAO.getInstance();

//파라메터 받기

//업무를 처리한 결과가 발생.
List<TourReservaVO> cosList=trDAO.selectTourList();

//뷰 페이지로 보내기 위해 scope객체에 설정( forward method가 호출되기 전에만 하면 됨.)
request.setAttribute("cosList", cosList);

//1. 이동할 페이지 설정
RequestDispatcher rd=request.getRequestDispatcher("user_reservation_course_view.jsp");
//2. 이동
rd.forward(request,response);
%>
</c:catch>

<c:if test="${ e ne null }">
예외발생 :
<c:out value= "${ e }" />
</c:if>