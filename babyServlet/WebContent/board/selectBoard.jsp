<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import ="bitcamp.java142.board.vo.LdbBoardVO" %>
<%@ page import ="bitcamp.java142.board.Servlet.BoardControllerServlet" %>
<%@ page import ="bitcamp.java142.common.utils.FilePath" %>


<%@ page import ="java.util.ArrayList" %>

<% 	request.setCharacterEncoding("EUC-KR");
	response.setContentType("text/html; charset=EUC-KR"); %>

           		
           		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
      <title>전체 글 조회하기</title>
      
      
	<script type="text/javascript" 
      		src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">

	$(document).ready(function(){
		
		alert("전체 글 조회하기");
		     
        
        $("#S_board").click(function(){
        	var ISUD = $("#ISUD").val('S');
            alert("(log)상세 조회");
            $("#boardForm")
            .attr("action","./BoardControllerServlet")
            .submit();
         });

	    $("#I_board").click(function(){
	        alert("(log)글 작성하기");
	    	
	        $(location).attr('href', "./board/boradMain.jsp");

	     });
	});

    </script>
        		
         <style type="text/css">
            .tt{
            text-align : center;
            font-weight : bold;
            }
         </style>
       
   </head>

   <body>
      <form id="boardForm" name="boardForm" method="post" enctype="application/x-www-form-urlencoded">
         <table border ="1" align="center"  width="1000">
         	    <tr>
	               <td colspan="16" align="center"><h3>전체 글 보기</h3></td>
	            </tr>

	            <tr>
					<td class="tt">              
					<td class="tt">글번호</td>
					<td class="tt" width="500">제목</td>
					<td class="tt">작성자</td>
					<td class="tt">썸네일</td>
					<td class="tt">입력일</td>
					<td class="tt">수정일</td>			
				</tr>

 <%


   System.out.println("selectBoard.jsp 들어옴");

   
   
   ArrayList<LdbBoardVO> aList = (ArrayList<LdbBoardVO>)request.getAttribute("aListAll");
   System.out.println("allList 출력  들어옴");
   
   LdbBoardVO lbvo = new LdbBoardVO();
   
   
   if(aList.size() > 0) {
      
      for(int i = 0 ; i <aList.size(); i ++){
         lbvo = aList.get(i);
      
%>			
            <tr>
       
               <td align="center">
               <input type="checkbox" name="chkInLno" id="chkInLno"   value=<%= lbvo.getLno() %> onclick="checkOnly(this)"></td>
               <td align="center"><%=lbvo.getLno()%></td>
               <td align="left">&nbsp;&nbsp;<%=lbvo.getLsubject()%></td>
               <td align="center"><%=lbvo.getLname()%></td>
               <input type="hidden" name="lpw" id="lpw" value="<%=lbvo.getLpw()%>">
               <% System.out.println(lbvo.getLphoto()); %>
               <td  align="center"><img src="<%=lbvo.getLphoto()%>" width="30" onerror="this.src='/photo/none.jpg'"></td>
               <input type="hidden" name="ldeleteYN" id="ldeleteYN" value="<%=lbvo.getLdeleteYN()%>">
               <td  align="center"><%=lbvo.getLinsertdate()%></td>
               <td  align="center"><%=lbvo.getLupdatedate()%></td>
         
            </tr>

<%
      }
   }
%>      
            <tr>
               <td colspan="10" align="center">
                  <input type="hidden" id="ISUD" name="ISUD">
                  <input type="button" id="S_board" name="S_board" value="상세 조회" >
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="button" id="I_board" name="I_board" value="작성" >
                  </td>
            </tr>
         </table>
      </form>
   </body>
</html>