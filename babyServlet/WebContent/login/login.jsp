<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>	
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MVC �α���â</title>
		
	  <script type="text/javascript" 
      	      src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
      <script type="text/javascript">
      
      $(document).ready(function(){
    	  alert("�α����׽�Ʈ");
    	  
    	  $("#send").click(function(){
    		  
    		  alert("�α����ϴ���");
    		  
    		  var idVal = $("#lid").val();
    		  var pwVal = $("#lpw").val();
    		  
    		  if(!idVal){
    			  alert("id�� �Է��ϼ���");
    			  return false;
    		  }
    		  
    		  if(!pwVal){
    			  alert("pw�� �Է��ϼ���");
    			  return false;
    		  }
    		
    		  var ISUD = $("#ISUD").val("L");
    		  $("#loginForm")
    		  .attr("action","../MemberControllerServlet")
    		  .submit();
    		  
    	  });
    	  

      });
      
      </script>
		
	</head>
	<body>
		<form name="loginForm" id="loginForm" method="POST" >
			<table border="1" align="center">
				<tr>
					<td colspan="2" align="center">
					�α���
					</td>
				</tr>
				<tr>
					<td align = "center" >���̵�</td>
					<td><input type="text" name="lid" id="lid"></td>
				</tr>
				<tr>
					<td align = "center">��й�ȣ</td>
					<td><input type="password" name="lpw" id="lpw"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="hidden" name="ISUD" id="ISUD">
					<input type="button" name="send" id="send" value="������">
					<input type="reset" value="�ٽ�">
					</td>
				</tr>
			</table>	
		</form>
	</body>
</html>