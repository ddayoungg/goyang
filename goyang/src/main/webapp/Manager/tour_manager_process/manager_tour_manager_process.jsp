<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.goyang.manager.vo.TourManagerVO"%>
<%@page import="kr.co.goyang.manager.dao.TourManagerDAO"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%
TourManagerDAO tmDAO = TourManagerDAO.getInstance();
TourManagerVO tmVO=new TourManagerVO();


String listSearch=request.getParameter("listSearch");
String textSearch=request.getParameter("textSearch");

tmVO.setListSearch(listSearch);
tmVO.setTextSearch(textSearch);

List<TourManagerVO> list=null;
try{
	list=tmDAO.selectTourList(tmVO);
}catch(SQLException se){
	list=new ArrayList<TourManagerVO>();
	se.printStackTrace();
}//end catch

JSONObject jsonObj=new JSONObject();
jsonObj.put("dataSize", list.size());
jsonObj.put("isEmpty", list.isEmpty());
jsonObj.put("prdDate", new SimpleDateFormat("yyyy-MM-dd hh:mm").format(new Date()));

JSONArray jsonArr=new JSONArray();
JSONObject jsonTemp=null;

for(TourManagerVO tempVO : list){//예외가 발생했거나 조회결과가 없을 경우
	jsonTemp=new JSONObject();
	jsonTemp.put("tourNum", tempVO.getTourNum());
	jsonTemp.put("tourName", tempVO.getTourName());
	jsonTemp.put("adultFee", tempVO.getAdultFee());
	jsonTemp.put("otherFee", tempVO.getOtherFee());
	jsonArr.add(jsonTemp);
}//end for

jsonObj.put("list", jsonArr);

out.print(jsonObj.toJSONString());

%>
