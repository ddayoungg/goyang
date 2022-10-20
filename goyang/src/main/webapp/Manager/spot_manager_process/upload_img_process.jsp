<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.140/jsp_prj/common/css/main_v1_20220901.css"/>
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript">

</script>
</head>
<body>
<%-- <%
	String uploader=request.getParameter("uploader");
	String age=request.getParameter("age");
%>
업로더 : <strong><%=uploader %></strong>
나이 : <strong><%=age %></strong> --%>
<%
	//업로드 경로 얻기
	File uploadDir=new File("http://211.63.89.140/images");
	//업로드할 파일의 크기를 연산
	//5MByte까지 업로드 가능
	int maxSize=1024*1024*5;
	//업로드
	MultipartRequest mr=new MultipartRequest(request,uploadDir.getAbsolutePath(),maxSize,"UTF-8",new DefaultFileRenamePolicy());
	
	//웹 파라메터 처리
	String uploader=mr.getParameter("uploader");
	String age=mr.getParameter("age");
	
	//원본 파일명
	String originalName=mr.getOriginalFileName("upfile");
	//변경된 파일명
	String reName=mr.getFilesystemName("upfile");
	
	boolean flag=false;
	File temp=new File(uploadDir.getAbsolutePath()+"/"+reName);
	int checkSize=1024*1024*5;
	if(temp.length()> checkSize){
		flag=true;
		temp.delete();
	}
	
	if(!flag){//true라면
	
%>
파일이 업로드 되었습니다.
업로더 : <strong><%=uploader %></strong>
새로운파일명 : <strong><%=reName %></strong>
<%}else{ %>
업로드 파일은 5MByte까지만 가능합니다.
<%} %>
</body>
</html>