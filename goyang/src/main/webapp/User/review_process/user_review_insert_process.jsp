<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="kr.co.goyang.user.dao.TourReviewDAO"%>
<%@page import="kr.co.goyang.user.vo.TourReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>  
<script type="text/javascript">
<%
File uploadDir = new File("C:/Users/user/git/goyang/goyang/src/main/webapp/User/review_process/upload/");
int maxSize = 1024*1024*5;
MultipartRequest mr=new MultipartRequest(request, uploadDir.getAbsolutePath(), 
		maxSize, "UTF-8", new DefaultFileRenamePolicy());
String reviewNum = mr.getParameter("reviewNum");
String title = mr.getParameter("title");
String revContent = mr.getParameter("revContent");
String id = mr.getParameter("id");
String tourNum = mr.getParameter("selTour");

//5. file control 처리
//원본 파일명
String originalName=mr.getOriginalFileName("photoFileInput");
//변경된 파일명
String reName=mr.getFilesystemName("photoFileInput");

boolean flag=false;
File temp=new File(uploadDir.getAbsolutePath()+"/"+reName);
int checkSize=1024*1024*5;
if( temp.length()  > checkSize){
	 flag=true;
	 temp.delete();//파일 삭제
}//end if

TourReviewVO trVO = new TourReviewVO();
if(!reviewNum.equals("null")){
	trVO.setReviewNum(Integer.valueOf(reviewNum));
}
trVO.setTitle(title);
trVO.setRevContent(revContent);
trVO.setReviewImg(reName);
trVO.setId(id);
trVO.setTourNum(Integer.valueOf(tourNum)+1);
System.out.println(trVO);

TourReviewDAO trDAO = TourReviewDAO.getInstance();
if(reviewNum.equals("null")){
	trDAO.insertReview(trVO);
}else{
	int upCnt = trDAO.updateReview(trVO);
	System.out.println(upCnt);
}
%>
	
location.href="user_review.jsp";
</script>