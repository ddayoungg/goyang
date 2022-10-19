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
boolean flag=false;//비밀번호 확인 여부

String id="";//아이디
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if
if(id==""){//로그인되지 않았다면
	response.sendRedirect("http://211.63.89.140/User/login_process/user_signIn.jsp");
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
처리 중에 오류가 발생했습니다. 잠시 후 다시 시도해 주세요.
/* <c:out value= "${ e }" /> */
</c:if>

<%if(flag){
	session.setAttribute("passFlag", "pass");//비밀번호 확인에 대한 세션값 할당.
%>
	location.href="http://211.63.89.140/User/mypage_process/user_mypage.jsp";
<%}else {%>
	alert("비밀번호가 틀렸습니다.");
	history.back();
<%}%>
</script>
<body>

</body>
</html>