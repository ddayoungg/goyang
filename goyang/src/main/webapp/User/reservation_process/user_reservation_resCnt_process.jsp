<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.goyang.user.vo.TourReservaVO"%>
<%@page import="kr.co.goyang.user.dao.TourReservaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%
TourReservaDAO trDAO = TourReservaDAO.getInstance();

int[] seatNum=null; //예약한 좌석 번호
int resCnt=0; //예약 가능한 인원
TourReservaVO trVO=null;


String reserDate=request.getParameter("reserDate");
int tourNum=Integer.parseInt(request.getParameter("tourNum"));

if( reserDate != null){
	trVO=new TourReservaVO();
	trVO.setReserDate(reserDate);
	trVO.setTourNum(tourNum);
	
	seatNum=trDAO.selectSeatNum(trVO);
	
	resCnt=(28-seatNum.length);
	
	JSONObject jsonObj=new JSONObject();
	
	jsonObj.put("resCnt", resCnt);
	
	out.print(jsonObj.toJSONString());
}//end if

%>
