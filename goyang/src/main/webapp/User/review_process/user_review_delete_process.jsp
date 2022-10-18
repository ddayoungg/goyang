<%@page import="kr.co.goyang.user.dao.TourReviewDAO"%>
<%@page import="kr.co.goyang.user.vo.TourReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
<%
System.out.println("delete");
request.setCharacterEncoding("UTF-8");

String reviewNum = request.getParameter("reviewNum");
System.out.println("reviewNum : "+reviewNum);

TourReviewDAO trDAO = TourReviewDAO.getInstance();
System.out.println("1");
trDAO.tranReview(Integer.parseInt(reviewNum));
System.out.println("2");
%>

alert("삭제 완료");
location.href="user_review.jsp";
</script> 
