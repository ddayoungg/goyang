<%@page import="kr.co.goyang.manager.dao.UserManagerDAO"%>
<%@page import="kr.co.goyang.manager.vo.UserManagerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String outReas = request.getParameter("outReas");
	
	UserManagerVO userVO = new UserManagerVO();
	userVO.setId(id);
	userVO.setOutReas(outReas);
	
	UserManagerDAO umDAO = UserManagerDAO.getInstance();
	umDAO.tranUser(userVO);
%>
	
alert("탈퇴 완료");
location.href="manager_member2.jsp";
</script>