<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.goyang.dbConnection.DbConnection"%>
<%@page import="java.util.Arrays"%>
<%@page import="kr.co.goyang.manager.vo.TourManagerVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="kr.co.goyang.manager.dao.TourManagerDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<!-- JQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
$(function (){
<%
boolean imgFlag=false;//파일 크기 체크 flag. false: 파일 크기 허용, true: 파일 크기 초과
boolean errorFlag=true;//에러 발생 여부 flag. false: 에러 발생, true: 정상
boolean dbFlag=false;//DB 작업 성공 여부 flag. flase: DB처리 실패, true: DB처리 성공

//로그인 여부
String manageId=null;//아이디
if(session.getAttribute("manageId") !=null){//세션에서 아이디 가져오기.
	manageId = (String) session.getAttribute("manageId");
}//end if

if(manageId==null){//로그인되지 않았다면
	response.sendRedirect("http://211.63.89.140/Manager/login_manager/manager_signIn.jsp");
	return;
}//end if

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
String originalName="";//원본 파일명
String reName="";//변경된 파일명
try{
originalName=mr.getOriginalFileName("thumImgFile");
reName=mr.getFilesystemName("thumImgFile");

//5. 웹 파라메터 처리
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
}catch(NumberFormatException nfe) {
	System.out.println(nfe);
%>
	alert("데이터 타입을 확인해주세요.");
	history.back();
<%
	errorFlag=false;
}catch(Exception e){
%>
	alert("데이터 처리 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
	history.back();
<%
	errorFlag=false;
}//end catch

if(errorFlag){//위에서 에러가 발생하지 않을 경우 DAO 시작
/* DAO 투어 추가 트랜잭션 시작 */

DbConnection dc=DbConnection.getInstance();
		
Connection con=null;
try {
	con=dc.getConn();
	con.setAutoCommit(false);

	int tourNum=tmDAO.insertTour(tmVO, con);
	tmVO.setTourNum(tourNum);
	tmDAO.insertTourSport(tmVO, con);
			
	con.commit();
	dbFlag=true;
	System.out.println("commit 성공");
} catch (SQLException e) {
	try {
		System.out.println("트랜잭션 실패");
		con.rollback();
	} catch (SQLException e1) {
		e1.printStackTrace();
	} // end catch
	e.printStackTrace();
}finally {
	try {//6.연결 끊기
		con.setAutoCommit(true);//오토커밋 설정
		if(con!=null) {con.close();}//end if
	} catch (SQLException e) {
		e.printStackTrace();
	}//end catch
}//end finally

/* DAO 투어 추가 트랜잭션 시작 */
}//end if

//파일 크기 제한
File temp=new File(uploadDir.getAbsolutePath()+"/"+reName);
int checkSize=1024*1024*20;
if(temp.length() > checkSize){
	imgFlag=true;
	temp.delete();//파일 삭제
}//end if
if(imgFlag){ 
%>
	alert("업로드 파일 크기는 20MByte까지만 가능합니다.");
	history.back();
<%}else if(!dbFlag){ %>
	alert("투어 추가에 실패했습니다.");
	history.back();
<%}else{ %>
	alert("투어 추가가 완료되었습니다.");
	location.href="manager_tour_manager.jsp";
<%}//end else %>
});//reday
</script>
