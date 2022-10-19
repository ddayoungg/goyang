<%@page import="kr.co.goyang.manager.dao.ManagerDAO"%>
<%@page import="kr.co.goyang.manager.vo.ManagerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.140/jsp_prj/common/css/main_v1_20220901.css"/>
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript">

</script>
</head>
<body>
<%
 request.setCharacterEncoding("UTF-8");
 String id=request.getParameter("id");
 String pw=request.getParameter("pass");
 ManagerVO mVO=new ManagerVO();
 mVO.setId(id);
 mVO.setPassword(pw);
 
 ManagerDAO mnDAO=ManagerDAO.getInstance();
 boolean login=mnDAO.selectLoginManager(mVO);
 
 if(!login){
	 %>
	 <script type="text/javascript">
	 	alert("관리자 로그인에 실패하였습니다.");
	 	history.back();
	 </script>
 <%}else{
	 //로그인 정보를 세션 객체에 저장.
	 session.setAttribute("manageId", id);
	 //메인으로 이동.
	 response.sendRedirect("http://211.63.89.140/Manager/dashboard_process/manager_dashboard.jsp");
 }
 
 
%>


</body>
</html>