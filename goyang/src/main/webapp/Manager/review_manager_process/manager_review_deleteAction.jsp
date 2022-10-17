<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="kr.co.goyang.manager.dao.ReviewManagerDAO" %>
   <%@ page import="kr.co.goyang.manager.vo.ReviewManagerVO" %>
   <%@ page import="java.io.PrintWriter" %>


<%
request.setCharacterEncoding("UTF-8");

int reviewNum=Integer.parseInt(request.getParameter("reviewNum"));
	ReviewManagerDAO rmDAO =new ReviewManagerDAO();
	int result = rmDAO.deleteReview(reviewNum);
	if(result == -1){
		System.out.println("실패");
		PrintWriter pw=response.getWriter();  
		pw.println("<script>");
		pw.println("alert('글 삭제를 실패했습니다.')");
		pw.println("history.back()");
		pw.println("</script>");
	}else{
		PrintWriter pw=response.getWriter();
		pw.println("<script>");
		pw.println("location.href='manager_review.jsp'");
		pw.println("</script>");
	}
%>
