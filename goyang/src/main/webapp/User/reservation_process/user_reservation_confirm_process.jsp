<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.goyang.dbConnection.DbConnection"%>
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
String id="";
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if

if(id==""){//로그인되지 않았다면
	response.sendRedirect("http://localhost/goyang/User/login_process/user_signIn.jsp");
	return;
}//end if

int reserNum=0;//예약번호
boolean resFlag=false;//예약 성공 여부
int errCode=0;//에러 코드 값
%>

<c:catch var="e">
<%


trVO.setId(id);//Id 세팅

TourReservaDAO trDAO=TourReservaDAO.getInstance();

/* DAO트랜잭션 시작 */
DbConnection dc=DbConnection.getInstance();

Connection con=null;
try {
	con=dc.getConn();
	con.setAutoCommit(false);
	
	reserNum=trDAO.insertTourReser(trVO, con);
	trVO.setReserNum(reserNum);
	trDAO.insertSeatReser(trVO, con);
	
	con.commit();
	resFlag=true;
	System.out.println("commit 성공");
} catch (SQLException e) {
	try {
		errCode=e.getErrorCode();
		System.out.println("트랜잭션 실패");
		
		//reserNum 다시 초기화
		reserNum=0;
		trVO.setReserNum(0);
		
		con.rollback();
	} catch (SQLException e1) {
		e1.printStackTrace();
	} // end catch
	e.printStackTrace();
}finally {
	try {//6.연결 끊기
		con.setAutoCommit(true);//오토커밋 설정
		if(con!=null) {con.close();}//end if
	} catch (SQLException e) {
		e.printStackTrace();
	}//end catch
}//end finally

/* DAO트랜잭션 끝 */

//파라메터 받기
%>
</c:catch>

<c:if test="${ e ne null }">
처리 중 문제가 발생했습니다. 잠시 후 다시 시도해 주세요.
/* <c:out value= "${ e }" /> */
</c:if>

<%if(resFlag) {%>
	alert("결제가 완료 되었습니다.");
	location.href="user_reservation_success.jsp?reserNum=<%= reserNum %>";
<%}else if(errCode==1){%>
	alert("이미 예약된 좌석입니다.");
	history.back();
<%}else {%>
	alert("예약에 실패하셨습니다.");
	history.back();
<%}//end else%>
</script>