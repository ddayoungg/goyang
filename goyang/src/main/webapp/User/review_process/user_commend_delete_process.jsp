<%@page import="java.sql.Connection"%>
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

//commend_num, com_content, com_write_date, com_del_flag, review_num, id
String reviewNum = request.getParameter("reviewNum");
System.out.println(reviewNum);
String commendNum = request.getParameter("commendNum");
System.out.println(commendNum);

TourReviewDAO trDAO = TourReviewDAO.getInstance();
trDAO.deleteComm(Integer.parseInt(commendNum));
%>
location.href="user_review_detail.jsp?reviewNum=<%=reviewNum%>";
</script>

