<%@page import="kr.co.goyang.user.vo.MyInfoVO"%>
<%@page import="kr.co.goyang.user.dao.MyInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="아이디 중복확인"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="styesheet" type="text/css" href="http://211.63.89.139/html_prj/common/css/main_v1_220901.css"/>
<style type="text/css">
#dupWrap{ margin: 0px auto; width: 800px; height: 303px; position: relative;}
#dup{ width: 800px; height: 303px;}
#frm{ position: absolute; top:100px; left:60px}
#view{ position: absolute; top:200px; left:60px;}
</style>

<!-- JQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<jsp:useBean id="miVO" class="kr.co.goyang.user.vo.MyInfoVO" scope="page" />
<jsp:setProperty name="miVO" property="*"/>

<script type="text/javascript">

</script>
</head>
<body>
<div id="dubWrap">
<%
//DBMS 연동
MyInfoDAO miDAO=MyInfoDAO.getInstance();

miVO.setId("user");
miVO.setReserNum(40);


MyInfoVO reserInfo=miDAO.selectReserDetail(miVO);
int[] resSeatNum=miDAO.selectResSeatNum(miVO.getReserNum());

pageContext.setAttribute("reserInfo", reserInfo);
pageContext.setAttribute("resSeatNum", resSeatNum);
%>
<div style="width: 800px">
			<table class="member" style="width: 100%">
				<tr>
					<th>예약자명</th>
					<td>${ reserInfo.name }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${ reserInfo.email }</td>
				</tr>
				<tr>
					<th>휴대폰 번호</th>
					<td>${ reserInfo.phone }</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>${ reserInfo.reserDate }</td>
				</tr>
				<tr>
					<th>투어코스</th>
					<td>${ reserInfo.tourName }</td>
				</tr>
				<tr>
					<th>인원수 </th>
					<td>
						성인(${ reserInfo.adultFee }원) : ${ reserInfo.adultCnt }명, 
						기타(${ reserInfo.otherFee }) : ${ reserInfo.otherCnt }명
					</td>
				</tr>
				<tr>
					<th>예약 좌석번호</th>
					<td>
						<c:forEach var="seatNum" items="resSeatNum">
							<c:out value="${ seatNum }"/>
						</c:forEach>
					</td>
					
				</tr>
				<tr>
					<th>취소 사유</th>
					<td>${ reserInfo.cancel.reas }</td>
				</tr>
			</table>
</div>

</div>
</body>
</html>