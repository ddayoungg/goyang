<%@page import="kr.co.goyang.user.dao.TourReviewDAO"%>
<%@page import="kr.co.goyang.user.vo.TourReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
<%
request.setCharacterEncoding("UTF-8");

String reviewNum = request.getParameter("reviewNum");
System.out.println("reviewNum : "+reviewNum);

TourReviewDAO trDAO = TourReviewDAO.getInstance();
int delCnt = trDAO.deleteReview(Integer.valueOf(reviewNum));
System.out.println(delCnt);
%>
	
location.href="user_review.jsp";
</script> 
