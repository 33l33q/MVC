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
		    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		    function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
		
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		                if(fullRoadAddr !== ''){
		                    fullRoadAddr += extraRoadAddr;
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('lpostno').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('ljuso').value = fullRoadAddr;
		                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
		
		                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
		                if(data.autoRoadAddress) {
		                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
		                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
		
		                } else if(data.autoJibunAddress) {
		                    var expJibunAddr = data.autoJibunAddress;
		                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
		
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
		     alert("회원정보 수정창 진입");
		     
	            $("#U_member").click(function(){
	            	
	            	$("#ISUD").val("U");
	            	
	            	var ISUD = $("#ISUD").val();
	            	
	               	alert("수정하시겠습니까?");   
	               	
	               	$("#updateForm")
	               	.attr("action","./BoardControllerServlet")
	               	.submit();
	            });
	            
	            $("#return").click(function(){
	      	
	               	alert("로그인 확인페이지로 돌아갑니다");  
	        
	               	
		      		var ISUD = $("#ISUD").val("L");
		    		$("#updateForm")
		    		.attr("action","./BoardControllerServlet")
		    		.submit();
	               	
	            });
	            
		     });
     </script>	
	
	
	<body>
<%

	System.out.println("updateMember.jsp 들어옴");
	Object obj = request.getAttribute("sList");//오브젝트로 받아옴

	
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
					<td colspan="2"><h3>회원정보</h3></td>
				</tr>
				<tr>
					<td>회원번호</td>
					<td><input type="text" name ="lmem" id="lmem" value=<%=lmem%> readonly></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name ="lname" id="lname" value=<%=lname%> readonly></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="lid" id="lid" size="20" value=<%=lid%> readonly></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="lpw" id="lpw" size="20" value=<%=lpw%> readonly></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="lhp" id="lhp" value=<%=lhp%>></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="lbirth" id="lbirth" value=<%=lbirth%>></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="lemail" id="lemail" value=<%=lemail%>></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" name="lpostno" id="lpostno" value=<%=lpostno%>>
               			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<span id="guide" style="color:#999"></span></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="ljuso" id="ljuso" value="<%=ljuso%>" size=50></td>
				</tr>
				<tr>
					<td>사진</td>
					<td>
					<img src=<%=lphoto%> border=0 width="30" height="40">
					<input type="file" name="lphoto" id="lphoto" value=<%=lphoto%> >
					</td>
				</tr>
				<tr>
               		<td align="center" colspan="2">
	                  <input type="button" value="수정" id="U_member" name="U_member">
					  <input type="button" value="돌아가기" id="return" name="return">
	                  <input type="hidden" id="ISUD" name="ISUD">
	                  <input type="reset" value="다시쓰기"> </td>
	            </tr>
				</table>
		</form>
	</body>
</html>