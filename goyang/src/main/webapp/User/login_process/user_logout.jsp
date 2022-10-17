<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("id");

if(session.getAttribute("passFlag") !=null){ /* 22-10-15 남상민 추가 */
	session.removeAttribute("passFlag");
};

response.sendRedirect("../main/index.jsp");
%>