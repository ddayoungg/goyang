<%@page import="java.sql.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.goyang.user.dao.TourReviewDAO"%>
<%@page import="kr.co.goyang.user.vo.TourReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>  
<script type="text/javascript">
<%
request.setCharacterEncoding("UTF-8");

//commend_num, com_content, com_write_date, com_del_flag, review_num, id
String reviewNum = request.getParameter("reviewNum");
String commendNum = request.getParameter("commendNum");
String comContent = request.getParameter("comContent");
String comWriteDate = request.getParameter("comWriteDate");

TourReviewVO commVO = new TourReviewVO();
commVO.setCommendNum(Integer.valueOf(commendNum));
commVO.setComContent(comContent);
commVO.setComWriteDate(Date.valueOf(comWriteDate));

TourReviewDAO trDAO = TourReviewDAO.getInstance();
trDAO.updateCommend(commVO);
%>
location.href="user_review_detail.jsp?reviewNum=<%=reviewNum%>&commendNum=<%=commendNum%>&comContent=<%=comContent%>&comWriteDate=<%=comWriteDate%>";
</script>

