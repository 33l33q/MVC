<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import =  "bitcamp.java142.ch5.ldbjf.dao.LdbMemberDAO" %>
<%@ page import =  "bitcamp.java142.ch5.ldbjf.dao.LdbMemberDAOImpl" %>
<%@ page import =  "bitcamp.java142.ch5.ldbjf.vo.LdbMemberVO" %>
<%@ page import = "bitcamp.java142.ch5.ldbjf.Servlet.MemberControllerServlet" %>
<%@ page import = "bitcamp.java142.common.utils.FilePath" %>


<%@ page import = "java.util.ArrayList" %>


    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>index</title>
	</head>	
	<body>
	
		
	  <script type="text/javascript" 
      	      src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
      <script type="text/javascript">
      
      $(document).ready(function(){
    		$("#D_member").click(function(){
      			$("#ISUD").val("D");
      			var ISUD = $("#ISUD").val();
				alert("ȸ��Ż��");
				
      			$("#updateForm")
      			.attr("action","../BoardControllerServlet")
      			.submit();
    		});
    		
            $("#return").click(function(){
    	      	
               	alert("�α��� Ȯ���������� ���ư��ϴ�");  
        
               	
	      		var ISUD = $("#ISUD").val("L");
	    		$("#updateForm")
	    		.attr("action","./BoardControllerServlet")
	    		.submit();
               	
            });
      });
      </script>
      
<%

	Object obj = request.getAttribute("sList");//������Ʈ�� �޾ƿ�

	
	ArrayList<String> sList = (ArrayList<String>)obj;
	

		String lmem = sList.get(0);
		String lname = sList.get(1);
		String lid = sList.get(2);
		String lpw = sList.get(3);
		String lhp = sList.get(4);
		String lbirth = sList.get(5);
		String lemail = sList.get(6);
		String lpostno = sList.get(7);
		String ljuso = sList.get(8);
		String lphoto = sList.get(9);
		
		System.out.println(lname + lid + lpw + lhp + lbirth + lemail + lpostno + ljuso );

%>
		<form name="updateForm" id="updateForm" method="POST" enctype="multipart/form-data">
			<table border="1" align="center">
					<tr>
						<td colspan="2" align="center">ȸ������</td>
					</tr>
					<tr>
						<td>ȸ����ȣ</td>
						<td><%=lmem%></td>
					</tr>
					<tr>
						<td>�̸�</td>
						<td><%=lname%></td>
					</tr>
					<tr>
						<td>���̵�</td>
						<td><input type="text" name="lid" id="lid" size="20" value=<%=lid%> readonly></td>
					</tr>
					<tr>
						<td>��й�ȣ</td>
						<td><input type="password" name="lpw" id="lpw" size="20" value=<%=lpw%> readonly></td>
					</tr>
					<tr>
						<td>��ȭ��ȣ</td>
						<td><%=lhp%></td>
					</tr>
					<tr>
						<td>�������</td>
						<td><%=lbirth%></td>
					</tr>
					<tr>
						<td>�̸���</td>
						<td><%=lemail%></td>
					</tr>
					<tr>
						<td>�����ȣ</td>
						<td><%=lpostno%></td>
					</tr>
					<tr>
						<td>�ּ�</td>
						<td><%=ljuso%></td>
					</tr>
					<tr>
						<td>����</td>
						<td>
						<img src=<%=lphoto%> border=0 width="100" height="100"></td>
					</tr>
					</table>
					
<%

%>
				<center>
					<h2>Ż�� �Ͻðڽ��ϱ�?<h2/>
				
					  <input type="button" value="Ż��" id="D_member" name="D_member">
					  <input type="button" value="���ư���" id="return" name="return">
	                  <input type="hidden" id="ISUD" name="ISUD">
	                  </center>
				
		</form>
	</body>
</html>