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
			
			
			alert("boardMain.jsp ����");
		
			$('.js-sms-content').keyup(function(){//keyup�� Ű���带 �����ٰ� �� ���� ������ �ִ� �Լ���
				cut_300(this);
			});
			
            $("#I_board").click(function(){
            	
       			if(!document.getElementById("lsubject").value )
   				{
   					alert("[����]�� �����ּ���");
   					document.getElementById("lsubject").focus();
   					return;
   				}
       			
   				if( !document.getElementById("lname").value){
   					alert("[�̸�]�� �����ּ���");
   					document.getElementById("lname").focus();
   					return;
   				}
   				
   				if( !document.getElementById("lpw").value){
   					alert("[��й�ȣ]�� �����ּ���");
   					document.getElementById("lpw").focus();
   					return;
   				}
   				
   				if( !document.getElementById("lmemo").value){
   					alert("[����]�� �����ּ���");
   					document.getElementById("lmemo").focus();
   					return;
   				}
   				
            	
            	var ISUD = $("#ISUD").val('I');
                alert("���� �Խ��մϴ�");
                $("#boardWrite")
                .attr("action","../BoardControllerServlet")
                .submit();
             });
            
            $("#SS_board").click(function(){
            	var ISUD = $("#ISUD").val('SS');
                alert("(log)��ü ��ȸ");
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
					<td colspan="2" align="center">M2_ISUD�Խ��� </td>
				</tr>
				<tr>
					<td align="center">�۹�ȣ</td>
					<td><input type="text" name="lno" id="lno" size="20" disabled></td>
				</tr>
				<tr>
					<td align="center">����</td>
					<td><input type="text" name="lsubject" id="lsubject" size="53"></td>
				</tr>
				<tr>
					<td align="center">�̸�</td>
					<td><input type="text" name="lname" id="lname" size="53"></td>
				</tr>
				<tr>
					<td align="center">�� ��й�ȣ</td>
					<td><input type="text" name="lpw" id="lpw" size="20"></td>
				</tr>
				<tr>
					<td align="center">�Է���</td>
					<td><input type="text" name="linsertdate" id="linsertdate" size="20" disabled></td>
				</tr>
				<tr>
					<td align="center">������</td>
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
	               <td align="center">����</td>
	               <td>&nbsp;<input type="file" name="lphoto" id="lphoto"></td>
                </tr>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" id="ISUD" name="ISUD">
						<input type="button" id="I_board" name="I_board" value="�Է�" >
						<input type="button" id="SS_board" name="SS_board" value="�۸��" >
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="���">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>