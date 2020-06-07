<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import =  "bitcamp.java142.ch5.ldbjf.vo.LdbMemberVO" %>
<%@ page import = "bitcamp.java142.ch5.ldbjf.Servlet.MemberControllerServlet" %>
<%@ page import = "bitcamp.java142.common.utils.FilePath" %>


<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>모든회원조회</title>
		
      <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
      <script type="text/javascript">
      
      $(document).ready(function(){
    	  
          $("#moveLogin").click(function(){
          	alert("(log)로그인창 이동하기");
              $("#selectForm")
              .attr("action","./login/login.jsp")
              .submit();
           });
          
          $("#moveJoin").click(function(){
          	alert("(log)회원가입 이동하기");
              $("#selectForm")
              .attr("action","./login/member.jsp")
              .submit();
           });
          $("#moveIndex").click(function(){
          	alert("(log)홈페이지 이동하기");
              $("#selectForm")
              .attr("action","./login/index.jsp")
              .submit();
           });
    	  
    	  
      });
      
      </script>
	</head>
	<body>
		<form name="selectForm" id="selectForm" method="POST" enctype="multipart/form-data">
			<table align="center" border ="1">
				<tr>
					<td colspan ="15" align = "center"><h3>회원정보</h3></td>
				</tr>
				<tr>
					<td align = "center"><b>회원번호</b></td>
					<td align = "center"><b>이름</b></td>
					<td align = "center"><b>아이디</b></td>
					<td align = "center"><b>전화번호</b></td>
					<td align = "center"><b>이메일</b></td>
					<td align = "center"><b>생년월일</b></td>
					<td align = "center"><b>우편번호</b></td>
					<td align = "center"><b>주소</b></td>
					<td align = "center"><b>사진</b></td>
				</tr>
	<%
	
		
		ArrayList<LdbMemberVO> aList = (ArrayList<LdbMemberVO>)request.getAttribute("aList");
		
		for ( int i = 0 ; i < aList.size() ; i++){
			LdbMemberVO lvo = aList.get(i);
	%>
			<tr>
				<td><%=lvo.getLmem()%></td>
				<td><%=lvo.getLname()%></td>
				<td><%=lvo.getLid()%></td>
				<td><%=lvo.getLhp()%></td>
				<td><%=lvo.getLbirth()%></td>
				<td><%=lvo.getLemail()%></td>
				<td align="center"><%=lvo.getLpostno()%></td>
				<td><%=lvo.getLloadAddr() %> <%=lvo.getLaddr() %></td>
				<td><img src="<%=lvo.getLphoto()%>" border=0 width="30" height="40"></td>
		
			</tr>
		
<%
				}
%>
				<tr>
					<td colspan="16" align="center">
					<input type="button" value="로그인창" id="moveLogin" name="moveLogin">
					<input type="button" value="홈페이지" id="moveIndex" name="moveIndex">
					<input type="button" value="회원가입" id="moveJoin" name="moveJoin">
				</tr>
			</table>
		</form>
	</body>
</html>