<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("id");

if(session.getAttribute("passFlag") != null){
	session.removeAttribute("passFlag");
}

response.sendRedirect("../main/index.jsp");
%>