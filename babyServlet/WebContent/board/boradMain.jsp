<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>boardMain</title>
	  	<script type="text/javascript" 
           		src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		
		<script type="text/javascript">
		
		$(document).ready(function(){
			
			
			alert("boardMain.jsp 진입");
		
			$('.js-sms-content').keyup(function(){//keyup은 키보드를 눌렀다가 뗄 때에 영향을 주는 함수다
				cut_300(this);
			});
			
            $("#I_board").click(function(){
            	
       			if(!document.getElementById("lsubject").value )
   				{
   					alert("[제목]을 적어주세요");
   					document.getElementById("lsubject").focus();
   					return;
   				}
       			
   				if( !document.getElementById("lname").value){
   					alert("[이름]을 적어주세요");
   					document.getElementById("lname").focus();
   					return;
   				}
   				
   				if( !document.getElementById("lpw").value){
   					alert("[비밀번호]을 적어주세요");
   					document.getElementById("lpw").focus();
   					return;
   				}
   				
   				if( !document.getElementById("lmemo").value){
   					alert("[내용]을 적어주세요");
   					document.getElementById("lmemo").focus();
   					return;
   				}
   				
            	
            	var ISUD = $("#ISUD").val('I');
                alert("글을 게시합니다");
                $("#boardWrite")
                .attr("action","../BoardControllerServlet")
                .submit();
             });
            
            $("#SS_board").click(function(){
            	var ISUD = $("#ISUD").val('SS');
                alert("(log)전체 조회");
                $("#boardWrite")
                .attr("action","../BoardControllerServlet")
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
		
	</head>
	<body>
		<form name="boardWrite" id="boardWrite" method="post"  enctype="multipart/form-data">
			<table border="1" align="center">
				<tr>
					<td colspan="2" align="center">M2_ISUD게시판 </td>
				</tr>
				<tr>
					<td align="center">글번호</td>
					<td><input type="text" name="lno" id="lno" size="20" disabled></td>
				</tr>
				<tr>
					<td align="center">제목</td>
					<td><input type="text" name="lsubject" id="lsubject" size="53"></td>
				</tr>
				<tr>
					<td align="center">이름</td>
					<td><input type="text" name="lname" id="lname" size="53"></td>
				</tr>
				<tr>
					<td align="center">글 비밀번호</td>
					<td><input type="text" name="lpw" id="lpw" size="20"></td>
				</tr>
				<tr>
					<td align="center">입력일</td>
					<td><input type="text" name="linsertdate" id="linsertdate" size="20" disabled></td>
				</tr>
				<tr>
					<td align="center">수정일</td>
					<td><input type="text" name="lupdatedate" id="lupdatedate" size="20" disabled></td>
				</tr>
				<tr>
					<td colspan="3" align="center">
					<textarea name="lmemo" id="lmemo" rows="5" cols="55" class="js-sms-content"></textarea>
					<div class = "bytes-wrapper">
						<span class="bytes">0</span>bytes
					</div>
					</td>										
				</tr>
				<tr>
	               <td align="center">사진</td>
	               <td>&nbsp;<input type="file" name="lphoto" id="lphoto"></td>
                </tr>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" id="ISUD" name="ISUD">
						<input type="button" id="I_board" name="I_board" value="입력" >
						<input type="button" id="SS_board" name="SS_board" value="글목록" >
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>