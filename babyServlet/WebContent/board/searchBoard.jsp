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
		<title>상세 글 조회</title>
	</head>
<%
	
	Object obj = request.getAttribute("sList");
	System.out.println("allList 출력  들어옴");
	
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
            	 alert("(log)수정하기");
            	 
            	 $("#ISUD").val("U");
                 var ISUD = $("#ISUD").val();
                 
            	 var lpw = $('#lpw').val();
            	 
            	 if(!lpw){
            		 alert("lpw를 입력하세요");
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
                alert("리턴데이터 >>> : " + Data);
                $('#pwCheck').html("화면에 리턴 데이터 출력 : " + Data);
				
                alert("pwCheck");
                
                var dataCheck = $(Data).find("result").text();
                var resultVar = eval(dataCheck);
                
                console.log("resultVar >>> " + resultVar);
                if(!resultVar){
                	alert("비밀번호를 확인해주세요");
                	$("#ISUD").val("");
                	$('#lpw').focus();
                	
                }else{
                	alert("확인 완료");
                	
                	 $("#boardSearch")
                     .attr("action","./BoardControllerServlet")
                     .submit();
                	 
                	}
                }
            	
         
            
            function whenError(Data){
            	alert("에러가 발생했습니다");
            	
            }
            
            $("#D_board").click(function(){
            	
           	 alert("(log)삭제하기");
        	 
        	 $("#ISUD").val("D");
             var ISUD = $("#ISUD").val();
             
        	 var lpw = $('#lpw').val();
        	 
        	 if(!lpw){
        		 alert("lpw를 입력하세요");
        		 $('#lpw').focus();
        		 
        		 return false;
        		 
        	 }else{
					
        		 callAjax();}	
        	 
             });
			
            $("#SS_board").click(function(){
            	var ISUD = $("#ISUD").val('SS');
                alert("(log)전체 조회");
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
					<td colspan="2" align="center"><h3>상세 글 조회 </h3></td>
				</tr>
				<tr>
					<td align="center" width="150"><b>글번호</b></td>
					<td>&nbsp;&nbsp;<%=lno%></td>
				</tr>
				<tr>
					<td align="center"><b>제목</b></td>
					<td>&nbsp;&nbsp;<%=lsubject%></td>
				</tr>
				<tr>
					<td align="center"><b>이름</b></td>
					<td>&nbsp;&nbsp;<%=lname%></td>
				</tr>
				<tr>
					<td align="center"><b>비밀번호</b></td>
					<td>&nbsp;&nbsp;<input type="password" name="lpw" id="lpw" size="20"></td>
				</tr>

				<tr>
					<td align="center" valign="top" height="300"><b>내용</b></td>
					<td valign="top">&nbsp;&nbsp;<%=lmemo%></td>
					
				</tr>
				<tr>
	               <td align="center"><b>사진</b></td>
					<td>&nbsp;&nbsp;<img src="../<%=lphoto%>" style="max-width:90%;"></td>
                </tr>
                <tr>
					<td align="center" colspan="2"><b>입력일</b> : <%=linsertdate%>
							    <b>수정일</b> : <%=lupdatedate%></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" id="ISUD" name="ISUD">
						<input type="hidden" id="lno" name="lno" value=<%=lno%>>
						<input type="button" id="U_board" name="U_board" value="수정/삭제">
						<input type="button" id="SS_board" name="SS_board" value="글목록">
					</td>
				</tr>
			</table>
		</form>
	
	</body>
</html>