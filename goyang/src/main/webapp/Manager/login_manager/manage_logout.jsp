<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("manageId");

response.sendRedirect("manager_signIn.jsp");
%>