<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch5.ldbjf.Servlet.MemberControllerServlet" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
						"http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>jqueryIdCheck</title>
	</head>
	<body>
<%
	
		String lid = request.getParameter("lid");
		System.out.println(" jqueryIdCheck : lid >>> " + lid);
		
		MemberControllerServlet mcs = new MemberControllerServlet();
		
		
		boolean bool = mcs.checkId(lid);
		System.out.println("bool >>> " + bool);

%>
	<?xml version='1.0' encoding='UTF-8'?>
	<login>
		<result><%=bool%></result>
	</login>
	</body>
	
	
	
	