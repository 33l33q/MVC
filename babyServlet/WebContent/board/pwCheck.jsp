<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.board.Servlet.BoardControllerServlet" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>pwCheck</title>
	</head>
	<body>
<%
	String lpw = request.getParameter("lpw");
	System.out.println("aJax : lpw >>>  " + lpw );
	
	BoardControllerServlet bcs = new BoardControllerServlet();
	
	System.out.println("----------------------------------");
	boolean bool = bcs.checkPw(lpw);
	
	System.out.println("boo1 >>>> " + bool);

%>
	<?xml version='1.0' encoding='UTF-8'?>
	<login>
		<result><%=bool%></result>
	</pw>
	</login>
	</body>
</html>

<!-- 

${null} =
${n} = ${empty null} = true

${empty n} = true

${param.user} =

${empty param.user } = true

쿼리스트링으로 user에 값을 준 경우
${null} =
${n} = ${empty null} = true

${empty n} = true

${param.user} = 1

${empty param.user } = false


 -->