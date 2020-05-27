<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 입력 성공!</title>
</head>

	<script type="text/javascript" 
      		src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">

	$(document).ready(function(){
			     
		 $("#SS_board").click(function(){
			 
			$("#ISUD").val("SS");
            $("#boardWrite")
            .attr("action","./BoardControllerServlet")
            .submit();
            
		 });
  
	});

    </script>


             
<body>
<form name="boardWrite" id="boardWrite" method="post" enctype="multipart/form-data">
<input type="hidden" id="ISUD" name="ISUD">
<input type="button" id="SS_board" name="SS_board" value="글목록" >
</form>

</body>
</html>