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
</head>
<script type="text/javascript">
<%
//초기값
String id="user";//로그인 한 경우
boolean flag=false;//비밀번호 확인 여부
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

flag=miDAO.selectMyPassConfirm(miVO);//비밀번호 확인

%>
</c:catch>

<c:if test="${ e ne null }">
예외발생 :
<c:out value= "${ e }" />
</c:if>

<%if(flag){%>
	location.href="user_mypage.jsp";
<%}else {%>
	alert("비밀번호가 틀렸습니다.");
	location.href="user_mypage_inner.jsp";
<%}%>
</script>
<body>

</body>
</html>