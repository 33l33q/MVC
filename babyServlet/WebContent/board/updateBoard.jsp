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
		<title>�����ϱ�</title>
	</head>
	
     <script type="text/javascript" 
           src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
     <script type="text/javascript">
     
	$(document).ready(function(){
	     
		$('.js-sms-content').keyup(function(){//keyup�� Ű���带 �����ٰ� �� ���� ������ �ִ� �Լ���
			cut_300(this);
		});
		
		$("#SS_board").click(function(){
			$("#ISUD").val('SS');
	      	var ISUD = $("#ISUD").val();
	          alert("(log)��ü ��ȸ");
	          $("#boardUpdate")
	          .attr("action","./BoardControllerServlet")
	          .submit();
	      });
	    
		$("#D_board").click(function(){
			
			alert("(log)���� �����մϴ�");
			
			$("#ISUD").val('D');
	      	var ISUD = $("#ISUD").val();
	          
	          $("#boardUpdate")
	          .attr("action","./BoardControllerServlet")
	          .submit();
	      });
		
		$("#U_board").click(function(){
			alert("(log)���� �����մϴ�");
			$("#ISUD").val('U');
	      	var ISUD = $("#ISUD").val();
	          
	          $("#boardUpdate")
	          .attr("action","./BoardControllerServlet")
	          .submit();
	      });
		
		function getTextLength(str){
			var len = 0;
			for (var i=0; i<str.length; i++){
				if(escape(str.charAt(i)).length == 6){
					len++;
				}
				len++;
			}
			return len;
		}
		
		function cut_300(obj){
			var text = $(obj).val();
			var leng = text.length;
			while(getTextLength(text) > 300){
				leng--;
				text = text.substring(0, leng);
			}
			$(obj).val(text);
			$('.bytes').text(getTextLength(text));
		}

		
	});
     
     	
     
     
     </script>
     
	<body>
<%
	System.out.println("update Board ����!");
	
	Object obj = request.getAttribute("sList");
	
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
	


%>
		<form name="boardUpdate" id="boardUpdate" method="post"  enctype="multipart/form-data">
			<table border="1" align="center" height="300">
				<tr>
					<td colspan="2" align="center"><h3>�� �����ϱ�</h3></td>
				</tr>
				<tr>
					<td align="center" >�۹�ȣ</td>
					<td><input type="text" name="lno" id="lno" size="20"  value="<%=lno%>" readonly></td>
				</tr>
				<tr>
					<td align="center">����</td>
					<td><input type="text" name="lsubject" id="lsubject" size="53" value="<%=lsubject%>"></td>
				</tr>
				<tr>
					<td align="center">�̸�</td>
					<td><input type="text" name="lname" id="lname" size="53" value="<%=lname%>" readonly></td>
				</tr>
				<tr>
					<td align="center">�� ��й�ȣ</td>
					<td><input type="password" name="lpw" id="lpw" size="20" value="<%=lpw %>" readonly></td>
				</tr>
				<tr>
					<td align="center">�Է���</td>
					<td><input type="text" name="linsertdate" id="linsertdate" size="20" value="<%=linsertdate%>" readonly></td>
				</tr>
				<tr>
					<td align="center">������</td>
					<td><input type="text" name="lupdatedate" id="lupdatedate" size="20" value="<%=lupdatedate%>" readonly></td>
				</tr>
				<tr>
					<td colspan="3" align="center">
					<textarea name="lmemo" id="lmemo" rows="16" cols="100" class="js-sms-content"><%=lmemo%></textarea>
					<div class = "bytes-wrapper">
						<span class="bytes">0</span>bytes
					</div>
					</td>										
				</tr>
				<tr>
	               <td align="center">����</td>
	               <td><img src="<%=lphoto%>" width="10" height="10">
	               &nbsp;<input type="file" name="lphoto" id="lphoto" value="<%=lphoto %>"></td>
                </tr>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" id="ISUD" name="ISUD">
						<input type="button" id="U_board" name="U_board" value="����" >
						<input type="button" id="D_board" name="D_board" value="����" >
						<input type="button" id="SS_board" name="SS_board" value="�۸��" >
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="���">
					</td>
				</tr>
			</table>
		</form>

	</body>
</html>