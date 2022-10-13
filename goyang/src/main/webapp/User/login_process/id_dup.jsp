<%@page import="kr.co.goyang.user.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="아이디 중복확인" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.132/jsp_prj/common/css/main_v1_220901.css"/>
<style type="text/css">
#dupWrap{ margin: 0px auto; width: 502px; height: 303px; position: relative;}
#dup{ width: 502px; height: 303px; background: #FFF url('http://211.63.89.132/goyang/User/login_process/images/id_background.png')  no-repeat;}
#frm{ position: absolute;top:100px; left:60px; }
#view{position: absolute;top:200px; left:60px;  }
</style>
<!-- jQuery google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <!-- Bootstrap JS -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		chkNull();
	});//click
	
	$("#id").keydown(function( evt ){
		if(evt.which == 13){
			chkNull();
		}//end if
	});//keydown
	
});//ready
function chkNull(){
	var id=$("#id").val();
	if(id == ""){
		alert("중복 검사할 아이디를 입력해 주세요.");
		return;
	}//end if
	$("#frmDup").submit();
}//chkNull

function useId( id ){
	opener.window.document.userInfo.id.value=id;
	self.close();
}//useId
</script>

</head>
<body>
<div id="dupWrap">
<div id="dup">
<div id="frm">
<form action="id_dup.jsp" method="get" id="frmDup">
<label>아이디</label> 
<input type="text" name="id" id="id" class="inputbox"/> 
<input type="text" style="display: none;"/> 
<input type="button" value="중복확인"  class="inputbox" id="btn" style="width:100px;"/><br>
<div></div>
<!-- 웹 브라우저에서 키 입력을 받는 HTML Form Control이 하나만 존재할 때
 HTML Form Control에서 enter가 눌려지면 submit이된다. 
 해결방법 => 키입력을 받을 수 있는 Form Control을 만들고  숨긴다. 
     웹 브라우저는 키 입력을 받을 수 있는 Form Control이 여러개 라고 착각을 하여
       submit 을 수행하지 않는다.  -->
</form>
</div>
<c:if test="${ not empty param.id  }">
<%
//DBMS 연동
UserDAO dao=UserDAO.getInstance();

boolean flag=dao.selectIdChk(request.getParameter("id"));
pageContext.setAttribute("flag",flag);//true면 사용중, false 미사용
%>
<div id="view">입력하신 <strong><c:out value="${ param.id }"/></strong>는
<c:choose>
<c:when test="${ flag }">
<span style="color: #FF0000">사용 중</span> 입니다.
</c:when>
<c:otherwise>
<span style="color: #0000FF">사용 가능</span> 합니다.<br/>
<a href="#void" onclick="useId('${ param.id }')">사용</a>
</c:otherwise>
</c:choose>
</div>
</c:if>

</div>
</div>
</body>
</html>