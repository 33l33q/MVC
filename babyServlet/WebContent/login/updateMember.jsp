<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import =  "bitcamp.java142.ch5.ldbjf.dao.LdbMemberDAO" %>
<%@ page import =  "bitcamp.java142.ch5.ldbjf.dao.LdbMemberDAOImpl" %>
<%@ page import =  "bitcamp.java142.ch5.ldbjf.vo.LdbMemberVO" %>
<%@ page import = "bitcamp.java142.ch5.ldbjf.Servlet.MemberControllerServlet" %>
<%@ page import = "bitcamp.java142.common.utils.FilePath" %>


<%@ page import = "java.util.ArrayList" %>


    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�������� ����â</title>
		
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
	</head>
	
     <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
     <script type="text/javascript">
     
	     $(document).ready(function(){
		     alert("ȸ������ ����â ����");
		     
	            $("#U_member").click(function(){
	            	
	            	$("#ISUD").val("U");
	            	
	            	var ISUD = $("#ISUD").val();
	            	
	               	alert("�����Ͻðڽ��ϱ�?");   
	               	

	               	$("#updateForm")
	               	.attr("action","./MemberControllerServlet")
	               	.submit();

	            });
	            
	            $("#return").click(function(){
	      	
	               	alert("�α��� Ȯ���������� ���ư��ϴ�");  
	        
		      		var ISUD = $("#ISUD").val("L");
		    		$("#updateForm")
		    		.attr("action","./MemberControllerServlet")
		    		.submit();
	               	
	            });
	            
		     });
     </script>	
	
	
	<body>
<%

	System.out.println("updateMember.jsp ����");
	Object obj = request.getAttribute("sList");//������Ʈ�� �޾ƿ�

	
	ArrayList<String> sList = (ArrayList<String>)obj;
	

		String lmem = sList.get(0);
		String lname = sList.get(1);
		String lid = sList.get(2);
		String lpw = sList.get(3);
		String lhp = sList.get(4);
		String lbirth = sList.get(5);
		String lemail = sList.get(6);
		String lpostno = sList.get(7);
		String lloadAddr = sList.get(8);
		String laddr = sList.get(9);
		String lphoto = sList.get(10);
		
		String[] lemailArray = lemail.split("@");
		String lemailId = lemailArray[0];
		String lemailSite = lemailArray[1];
		
		System.out.println(lname + lid + lpw + lhp + lbirth + lemail + lpostno + lloadAddr + laddr);

%>

		<form name="updateForm" id="updateForm" method="POST" enctype="multipart/form-data">
			<table border="1"align="center">
			  <tbody>
			  	  <tr>
			  	  <td colspan ="3" align="center"><h3>ȸ������</h3></td>
				  <tr>
				   <td rowspan="5" width="200" align="center"> <img src="../../<%=lphoto%>" height="150">
				   					<input type="file" name="lphoto" id="lphoto" value=<%=lphoto%>>
				   					<input type="hidden" name="reLphoto" id="reLphoto" value="<%=lphoto%>"></td>
				    <td width="200"align="center"><b>ȸ����ȣ</b></td>
				    <td  width="300">&nbsp;<%=lmem%><input type="hidden" name ="lmem" id="lmem" value=<%=lmem%>></td>
				  </tr>
				  <tr>
				    <td align="center"><b>�̸�</b></td>
   				    <td>&nbsp;<%=lname%><input type="hidden" name ="lname" id="lname" value=<%=lname%>></td>
				  </tr>
				  <tr>
				    <td align="center"><b>���̵�</b></td>
				    <td>&nbsp;<%=lid%><input type="hidden" name="lid" id="lid" size="20" value=<%=lid%>></td>
				  </tr>
				  <tr>
				    <td align="center"><b>��й�ȣ</b></td>
				    <td>&nbsp;<input type="password" name="lpw" id="lpw" size="20" value=<%=lpw%>>
				    		  <input type="hidden" name="checkLpw" id="checkLpw" size="20" value=<%=lpw%>>
				    </td>
				  </tr>
				  <tr>
				    <td align="center"><b>��ȭ��ȣ</b></td>
				    <td>&nbsp;<input type="text" name="lhp" id="lhp" value=<%=lhp%>></td>
				  </tr>
				  <tr>
				    <td height="30" align="center"><b>�������</b></td>
				    <td colspan="2">&nbsp;<input type="text" name="lbirth" id="lbirth" value=<%=lbirth%>></td>
				  </tr>
				  <tr>
				    <td height="30" align="center" > <b> �̸��� </b></td>
				    <td colspan="2">&nbsp;<input type="text" name="lemailId" id="lemailId" value=<%=lemailId%>> @
				                     <select name="selectEmail" id="selectEmail" >
				                         <option value=<%=lemailSite %> selected><%=lemailSite %></option>
				                              <option value="naver.com">naver.com</option>
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
				                              <option value="paran.com">paran.com</option> </td>
				  </tr>
				  <tr>
				    <td height="30" align="center" > <b>�����ȣ</b></td>
				    <td colspan="2">&nbsp;<input type="text" name="lpostno" id="lpostno" value=<%=lpostno%>>
                        <input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��"><br>
                  <span id="guide" style="color:#999"></span></td>
				  </tr>
				  <tr>
				    <td height="30" align="center" > <b>���θ� �ּ� </b></td>
				    <td colspan="2">&nbsp;<input type="text" name="lloadAddr" id="lloadAddr" value="<%=lloadAddr%>" size=50></td>
				  </tr>
				  <tr>
				    <td height="30" align="center" > <b>�� �ּ� </b></td>
				    <td colspan="2">&nbsp;<input type="text" name="laddr" id="laddr" value="<%=laddr%>" size=50></td>
				  </tr>
				      <tr>
                     <td height="30" align="center" colspan="3">
                     <input type="button" value="����" id="U_member" name="U_member">
                 	 <input type="button" value="���ư���" id="return" name="return">
                     <input type="hidden" id="ISUD" name="ISUD">
                     <input type="reset" value="�ٽþ���"> </td>
               </tr>
				  
			  </tbody>
			</table>
		</form>
	</body>
</html>