<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>	
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MVC 로그인창</title>
		
	  <script type="text/javascript" 
      	      src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
      <script type="text/javascript">
      
      $(document).ready(function(){
    	  alert("로그인테스트");
    	  
    	  $("#send").click(function(){
    		  
    		  alert("로그인하는중");
    		  
    		  var idVal = $("#lid").val();
    		  var pwVal = $("#lpw").val();
    		  
    		  if(!idVal){
    			  alert("id를 입력하세요");
    			  return false;
    		  }
    		  
    		  if(!pwVal){
    			  alert("pw를 입력하세요");
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
					로그인
					</td>
				</tr>
				<tr>
					<td align = "center" >아이디</td>
					<td><input type="text" name="lid" id="lid"></td>
				</tr>
				<tr>
					<td align = "center">비밀번호</td>
					<td><input type="password" name="lpw" id="lpw"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="hidden" name="ISUD" id="ISUD">
					<input type="button" name="send" id="send" value="보내기">
					<input type="reset" value="다시">
					</td>
				</tr>
			</table>	
		</form>
	</body>
</html>