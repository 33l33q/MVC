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
		                document.getElementById('lloadAddr').value = fullRoadAddr;
		
		                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
		                if(data.autoRoadAddress) {
		                    //����Ǵ� ���θ� �ּҿ� ������ �ּҸ� �߰��Ѵ�.
		                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		                    document.getElementById('guide').innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';
		
		                } else {
		                    document.getElementById('guide').innerHTML = '';
		                }
		            }
		        }).open();
		    }
		</script>
						
      <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
      <script type="text/javascript">
         
         $(document).ready(function(){
            
            alert("member.jsp ����");
   
            $("#lpwCheck").click(function(){
      
               alert("(log)��й�ȣ Ȯ�� �׽�Ʈ");
               var lpwVal = $('#lpw').val();
               var reVal =$('#reLpw').val();
               
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
                  alert("��й�ȣ�� �ٽ� �Է����ּ���");
               }
            });//end of ��й�ȣ üũ
            
            $("#lidCheck").click(function(){
            	
            	alert("���̵� Ȯ�� �׽�Ʈ");
            	var lidVal = $("#lid").val();
            	
            	if(!lidVal){
            		alert("id�� �Է��ϼ���");
            		$('#lid').focus();
            		return false;
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
            	
            	if(!$('#lid').val()){
            		alert("id�� �Է��ϼ���");
            		$('#lid').focus();
            		return false;
            	}
            	
            	if(!$('#lname').val()){
            		alert("�̸��� �Է��ϼ���");
            		$('#lname').focus();
            		return false;
            	}
            	
                if(!$('#lpw').val()){
                    alert("��й�ȣ�� �Է��ϼ���");
                    $("#lpw").focus();
                    return false;
                 }
                
                if(!$('#reLpw').val()){
                    alert("��й�ȣ Ȯ���� �Է��ϼ���");
                    $("#reLpw").focus();
                    return false;
                 }
                
                
                if(!$('#lemailId').val()){
                    alert("�����ּҸ� �Է��ϼ���");
                    $("#lemailId").focus();
                    return false;
                 }
                
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
            
            
            $("#moveLogin").click(function(){
            	alert("(log)�α���â �̵��ϱ�");
                $("#memberForm")
                .attr("action","./login.jsp")
                .submit();
             });

         });
         
      </script>
   </head>
   <body>
      <form name="memberForm" id="memberForm" method="POST" enctype="multipart/form-data" >
         <table border="1" align="center">
             <tr>
               <td colspan="2" align="center"><h3>��������</h3>*ǥ�� �׸��� �ʼ� ����</td>
              </tr>
            <tr>
               <td width = "150" align = "center"><b>ȸ����ȣ</b></td>
               <td width = "350">
				 &nbsp;<input type="text" name = "lmem" placeholder="* ����/ ����/ ��ȸ �� ȸ����ȣ ���" size="30"><br>
               </td>
            </tr>
            <tr>
               <td align="center"><b>*�̸�</b></td>
               <td>&nbsp;<input type="text" name ="lname" id="lname" size="30"></td>
            </tr>
            <tr>
               <td align="center"><b>*���̵�</b></td>
               <td>&nbsp;<input type="text" name="lid" id="lid" size="30">
                       <input type="button" id="lidCheck" value="�ߺ�üũ"></td>
            </tr>
            <tr>
               <td align="center"><b>*��й�ȣ</b></td>
               <td>&nbsp;<input type="password" name="lpw" id="lpw" size="30"></td>        
            </tr>
            <tr>
               <td align="center"><b>*��й�ȣȮ��</b></td>
               <td>&nbsp;<input type="password" name="reLpw" id="reLpw" size="30">
                       <input type="button" id="lpwCheck" value="Ȯ��"></td>
            </tr>
            <tr>
               <td align="center"><b>��ȭ��ȣ</b></td>
               <td>&nbsp;<input type="text" name="lhp" id="lhp"  size="30" placeholder="���ڸ� �Է��ϼ���"></td>
            </tr>
            <tr>
               <td align="center"><b>�������</b></td>
               <td>&nbsp;<input type="text" name="lbirth" id="lbirth"  size="30" placeholder="8�ڸ��� �Է��ϼ��� (���� 20200101)"></td>
            </tr>
            <tr>
               <td align="center"><b>*�����ּ�</b></td>
               <td>&nbsp;<input type="text" name="lemailId" id="lemailId" size="10">@
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
               <td align="center"><b>�����ȣ</b></td>
               <td>&nbsp;<input type="text" name="lpostno" id="lpostno"  size="25" >
               			&nbsp;&nbsp;<input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��"><br>
						<span id="guide" style="color:#999"></span></td>
            </tr>
            <tr>
               <td align="center"><b>�ּ�</b></td>
               <td>&nbsp;<input type="text" name="lloadAddr" id="lloadAddr" size="30" readonly></td>
            </tr>
            <tr>
               <td align="center"><b>���ּ�</b></td>
               <td>&nbsp;<input type="text" name="laddr" id="laddr" size="30"></td>
            </tr>
            <tr>
               <td align="center"><b>����</b></td>
               <td>&nbsp;<input type="file" name="lphoto" id="lphoto"></td>
            </tr>               
            <tr>
               <td align="center" colspan="2">
                  <input type="button" value="�Է�" id="I_member" name="I_member" >
                  <input type="button" value="��ȸ" id="S_member" name="S_member">
                  <input type="button" value="�α���â" id="moveLogin" name="moveLogin">
                  <input type="hidden" id="ISUD" name="ISUD">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="reset" value="�ٽþ���"> </td>
            </tr>
         </table>
      </form>
   </body>
</html>