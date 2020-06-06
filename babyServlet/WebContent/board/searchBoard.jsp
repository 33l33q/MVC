<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="bitcamp.java142.board.dao.LdbBoardDAO" %>
<%@ page import ="bitcamp.java142.board.dao.LdbBoardDAOImpl" %>
<%@ page import ="bitcamp.java142.board.vo.LdbBoardVO" %>
<%@ page import ="bitcamp.java142.board.Servlet.BoardControllerServlet" %>
<%@ page import ="bitcamp.java142.common.utils.FilePath" %>

<%@ page import ="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�� �� ��ȸ</title>
	</head>
<%
	
	Object obj = request.getAttribute("sList");
	System.out.println("allList ���  ����");
	
	ArrayList<String> sList = (ArrayList<String>) obj;
	
	LdbBoardVO lbvo = new LdbBoardVO();
	
	String lno = sList.get(0);
	String lsubject = sList.get(1);
	String lname = sList.get(2);
	String lpw = sList.get(3);
	String lmemo = sList.get(4);
	String lphoto = sList.get(5);
	String linsertdate = sList.get(7);
	String lupdatedate = sList.get(8);
	
	System.out.println("lsubject >>> : " + lsubject);

%>
	  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">

		$(document).ready(function(){
			
            $("#U_board").click(function(){
            	 alert("(log)�����ϱ�");
            	 
            	 $("#ISUD").val("U");
                 var ISUD = $("#ISUD").val();
                 
            	 var lpw = $('#lpw').val();
            	 
            	 if(!lpw){
            		 alert("lpw�� �Է��ϼ���");
            		 $('#lpw').focus();
            		 
            		 return false;
            		 
            	 }else{
  					
            		 callAjax();}	            	
             });
            
            
            function callAjax(){
            	alert("callAjax");
            	$.ajax({
            		type : "post",
            		url : "./board/pwCheck.jsp",
	            	data : {
	            		lpw : $("#lpw").val(),
	            	},
	            	success : whenSuccess,
	            	error : whenError   
            	});
            }
            
            function whenSuccess(Data){
                alert("���ϵ����� >>> : " + Data);
                $('#pwCheck').html("ȭ�鿡 ���� ������ ��� : " + Data);
				
                alert("pwCheck");
                
                var dataCheck = $(Data).find("result").text();
                var resultVar = eval(dataCheck);
                
                console.log("resultVar >>> " + resultVar);
                if(!resultVar){
                	alert("��й�ȣ�� Ȯ�����ּ���");
                	$("#ISUD").val("");
                	$('#lpw').focus();
                	
                }else{
                	alert("Ȯ�� �Ϸ�");
                	
                	 $("#boardSearch")
                     .attr("action","./BoardControllerServlet")
                     .submit();
                	 
                	}
                }
            	
         
            
            function whenError(Data){
            	alert("������ �߻��߽��ϴ�");
            	
            }
            
            $("#D_board").click(function(){
            	
           	 alert("(log)�����ϱ�");
        	 
        	 $("#ISUD").val("D");
             var ISUD = $("#ISUD").val();
             
        	 var lpw = $('#lpw').val();
        	 
        	 if(!lpw){
        		 alert("lpw�� �Է��ϼ���");
        		 $('#lpw').focus();
        		 
        		 return false;
        		 
        	 }else{
					
        		 callAjax();}	
        	 
             });
			
            $("#SS_board").click(function(){
            	var ISUD = $("#ISUD").val('SS');
                alert("(log)��ü ��ȸ");
                $("#boardSearch")
                .attr("action","./BoardControllerServlet")
                .submit();
             });
            
		});
		
		</script>
	<body>
		<form name="boardSearch" id="boardSearch" method="post" enctype="application/x-www-form-urlencoded">
			<table border="1" align="center"  width="800">
				<tr>
					<td colspan="2" align="center"><h3>�� �� ��ȸ </h3></td>
				</tr>
				<tr>
					<td align="center" width="150"><b>�۹�ȣ</b></td>
					<td>&nbsp;&nbsp;<%=lno%></td>
				</tr>
				<tr>
					<td align="center"><b>����</b></td>
					<td>&nbsp;&nbsp;<%=lsubject%></td>
				</tr>
				<tr>
					<td align="center"><b>�̸�</b></td>
					<td>&nbsp;&nbsp;<%=lname%></td>
				</tr>
				<tr>
					<td align="center"><b>��й�ȣ</b></td>
					<td>&nbsp;&nbsp;<input type="password" name="lpw" id="lpw" size="20"></td>
				</tr>

				<tr>
					<td align="center" valign="top" height="300"><b>����</b></td>
					<td valign="top">&nbsp;&nbsp;<%=lmemo%></td>
					
				</tr>
				<tr>
	               <td align="center"><b>����</b></td>
					<td>&nbsp;&nbsp;<img src="../<%=lphoto%>" style="max-width:90%;"></td>
                </tr>
                <tr>
					<td align="center" colspan="2"><b>�Է���</b> : <%=linsertdate%>
							    <b>������</b> : <%=lupdatedate%></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" id="ISUD" name="ISUD">
						<input type="hidden" id="lno" name="lno" value=<%=lno%>>
						<input type="button" id="U_board" name="U_board" value="����/����">
						<input type="button" id="SS_board" name="SS_board" value="�۸��">
					</td>
				</tr>
			</table>
		</form>
	
	</body>
</html>