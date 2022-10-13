<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@page import="kr.co.goyang.manager.vo.TourManagerVO"%>
<%@page import="kr.co.goyang.manager.dao.TourManagerDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="kr.co.goyang.user.vo.TourReservaVO"%>
<%@page import="kr.co.goyang.user.dao.TourReservaDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<script type="text/javascript">
<%
//초기값 설정
boolean flag=false;//파일 크기 체크 여부
int tourNum=0;//투어 번호
int resultCnt=0;//투어 정보 수정한 행 수
%>
<c:catch var="e">
<%
TourManagerDAO tmDAO=TourManagerDAO.getInstance();
TourManagerVO tmVO=new TourManagerVO();

//1. 업로드 경로 얻기
File uploadDir=new File("C:/Users/user/git/goyang/goyang/src/main/webapp/images");

//2. 업로드할 파일 크기를 연산
//600MByte까지의 파일을 업로드
int maxSize=1024*1024*600;

//3. 업로드 : MultipartRequest를 생성하면 파일이 업로드 된다.
//MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy)

MultipartRequest mr=new MultipartRequest(request, uploadDir.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());

//4. file control 처리
//원본 파일명
String originalName=mr.getOriginalFileName("thumImgFile");
//변경된 파일명
String reName=mr.getFilesystemName("thumImgFile");

if(reName==null){//선택한 파일이 없을 경우 원래 파일명으로 set
	reName=mr.getParameter("thumImg");
}//end if

//5. 웹 파라메터 처리
tourNum=Integer.parseInt(mr.getParameter("tourNum"));

tmVO.setTourNum(tourNum);
tmVO.setTourName(mr.getParameter("tourName"));
tmVO.setExplain(mr.getParameter("explain"));
tmVO.setThumImg(reName);
tmVO.setMapCenLati(Double.parseDouble(mr.getParameter("mapCenLati")));
tmVO.setMapCenLong(Double.parseDouble(mr.getParameter("mapCenLong")));
tmVO.setTourOrderIn(Arrays.stream(mr.getParameterValues("tourOrderIn")).mapToInt(Integer::parseInt).toArray());
tmVO.setSpotNameIn(mr.getParameterValues("spotNameIn"));
tmVO.setStartHourIn(mr.getParameterValues("startHourIn"));
tmVO.setEndHourIn(mr.getParameterValues("endHourIn"));
tmVO.setMapSpoLatiIn(Arrays.stream(mr.getParameterValues("mapSpoLatiIn")).mapToDouble(Double::parseDouble).toArray());
tmVO.setMapSpoLongIn(Arrays.stream(mr.getParameterValues("mapSpoLongIn")).mapToDouble(Double::parseDouble).toArray());
tmVO.setAdultFee(Integer.parseInt(mr.getParameter("adultFee")));
tmVO.setOtherFee(Integer.parseInt(mr.getParameter("otherFee")));

resultCnt=tmDAO.tranTourRectify(tmVO); //투어 정보 수정

//파일 크기 제한
File temp=new File(uploadDir.getAbsolutePath()+"/"+reName);
int checkSize=1024*1024*20;
if(temp.length() > checkSize){
	flag=true;
	temp.delete();//파일 삭제
}//end if
%>
</c:catch>

<c:if test="${ e ne null }">
예외발생 :
<c:out value= "${ e }" />
</c:if>

<%if(flag){%>
	alert("업로드 파일 크기는 20MByte까지만 가능합니다.");
	location.href="manager_tour_rectify.jsp?tourNum=<%= tourNum %>";
	return;
<%}//end if %>
<%if(resultCnt!=0){%>
	alert("수정이 완료되었습니다.");
	location.href="manager_tour_detail.jsp?tourNum=<%= tourNum %>";
<%}else {%>
	alert("수정이 실패했습니다.");
	history.back();
<%}%>
</script>
<body>

</body>
</html>