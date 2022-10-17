<%@page import="kr.co.goyang.user.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.co.goyang.user.vo.UserVO" %>
        <%@ page import="java.io.PrintWriter" %>
    
        <% request.setCharacterEncoding("UTF-8"); %>
    
<%
String id=request.getParameter("id");
String password=request.getParameter("password");


UserDAO dao=UserDAO.getInstance();


	if(dao.updatePass(id, password)!=-1){
		PrintWriter pw=response.getWriter();
		pw.println("<script>");
		pw.println("alert('비밀번호가 정상적으로 변경되었습니다.')");
		pw.println("location.href='user_signIn.jsp'");
		pw.println("</script>");

	}else{
		PrintWriter pw=response.getWriter();
		pw.println("<script>");
		pw.println("alert('비밀번호 변경에 실패했습니다.')");
		pw.println("history.back()");
		pw.println("</script>");
	}
%>