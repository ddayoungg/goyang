<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.goyang.dbConnection.DbConnection"%>
<%@page import="kr.co.goyang.user.dao.MyInfoDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="miVO" class="kr.co.goyang.user.vo.MyInfoVO" scope="page" />
<jsp:setProperty name="miVO" property="*"/>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">

<!-- google jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
<%
int rowCnt=0;//DB에서 추가되거나 변경된 행 수 - 2: new 예약취소 1: 취소사유 수정
int errCode=0;//에러코드

String id="";//아이디
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if
if(id==""){//로그인되지 않았다면
	response.sendRedirect("http://211.63.89.140/User/mypage_process/ccPopup.jsp?closeFlag=close");
	return;
}//end if

//예약번호 set
int reserNum=0;
if(request.getParameter("reserNum") !=null) {
	reserNum=Integer.parseInt(request.getParameter("reserNum"));
}//end if
if(reserNum==0){//예약번호가 없을 경우
	response.sendRedirect("http://211.63.89.140/User/mypage_process/ccPopup.jsp?closeFlag=reserNum");
	return;
}//end if
%>

<c:catch var="e">
<%
MyInfoDAO miDAO=MyInfoDAO.getInstance();

//VO set
miVO.setId(id);//아이디
reserNum=Integer.parseInt(request.getParameter("reserNum"));
miVO.setReserNum(reserNum);//예약번호

/* DAO 예약 취소 트랜잭션 시작 */

DbConnection dc=DbConnection.getInstance();
		
Connection con=null;
try {
	con=dc.getConn();
	con.setAutoCommit(false);
			
	miDAO.insertReserCancel(miVO, con);
	rowCnt++;//취소사유 추가 성공 시
	rowCnt+=miDAO.updateReserCancel(miVO.getReserNum(), con);
	
	con.commit();
	System.out.println("예약 취소 추가 commit 성공");
} catch (SQLException e) {//예약 취소 추가에 대한 롤백에 대한 예외처리
	e.printStackTrace();
	errCode=e.getErrorCode();
	try {
		System.out.println("예약 취소 추가 트랜잭션 실패");
		con.rollback();
		if(errCode==1){//이미 예약 취소 될 경우 예약취소 사유만 수정
			rowCnt=miDAO.updateCancelReas(miVO, con);
			con.commit();
			System.out.println("예약 취소 사유 수정 commit 성공");
			errCode=0;//에러코드 0 set
		}//end if
	} catch (SQLException e1) {
		e1.printStackTrace();
		try{
		System.out.println("예약 취소 사유 수정 트랜잭션 실패");
		con.rollback();
		}catch (SQLException e2) { //예약 취소 수정에 대한 롤백에 대한 예외처리
			e2.printStackTrace();
		}//end catch
	} // end catch
}finally {
	try {//6.연결 끊기
		con.setAutoCommit(true);//오토커밋 설정
		if(con!=null) {con.close();}//end if
	} catch (SQLException e) {
		e.printStackTrace();
	}//end catch
}//end finally

/* DAO 예약 취소 트랜잭션 끝 */

%>
</c:catch>

<c:if test="${ e ne null }">
처리 중에 오류가 발생했습니다. 잠시 후 다시 시도해 주세요.
/* <c:out value= "${ e }" /> */
</c:if>

<%if(rowCnt==2){%>
	alert("예약이 취소되었습니다.");
	location.href="http://211.63.89.140/User/mypage_process/ccPopup.jsp?closeFlag=commit";
<%}else if(rowCnt==1){%>
	alert("예약 사유가 수정되었습니다.");
	location.href="http://211.63.89.140/User/mypage_process/ccPopup.jsp?&closeFlag=commit";
<%}else {%>
	alert("예약이 취소되지 못했습니다.");
	history.back();
<%}//end else%>
</script>
</head>
<body>

</body>
</html>