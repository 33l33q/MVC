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
		<title>�α��� ����</title>
	      <script type="text/javascript" 
	            src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	      <script type="text/javascript">
	      	$(document).ready(function(){
	      		
	      		alert("�α��� ����!");
	      		
	      		
	      		
	      		$("#U").click(function(){
	      			
	            	$("#ISUD").val('U');
	            	var ISUD = $("#ISUD").val();
	                alert("ȸ������ ����");
	                
	                $("#loginOK")
	                .attr("action","./MemberControllerServlet")
	                .submit();
	      		});
	      		
	      		$("#D").click(function(){
	      			$("#ISUD").val("D");
	      			var ISUD = $("#ISUD").val();
					alert("ȸ��Ż��");
	      			
					$("#loginOK")
	      			.attr("action","./MemberControllerServlet")
	      			.submit();
	      		
	      		});
	      		
	      		$("#B").click(function(){
	      			
	            	$("#ISUD").val('SS');
	            	var ISUD = $("#ISUD").val();
	                alert("�Խ���");
	                
	                $("#loginOK")
	                .attr("action","./BoardControllerServlet")
	                .submit();
	      		});
	      		
	      		$("#L").click(function(){
	      			
	            	$("#ISUD").val('L');
	            	$("#lid").val("");
	            	$("#lpw").val("");
	            	
	            	
	                alert("�α׾ƿ�");
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
				<tr><td><h3>�α��ο� �����ϼ̽��ϴ�</h3></td></tr>
				<tr><td>������� <%=lid %> ��
					<input type="hidden" id="lid" name="lid" value=<%=lid%>>
					<input type="hidden" id="lpw" name="lpw" value=<%=lpw%>></td>
				</tr>
				
				<tr>
					<td align="center"><input type="hidden" id="ISUD" name="ISUD" >
						<input type="button" id="U" name="U" value="�������� ����">
						<input type="button" id="D" name="D" value="ȸ��Ż��">
						<input type="button" id="B" name="B" value="�Խ���">
						<input type="button" id="L" name="L" value="�α׾ƿ�">
					</td>
				</tr>
			</table>
		</form>
	
	</body>
</html>