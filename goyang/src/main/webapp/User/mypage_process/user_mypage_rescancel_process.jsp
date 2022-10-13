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
//초기값
String id="user";//로그인 한 경우
int resultCnt=0;
%>
<%
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if
if(id==null){//로그인되지 않았다면
	response.sendRedirect("http://localhost/goyang/User/login_process/user_signIn.jsp");
	return;
}//end if
%>

<c:catch var="e">
<%
MyInfoDAO miDAO=MyInfoDAO.getInstance();

miVO.setId(id);//아이디 VO set
int reserNum=Integer.parseInt(request.getParameter("reserNum"));
miVO.setReserNum(reserNum);

resultCnt=miDAO.tranReserCancel(miVO);

%>
</c:catch>

<c:if test="${ e ne null }">
예외발생 :
<c:out value= "${ e }" />
</c:if>

<%if(resultCnt!=0){%>
	alert("예약이 취소되었습니다.");
	history.back();
<%}else {%>
	alert("예약이 취소되지 못했습니다.");
	history.back();
<%}%>
</script>
</head>
<body>

</body>
</html>