<%@page import="java.sql.Date"%>
<%@page import="kr.co.goyang.user.dao.TourReviewDAO"%>
<%@page import="kr.co.goyang.user.vo.TourReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>  
<script type="text/javascript">
<%
request.setCharacterEncoding("UTF-8");

//commend_num, com_content, com_write_date, com_del_flag, review_num, id, upCommendNum, upComWriteDate
String reviewNum = request.getParameter("reviewNum");
System.out.println("reviewNum : "+reviewNum);
String comContent = request.getParameter("comContent");
System.out.println("comContent : "+comContent);
String id = request.getParameter("id");
System.out.println("id : "+id);
String upCommendNum = request.getParameter("upCommendNum");
System.out.println("upCommendNum : "+upCommendNum);
String upComWriteDate = request.getParameter("upComWriteDate");
System.out.println("upComWriteDate : "+upComWriteDate);

TourReviewVO commVO = new TourReviewVO();
commVO.setReviewNum(Integer.valueOf(reviewNum));
commVO.setComContent(comContent);
commVO.setComDelFlag("1");
commVO.setId(id);
System.out.println(commVO);

if(!upCommendNum.equals("null")){
	commVO.setComWriteDate(Date.valueOf(upComWriteDate));
	commVO.setCommendNum(Integer.valueOf(upCommendNum));
}

TourReviewDAO trDAO = TourReviewDAO.getInstance();
if(!upCommendNum.equals("null")){
	trDAO.updateCommend(commVO);
}else{
	trDAO.insertCommend(commVO);
}
%>
location.href="user_review_detail.jsp?reviewNum=<%=reviewNum%>";
</script>

