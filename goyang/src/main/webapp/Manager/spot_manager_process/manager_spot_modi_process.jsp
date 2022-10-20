<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="kr.co.goyang.manager.vo.SpotListVO"%>
<%@page import="kr.co.goyang.manager.dao.SpotListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="http://211.63.89.140/jsp_prj/common/css/main_v1_20220901.css" />
<style type="text/css">
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- Option 1: Bootstrap Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script type="text/javascript">
<%
//초기값 설정
boolean flag=false;//파일 크기 체크 여부
int updateCnt=0;
%>

<%
	request.setCharacterEncoding("UTF-8");

	//1. 업로드 경로 얻기
	File uploadDir=new File("E:/web_service_goyang/images");

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

	String spotName = mr.getParameter("spot_name");
	String spotContent = mr.getParameter("spot_info");
	String TourName = request.getParameter("tourname");
	int spotorder = Integer.parseInt(request.getParameter("spotorder"));
	System.out.println(spotName+spotContent+TourName+spotorder);
	
	SpotListVO spotVO = new SpotListVO();
	spotVO.setSpotsName(spotName);
	spotVO.setSpoContent(spotContent);
	spotVO.setSpotsImg(reName);
	spotVO.setTourName(TourName);
	spotVO.setTourOrder(spotorder);
	
	SpotListDAO spotDAO = SpotListDAO.getInstance();
	updateCnt = spotDAO.updateSpot(spotVO);
	
	File temp=new File(uploadDir.getAbsolutePath()+"/"+reName);
	int checkSize=1024*1024*20;
	
	if(temp.length() > checkSize){
		flag=true;
		temp.delete();//파일 삭제
	}//end if
%>
	<%if(flag){%>
	alert("업로드 파일 크기는 20MByte까지만 가능합니다.");
	location.href="manager_spot_list.jsp";
	return;
	<%}//end if %>
	
	<%if (updateCnt == 1) {%>
		
		alert("수정완료.");
		location.href="manager_spot_list.jsp?selTour=<%=TourName %>";
	<%}else {%>
		alert("수정실패.");
		location.href="manager_spot_list.jsp?selTour=<%=TourName %>";
	<%}%>
	
</script>
</head>
<body>


</body>
</html>