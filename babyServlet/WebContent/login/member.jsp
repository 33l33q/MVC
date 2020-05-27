<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
      <title>서블릿 회원가입</title>
      
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
						
      <script type="text/javascript" 
            src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
      <script type="text/javascript">
         
         $(document).ready(function(){
            
            alert("member.jsp 진입");
   
            $("#lpwCheck").click(function(){
      
               alert("(log)비밀번호 확인 테스트");
               var lpwVal = $('#lpw').val();
               var reVal =$('#reLpw').val();
               alert(lpwVal + " :  " + reVal);
               
               alert(lpwVal + " :  " + reVal);
               
               if(!lpwVal){
                  alert("비밀번호를 입력하세요");
                  $("#lpw").focus();
                  return false;
               }
               
               if(!reVal){
                  alert("비밀번호 확인을 입력하세요");
                  $('#reLpw').focus();
                  return false;
               }
               
               if(lpwVal == reVal ){
                  alert("비밀번호가 확인됐습니다");
               }else{ 
                  alert("비밀번호를 다시 확인해주세요");
               }
            });//end of 비밀번호 체크
            
            $("#lidCheck").click(function(){
            	
            	alert("아이디 확인 테스트");
            	var lidVal = $("#lid").val();
            	
            	if(!lidVal){
            		alert("id를 입력하세요");
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
                alert("리턴데이터 >>> : " + Data);
                $('#studenttest').html("화면에 리턴 데이터 출력 : " + Data);
				
                alert("studenttest");
                
                var dataCheck = $(Data).find("result").text();
                var resultVar = eval(dataCheck);
                
                console.log("resultVar >>> " + resultVar);
                if(!resultVar){
                	alert("아이디를 사용할 수 없습니다.");
                	
                }else{
                	alert("아이디를 사용할 수 있습니다.");
                	}
                }
                

            function whenError(){
                alert("에러발생");
            }
            
    
            
            $("#I_member").click(function(){
            	$("#ISUD").val("I");
            	var ISUD = $("#ISUD").val();
            	alert(ISUD);
               	alert("(log)가입하는 중");         
               	$("#memberForm")
               	.attr("action","../MemberControllerServlet")
               	.submit();
            });

            
            $("#S_member").click(function(){
            	$("#ISUD").val('S');
            	var ISUD = $("#ISUD").val();
            	alert("(log)전체 조회");
                $("#memberForm")
                .attr("action","../MemberControllerServlet")
                .submit();
             });

            
            $("#SS_member").click(function(){
            	var ISUD = $("#ISUD").val('SS');
                alert("(log)검색하기");
                $("#memberForm")
                .attr("action","../MemberControllerServlet")
                .submit();
             });


            
            $("#U_member").click(function(){
            	var ISUD = $("#ISUD").val('U');
                alert("(log)개인정보수정");
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
               <td colspan="2" align="center">가입정보</td>
              </tr>
            <tr>
               <td width = "100" align = "center">회원번호</td>
               <td width = "300">
				 &nbsp;<input type="text" name = "lmem" placeholder="* 수정/ 삭제/ 조회 시 회원번호 사용" size="30"><br>
                  <!-- <font size = "2">* 수정/ 삭제/ 조회 시 회원번호 사용</font>   -->
               </td>
            </tr>
            <tr>
               <td align="center">이름</td>
               <td>&nbsp;<input type="text" name ="lname" id="lname" size="30"></td>
            </tr>
            <tr>
               <td align="center">아이디</td>
               <td>&nbsp;<input type="text" name="lid" id="lid" size="30">
                       <input type="button" id="lidCheck" value="중복체크"></td>
            </tr>
            <tr>
               <td align="center">비밀번호</td>
               <td>&nbsp;<input type="password" name="lpw" id="lpw" size="30"></td>        
            </tr>
            <tr>
               <td align="center">비밀번호확인</td>
               <td>&nbsp;<input type="password" name="reLpw" id="reLpw" size="30">
                       <input type="button" id="lpwCheck" value="비밀번호확인"></td>
            </tr>
            <tr>
               <td align="center">전화번호</td>
               <td>&nbsp;<input type="text" name="lhp" id="lhp"></td>
            </tr>
            <tr>
               <td align="center">생년월일</td>
               <td>&nbsp;<input type="text" name="lbirth" id="lbirth"></td>
            </tr>
            <tr>
               <td align="center">메일주소</td>
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
               <td align="center">우편번호</td>
               <td>&nbsp;<input type="text" name="lpostno" id="lpostno">
               			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<span id="guide" style="color:#999"></span></td>
            </tr>
            <tr>
               <td align="center">주소</td>
               <td>&nbsp;<input type="text" name="ljuso" id="ljuso"></td>
            </tr>
            <tr>
               <td align="center">사진</td>
               <td>&nbsp;<input type="file" name="lphoto" id="lphoto"></td>
            </tr>               
            <tr>
               <td align="center" colspan="2">
                  <input type="button" value="입력" id="I_member" name="I_member" >
                  <input type="button" value="조회" id="S_member" name="S_member">
                  <input type="button" value="검색" id="SS_member" name="SS_member">
                  <input type="button" value="수정" id="U_member" name="U_member">
                  <input type="button" value="삭제" id="D_member" name="D_member">
                  <input type="hidden" id="ISUD" name="ISUD">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="reset" value="다시쓰기"> </td>
            </tr>
         </table>
      </form>
   </body>
</html>