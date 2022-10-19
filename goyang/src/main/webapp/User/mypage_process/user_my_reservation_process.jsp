<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.goyang.user.vo.MyInfoVO"%>
<%@page import="kr.co.goyang.user.dao.MyInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%

String id="";//아이디
if(session.getAttribute("id") !=null){//세션에서 아이디 가져오기.
	id = (String) session.getAttribute("id");
}//end if

if(id==""){//로그인되지 않았다면
	response.sendRedirect("http://211.63.89.140/User/login_process/user_signIn.jsp");
	return;
}//end if

//페이징 시작
int cPage=1;//현재 페이지
int totalRows=0;//전체 행 수
int totalPages=0;//전체 페이지 수
int lenPS=10;//한 페이지 보여줄 행 수
int startPS=0;//페이지의 시작 지점
					
MyInfoDAO miDAO=MyInfoDAO.getInstance();
MyInfoVO miVO=new MyInfoVO();

try {
	 cPage=Integer.parseInt(request.getParameter("page"));
}catch(NumberFormatException nfe) {//파라미터가 null이 나올 경우
	cPage=1;
}//end catch
					
//전체 데이터 개수
totalRows=miDAO.selectMyReserTotal(id);
//총 페이지 수
totalPages = totalRows % lenPS == 0 ? totalRows/lenPS : (totalRows/lenPS) + 1;
if(totalPages==0) {
	totalPages = 1;
}//end if
					
if(cPage > totalPages) {
	cPage = 1;
}//end if
					
startPS = (cPage - 1) * lenPS;//각 페이지의 시작 지점
					
//VO set
miVO.setId(id);
miVO.setStartPS(startPS);
miVO.setLenPS(lenPS);
				
List<MyInfoVO> list=null;
try{
	list=miDAO.selectMyReserList(miVO);
}catch(SQLException se){
	list=new ArrayList<MyInfoVO>();
	se.printStackTrace();
}//end catch

//페이지 블럭
int pageLength=5;//페이지 블록 길이 1~5페이지

int currentBlock=cPage % pageLength == 0 ? cPage / pageLength : (cPage / pageLength) +1;//현재 페이지가 어디 블럭에 속해있는지 알려줌.
int startPage = (currentBlock - 1) * pageLength + 1;
int endPage = startPage + pageLength - 1;
//마지막 페이지 묶음에서 총 페이지 수를 넘어가면 끝 페이즈를 마지막 페이지 숫자로 지정
if(endPage > totalPages) {
	endPage = totalPages;
}//end if

JSONObject jsonObj=new JSONObject();
jsonObj.put("startPage", startPage);
jsonObj.put("endPage", endPage);
jsonObj.put("totalPages", totalPages);
jsonObj.put("isEmpty", list.isEmpty());

JSONArray jsonArr=new JSONArray();
JSONObject jsonTemp=null;

String reserInfo="";//reserFlag에 따른 예약 상태 저장
String strDate="";//Date형을 문자형으로 변환 값 저장
for(MyInfoVO tempVO : list){//예외가 발생했거나 조회결과가 없을 경우
	jsonTemp=new JSONObject();
	strDate=new SimpleDateFormat("yyyy-MM-dd").format(tempVO.getReserRegist());

	jsonTemp.put("reserNum", tempVO.getReserNum());
	jsonTemp.put("reserDate", tempVO.getReserDate());
	jsonTemp.put("reserRegist", strDate);
	jsonTemp.put("tourName", tempVO.getTourName());
	jsonTemp.put("adultFee", tempVO.getAdultFee());
	jsonTemp.put("otherFee", tempVO.getOtherFee());
	jsonTemp.put("adultCnt", tempVO.getAdultCnt());
	jsonTemp.put("otherCnt", tempVO.getOtherCnt());
	
	switch(tempVO.getReserFlag()) {//reserFlag에 따른 정보 값 set
		case 1: reserInfo="예약대기"; break;
		case 2: reserInfo="예약확정"; break;
		case 3: reserInfo="취소요청"; break;
		case 4: reserInfo="취소확정"; break;
		default:reserInfo="예약대기";
	}//end switch
	
	jsonTemp.put("reserInfo", reserInfo);
	jsonArr.add(jsonTemp);
}//end for

jsonObj.put("list", jsonArr);

out.print(jsonObj.toJSONString());

%>
