<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import =  "bitcamp.java142.ch5.ldbjf.dao.LdbMemberDAO" %>
<%@ page import =  "bitcamp.java142.ch5.ldbjf.dao.LdbMemberDAOImpl" %>
<%@ page import =  "bitcamp.java142.ch5.ldbjf.vo.LdbMemberVO" %>
<%@ page import = "bitcamp.java142.ch5.ldbjf.Servlet.MemberControllerServlet" %>
<%@ page import = "bitcamp.java142.common.utils.FilePath" %>


<%@ page import = "java.util.ArrayList" %>

<%
//	String lid = request.getParameter("lid");
//	String lpw = request.getParameter("lpw");

	String lid = (String)request.getAttribute("lid");
	String lpw = (String)request.getAttribute("lpw");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>로그인 성공</title>
	      <script type="text/javascript" 
	            src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	      <script type="text/javascript">
	      	$(document).ready(function(){
	      		
	      		alert("로그인 성공!");
	      		
	      		
	      		
	      		$("#U").click(function(){
	      			
	            	$("#ISUD").val('U');
	            	var ISUD = $("#ISUD").val();
	                alert("회원정보 수정");
	                
	                $("#loginOK")
	                .attr("action","./MemberControllerServlet")
	                .submit();
	      		});
	      		
	      		$("#D").click(function(){
	      			$("#ISUD").val("D");
	      			var ISUD = $("#ISUD").val();
					alert("회원탈퇴");
	      			
					$("#loginOK")
	      			.attr("action","./MemberControllerServlet")
	      			.submit();
	      		
	      		});
	      		
	      		$("#B").click(function(){
	      			
	            	$("#ISUD").val('SS');
	            	var ISUD = $("#ISUD").val();
	                alert("게시판");
	                
	                $("#loginOK")
	                .attr("action","./BoardControllerServlet")
	                .submit();
	      		});
	      		
	      		$("#L").click(function(){
	      			
	            	$("#ISUD").val('L');
	            	$("#lid").val("");
	            	$("#lpw").val("");
	            	
	            	
	                alert("로그아웃");
	                $("#loginOK")
	                .attr("action","./MemberControllerServlet")
	                .submit();
	      		});
	      	});
	      
	      
	      </script>
	</head>
	<body>
		<form name="loginOK" id="loginOK" method="post" enctype="application/x-www-form-urlencoded">
			<table align="center">
				<tr><td><h3>로그인에 성공하셨습니당</h3></td></tr>
				<tr><td>어서오세요 <%=lid %> 님
					<input type="hidden" id="lid" name="lid" value=<%=lid%>>
					<input type="hidden" id="lpw" name="lpw" value=<%=lpw%>></td>
				</tr>
				
				<tr>
					<td align="center"><input type="hidden" id="ISUD" name="ISUD" >
						<input type="button" id="U" name="U" value="개인정보 수정">
						<input type="button" id="D" name="D" value="회원탈퇴">
						<input type="button" id="B" name="B" value="게시판">
						<input type="button" id="L" name="L" value="로그아웃">
					</td>
				</tr>
			</table>
		</form>
	
	</body>
</html>