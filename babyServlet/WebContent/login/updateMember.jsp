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
		<title>index</title>
		
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
	</head>
	
     <script type="text/javascript" 
           src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
     <script type="text/javascript">
     
	     $(document).ready(function(){
		     alert("ȸ������ ����â ����");
		     
	            $("#U_member").click(function(){
	            	
	            	$("#ISUD").val("U");
	            	
	            	var ISUD = $("#ISUD").val();
	            	
	               	alert("�����Ͻðڽ��ϱ�?");   
	               	
	               	$("#updateForm")
	               	.attr("action","./BoardControllerServlet")
	               	.submit();
	            });
	            
	            $("#return").click(function(){
	      	
	               	alert("�α��� Ȯ���������� ���ư��ϴ�");  
	        
	               	
		      		var ISUD = $("#ISUD").val("L");
		    		$("#updateForm")
		    		.attr("action","./BoardControllerServlet")
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
		String ljuso = sList.get(8);
		String lphoto = sList.get(9);
		
		System.out.println(lname + lid + lpw + lhp + lbirth + lemail + lpostno + ljuso );

%>
		<form name="updateForm" id="updateForm" method="POST" enctype="multipart/form-data">
			<table border="1"  align="center">
				<tr>
					<td colspan="2"><h3>ȸ������</h3></td>
				</tr>
				<tr>
					<td>ȸ����ȣ</td>
					<td><input type="text" name ="lmem" id="lmem" value=<%=lmem%> readonly></td>
				</tr>
				<tr>
					<td>�̸�</td>
					<td><input type="text" name ="lname" id="lname" value=<%=lname%> readonly></td>
				</tr>
				<tr>
					<td>���̵�</td>
					<td><input type="text" name="lid" id="lid" size="20" value=<%=lid%> readonly></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" name="lpw" id="lpw" size="20" value=<%=lpw%> readonly></td>
				</tr>
				<tr>
					<td>��ȭ��ȣ</td>
					<td><input type="text" name="lhp" id="lhp" value=<%=lhp%>></td>
				</tr>
				<tr>
					<td>�������</td>
					<td><input type="text" name="lbirth" id="lbirth" value=<%=lbirth%>></td>
				</tr>
				<tr>
					<td>�̸���</td>
					<td><input type="text" name="lemail" id="lemail" value=<%=lemail%>></td>
				</tr>
				<tr>
					<td>�����ȣ</td>
					<td><input type="text" name="lpostno" id="lpostno" value=<%=lpostno%>>
               			<input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��"><br>
						<span id="guide" style="color:#999"></span></td>
				</tr>
				<tr>
					<td>�ּ�</td>
					<td><input type="text" name="ljuso" id="ljuso" value="<%=ljuso%>" size=50></td>
				</tr>
				<tr>
					<td>����</td>
					<td>
					<img src=<%=lphoto%> border=0 width="30" height="40">
					<input type="file" name="lphoto" id="lphoto" value=<%=lphoto%> >
					</td>
				</tr>
				<tr>
               		<td align="center" colspan="2">
	                  <input type="button" value="����" id="U_member" name="U_member">
					  <input type="button" value="���ư���" id="return" name="return">
	                  <input type="hidden" id="ISUD" name="ISUD">
	                  <input type="reset" value="�ٽþ���"> </td>
	            </tr>
				</table>
		</form>
	</body>
</html>