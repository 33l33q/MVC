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
		<title>���ȸ����ȸ</title>
	</head>
	<body>
		<table border ="1">
			<tr>
				<td colspan ="16" align = "center"><h3>ȸ������</h3></td>
			</tr>
			<tr>
				<td>ȸ����ȣ</td>
				<td>�̸�</td>
				<td>���̵�</td>
				<td>��й�ȣ</td>
				<td>��ȭ��ȣ</td>
				<td>�̸���</td>
				<td>�������</td>
				<td>�����ȣ</td>
				<td>�ּ�</td>
				<td>����</td>
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
			<td><%=lvo.getLpw()%></td>
			<td><%=lvo.getLhp()%></td>
			<td><%=lvo.getLbirth()%></td>
			<td><%=lvo.getLemail()%></td>
			<td><%=lvo.getLpostno()%></td>
			<td><%=lvo.getLjuso() %>
			<% System.out.println(lvo.getLphoto()); %>
			<td><img src="<%=lvo.getLphoto()%>" border=0 width="30" height="40"></td>

	</tr>

<%
		}
%>
	</body>
</html>