<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
      <title>���� ȸ������</title>
      
	 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		    //�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
		    function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
		
		                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
		                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
		                var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
		                var extraRoadAddr = ''; // ���θ� ������ �ּ� ����
		
		                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
		                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
		                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		                // ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
		                if(fullRoadAddr !== ''){
		                    fullRoadAddr += extraRoadAddr;
		                }
		
		                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
		                document.getElementById('lpostno').value = data.zonecode; //5�ڸ� �������ȣ ���
		                document.getElementById('ljuso').value = fullRoadAddr;
		                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
		
		                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
		                if(data.autoRoadAddress) {
		                    //����Ǵ� ���θ� �ּҿ� ������ �ּҸ� �߰��Ѵ�.
		                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		                    document.getElementById('guide').innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';
		
		                } else if(data.autoJibunAddress) {
		                    var expJibunAddr = data.autoJibunAddress;
		                    document.getElementById('guide').innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';
		
		                } else {
		                    document.getElementById('guide').innerHTML = '';
		                }
		            }
		        }).open();
		    }
		</script>
						
      <script type="text/javascript" 
            src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
      <script type="text/javascript">
         
         $(document).ready(function(){
            
            alert("member.jsp ����");
   
            $("#lpwCheck").click(function(){
      
               alert("(log)��й�ȣ Ȯ�� �׽�Ʈ");
               var lpwVal = $('#lpw').val();
               var reVal =$('#reLpw').val();
               alert(lpwVal + " :  " + reVal);
               
               alert(lpwVal + " :  " + reVal);
               
               if(!lpwVal){
                  alert("��й�ȣ�� �Է��ϼ���");
                  $("#lpw").focus();
                  return false;
               }
               
               if(!reVal){
                  alert("��й�ȣ Ȯ���� �Է��ϼ���");
                  $('#reLpw').focus();
                  return false;
               }
               
               if(lpwVal == reVal ){
                  alert("��й�ȣ�� Ȯ�εƽ��ϴ�");
               }else{ 
                  alert("��й�ȣ�� �ٽ� Ȯ�����ּ���");
               }
            });//end of ��й�ȣ üũ
            
            $("#lidCheck").click(function(){
            	
            	alert("���̵� Ȯ�� �׽�Ʈ");
            	var lidVal = $("#lid").val();
            	
            	if(!lidVal){
            		alert("id�� �Է��ϼ���");
            		$('#lid').focus();
            	}
            	
            	callAjax()
            	
            });
            
            function callAjax(){
            	alert("callAjax");
            	$.ajax({
	            	type : "post",
	            	url : "./idCheck.jsp",
	            	data : {
	            		lid : $("#lid").val(),
	            	},
	            	success : whenSuccess,
	            	error : whenError            	
            	});
      
            }
            
            function whenSuccess(Data){
                alert("���ϵ����� >>> : " + Data);
                $('#studenttest').html("ȭ�鿡 ���� ������ ��� : " + Data);
				
                alert("studenttest");
                
                var dataCheck = $(Data).find("result").text();
                var resultVar = eval(dataCheck);
                
                console.log("resultVar >>> " + resultVar);
                if(!resultVar){
                	alert("���̵� ����� �� �����ϴ�.");
                	
                }else{
                	alert("���̵� ����� �� �ֽ��ϴ�.");
                	}
                }
                

            function whenError(){
                alert("�����߻�");
            }
            
    
            
            $("#I_member").click(function(){
            	$("#ISUD").val("I");
            	var ISUD = $("#ISUD").val();
            	alert(ISUD);
               	alert("(log)�����ϴ� ��");         
               	$("#memberForm")
               	.attr("action","../MemberControllerServlet")
               	.submit();
            });

            
            $("#S_member").click(function(){
            	$("#ISUD").val('S');
            	var ISUD = $("#ISUD").val();
            	alert("(log)��ü ��ȸ");
                $("#memberForm")
                .attr("action","../MemberControllerServlet")
                .submit();
             });

            
            $("#SS_member").click(function(){
            	var ISUD = $("#ISUD").val('SS');
                alert("(log)�˻��ϱ�");
                $("#memberForm")
                .attr("action","../MemberControllerServlet")
                .submit();
             });


            
            $("#U_member").click(function(){
            	var ISUD = $("#ISUD").val('U');
                alert("(log)������������");
                $("#memberForm")
                .attr("action","../MemberControllerServlet")
                .submit();
             });

         });
         
      </script>
   </head>
   <body>
      <form name="memberForm" id="memberForm" method="POST" enctype="multipart/form-data" >
         <table border="1" align="center">
             <tr>
               <td colspan="2" align="center">��������</td>
              </tr>
            <tr>
               <td width = "100" align = "center">ȸ����ȣ</td>
               <td width = "300">
				 &nbsp;<input type="text" name = "lmem" placeholder="* ����/ ����/ ��ȸ �� ȸ����ȣ ���" size="30"><br>
                  <!-- <font size = "2">* ����/ ����/ ��ȸ �� ȸ����ȣ ���</font>   -->
               </td>
            </tr>
            <tr>
               <td align="center">�̸�</td>
               <td>&nbsp;<input type="text" name ="lname" id="lname" size="30"></td>
            </tr>
            <tr>
               <td align="center">���̵�</td>
               <td>&nbsp;<input type="text" name="lid" id="lid" size="30">
                       <input type="button" id="lidCheck" value="�ߺ�üũ"></td>
            </tr>
            <tr>
               <td align="center">��й�ȣ</td>
               <td>&nbsp;<input type="password" name="lpw" id="lpw" size="30"></td>        
            </tr>
            <tr>
               <td align="center">��й�ȣȮ��</td>
               <td>&nbsp;<input type="password" name="reLpw" id="reLpw" size="30">
                       <input type="button" id="lpwCheck" value="��й�ȣȮ��"></td>
            </tr>
            <tr>
               <td align="center">��ȭ��ȣ</td>
               <td>&nbsp;<input type="text" name="lhp" id="lhp"></td>
            </tr>
            <tr>
               <td align="center">�������</td>
               <td>&nbsp;<input type="text" name="lbirth" id="lbirth"></td>
            </tr>
            <tr>
               <td align="center">�����ּ�</td>
               <td>&nbsp;<input type="text" name="emailId" id="emailId" size="10">@
               <select name="selectEmail" id="selectEmail">
               		<option value="naver.com" selected>naver.com</option>
               		<option value="hanmail.net">hanmail.net</option>
               		<option value="hotmail.com">hotmail.com</option>
               		<option value="nate.com">nate.com</option> 
               		<option value="yahoo.co.kr">yahoo.co.kr</option> 
               		<option value="empas.com">empas.com</option> 
               		<option value="dreamwiz.com">dreamwiz.com</option> 
               		<option value="freechal.com">freechal.com</option> 
               		<option value="lycos.co.kr">lycos.co.kr</option> 
               		<option value="korea.com">korea.com</option> 
               		<option value="gmail.com">gmail.com</option> 
               		<option value="hanmir.com">hanmir.com</option> 
               		<option value="paran.com">paran.com</option>
               </td>
            </tr>
            <tr>
               <td align="center">�����ȣ</td>
               <td>&nbsp;<input type="text" name="lpostno" id="lpostno">
               			<input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��"><br>
						<span id="guide" style="color:#999"></span></td>
            </tr>
            <tr>
               <td align="center">�ּ�</td>
               <td>&nbsp;<input type="text" name="ljuso" id="ljuso"></td>
            </tr>
            <tr>
               <td align="center">����</td>
               <td>&nbsp;<input type="file" name="lphoto" id="lphoto"></td>
            </tr>               
            <tr>
               <td align="center" colspan="2">
                  <input type="button" value="�Է�" id="I_member" name="I_member" >
                  <input type="button" value="��ȸ" id="S_member" name="S_member">
                  <input type="button" value="�˻�" id="SS_member" name="SS_member">
                  <input type="button" value="����" id="U_member" name="U_member">
                  <input type="button" value="����" id="D_member" name="D_member">
                  <input type="hidden" id="ISUD" name="ISUD">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="reset" value="�ٽþ���"> </td>
            </tr>
         </table>
      </form>
   </body>
</html>