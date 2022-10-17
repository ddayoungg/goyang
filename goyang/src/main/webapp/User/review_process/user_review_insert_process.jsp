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
boolean flag=false;
request.setCharacterEncoding("UTF-8");

File uploadDir = new File("C:/Users/user/git/goyang/goyang/src/main/webapp/images");

int maxSize = 1024*1024*600;

MultipartRequest mr=new MultipartRequest(request, uploadDir.getAbsolutePath(), 
		maxSize, "UTF-8", new DefaultFileRenamePolicy());

//4. file control 처리
//원본 파일명
String originalName=mr.getOriginalFileName("thumImgFile");
//변경된 파일명
String reName=mr.getFilesystemName("thumImgFile");

if(reName==null){//선택한 파일이 없을 경우 원래 파일명으로 set
	reName=mr.getParameter("thumImg");
}//end if

String reviewNum = mr.getParameter("reviewNum");
String title = mr.getParameter("title");
String revContent = mr.getParameter("revContent");
String id = mr.getParameter("id");
String tourNum = mr.getParameter("selTour");

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

File temp=new File(uploadDir.getAbsolutePath()+"/"+reName);
int checkSize=1024*1024*5;
if( temp.length()  > checkSize){
	 flag=true;
	 temp.delete();//파일 삭제
}//end if

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