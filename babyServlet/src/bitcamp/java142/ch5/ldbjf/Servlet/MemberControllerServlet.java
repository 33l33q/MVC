package bitcamp.java142.ch5.ldbjf.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bitcamp.java142.ch5.ldbjf.dao.LdbMemberDAO;
import bitcamp.java142.ch5.ldbjf.dao.LdbMemberDAOImpl;
import bitcamp.java142.ch5.ldbjf.vo.LdbMemberVO;
import bitcamp.java142.common.utils.FilePath;

/**
 * Servlet implementation class BoardControllerServlet
 */
@WebServlet("/MemberControllerServlet")
public class MemberControllerServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberControllerServlet() {
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doPost(request,response );
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      
      request.setCharacterEncoding("EUC-KR");
      response.setContentType("text/html;charset=EUC-KR");
      
      String lmem ="";
      String lname = "";
      String lid = "";
      String lpw = "";
      String lhp = "";
      String lbirth = "";
      String lemail = "";
      String lpostno = "";
      String ljuso = "";
      String ldeleteYN ="";
      String linsertdate = "";
      String lupdatedate = "";
      String lphoto = "";
      
      
      PrintWriter out = response.getWriter();
      
      
      if(!request.getContentType().toLowerCase().startsWith("multipart/form-data")){
          //�α���
          
          lid = request.getParameter("lid");
          lpw = request.getParameter("lpw");
          System.out.println(lid + " : " +  lpw);
          
          LdbMemberDAO ldao = new LdbMemberDAOImpl();
          LdbMemberVO lvo = null;
          lvo = new LdbMemberVO();
          lvo.setLid(lid);
          lvo.setLpw(lpw);
          
          System.out.println( lvo.getLid() + " : " +  lvo.getLpw());
          
          ArrayList<LdbMemberVO> aList = ldao.loginLdbMember(lvo);
          
          String ISUD = request.getParameter("ISUD");
          
          
    	  
	      if("L".equals(ISUD.toUpperCase())){
	      
	    	  //�α���
	          if(aList.size()==1){
	              System.out.print("�α��� ����!");
	              RequestDispatcher rd = request.getRequestDispatcher("/login/loginOK.jsp");
	              rd.forward(request, response);
	          }
	          
	          if(aList.size()!=1) {
	              System.out.println("�α��� ����!");
	              RequestDispatcher rd = request.getRequestDispatcher("/login/login.jsp");
	              rd.forward(request, response);
	          }
	      }
      
      
          //ȸ������ ����
          if("U".equals(ISUD.toUpperCase())){
        	  System.out.println("������Ʈ ���� ��");
        	  
        	  lid = request.getParameter("lid");
        	  lpw = request.getParameter("lpw");
        	  
        	  
        	  LdbMemberVO lvo_S = new LdbMemberVO();
        	  lvo_S.setLid(lid);
        	  lvo_S.setLpw(lpw);
        	  
        	  
        	  aList = ldao.searchLdbMember(lvo_S);
        	  
        	  
              lvo = aList.get(0);
              
              lmem = lvo.getLmem();
              lname = lvo.getLname();
              lid = lvo.getLid();
              lpw = lvo.getLpw();
              lhp = lvo.getLhp();
              lbirth = lvo.getLbirth();
              lemail = lvo.getLemail();
              lpostno = lvo.getLpostno();
              ljuso = lvo.getLjuso();
              lphoto = lvo.getLphoto();
              
              System.out.println(lname + lid + lpw + lhp + lbirth + lemail + lpostno + ljuso +lphoto);
              
              ArrayList<String> sList = new ArrayList<String>();
              sList.add(lmem);
              sList.add(lname);
              sList.add(lid);
              sList.add(lpw);
              sList.add(lhp);
              sList.add(lbirth);
              sList.add(lemail);
              sList.add(lpostno);
              sList.add(ljuso);
              sList.add(lphoto);
              
              
              request.setAttribute("sList", sList);
              
              
              RequestDispatcher rd = request.getRequestDispatcher("/login/updateMember.jsp");
              rd.forward(request, response);
          }
          //ȸ��Ż���
          if("D".equals(ISUD.toUpperCase())){
        	  
        	  System.out.println("Ż�� ���� ��");
        	  
        	  lid = request.getParameter("lid");
        	  lpw = request.getParameter("lpw");
        	  
        	  
        	  LdbMemberVO lvo_S = new LdbMemberVO();
        	  lvo_S.setLid(lid);
        	  lvo_S.setLpw(lpw);
        	  
        	  aList = ldao.searchLdbMember(lvo_S);
        	  
              lvo = aList.get(0);
              
              lmem = lvo.getLmem();
              lname = lvo.getLname();
              lid = lvo.getLid();
              lpw = lvo.getLpw();
              lhp = lvo.getLhp();
              lbirth = lvo.getLbirth();
              lemail = lvo.getLemail();
              lpostno = lvo.getLpostno();
              ljuso = lvo.getLjuso();
              lphoto = lvo.getLphoto();
              
              System.out.println(lmem + lname + lid + lpw + lhp + lbirth + lemail + lpostno + ljuso );
              
              ArrayList<String> sList = new ArrayList<String>();
              sList.add(lmem);request.setAttribute("lid",lid);
              sList.add(lname);
              sList.add(lid);
              sList.add(lpw);
              sList.add(lhp);
              sList.add(lbirth);
              sList.add(lemail);
              sList.add(lpostno);
              sList.add(ljuso);
              sList.add(lphoto);
              
              
              request.setAttribute("sList", sList);
              
              
              RequestDispatcher rd = request.getRequestDispatcher("/login/deleteMember.jsp");
              rd.forward(request, response);
          
        	  
          }

      }else if(request.getContentType().toLowerCase().startsWith("multipart/form-data")){
         //ȸ������
         
         LdbMemberDAO ldao = new LdbMemberDAOImpl();
         LdbMemberVO lvo = null;
         lvo = new LdbMemberVO();

         int size = 1024*1024*15;
         
         String fileName = "";
         
         System.out.println("�̹��� ������ �ִ� ���");
         
         try{
            
            System.out.println("try ����");
            MultipartRequest mr = new MultipartRequest(  request, 
			                                             FilePath.UPLOAD_FILEPATH, 
			                                             size, 
			                                             "EUC-KR", 
			                                             new DefaultFileRenamePolicy());
             String ISUD = mr.getParameter("ISUD");
          
	   	      if("L".equals(ISUD.toUpperCase())){
	   	    	  
	   	    	 System.out.println("�α���");

                lid = mr.getParameter("lid");
                lpw = mr.getParameter("lpw");
                
                
	            System.out.println(lid + " : " +  lpw);
	            
	            ldao = new LdbMemberDAOImpl();
	            lvo = new LdbMemberVO();
	            lvo.setLid(lid);
	            lvo.setLpw(lpw);
	            
	            System.out.println( lvo.getLid() + " : " +  lvo.getLpw());
	            
	            ArrayList<LdbMemberVO> aList = ldao.loginLdbMember(lvo);
	           
	   	    	  //�α���
	   	          if(aList.size()==1){
 	                System.out.print("�α��� ����!");
                    
                    RequestDispatcher rd = request.getRequestDispatcher("../login/loginOK.jsp");
                    rd.forward(request, response);
		              
	   	              //response.sendRedirect("/babyServlet/login/loginOK.jsp?lid="+lid+"&lpw="+lpw);
	   	           
	   	          }
	   	          
	   	          if(aList.size()!=1) {
	   	              System.out.println("�α��� ����!");
//	   	              RequestDispatcher rd = request.getRequestDispatcher("../login/login.jsp");
//	   	              rd.forward(request, response);
	   	              
	   	           response.sendRedirect("../login/login.jsp");
	   	          }
	   	      }
   	      
            
            if("I".equals(ISUD.toUpperCase())){
            
               System.out.println(">>>ȸ������ ����");
               Enumeration en = mr.getFileNames();
                     
               fileName = (String)en.nextElement();
               System.out.println("fileName" + fileName);
                     
               String fileInput = mr.getFilesystemName(fileName);
               lphoto = FilePath.DOWNLOAD_FILEPATH + fileInput;
               
               System.out.println("fileInput" + fileInput);
               System.out.println("lphoto" + lphoto);
               
               lname = mr.getParameter("lname");
               lid = mr.getParameter("lid");
               lpw = mr.getParameter("lpw");
               lhp = mr.getParameter("lhp");
               lbirth = mr.getParameter("lbirth");
               lemail = mr.getParameter("emailId") + "@" + mr.getParameter("selectEmail");
               lpostno = mr.getParameter("lpostno");
               ljuso = mr.getParameter("ljuso");
                     
               System.out.println(lname + lid + lpw + lhp + lbirth + lemail + lpostno + ljuso );
            
               lvo.setLname(lname);
               lvo.setLid(lid);
               lvo.setLpw(lpw);
               lvo.setLhp(lhp);
               lvo.setLbirth(lbirth);
               lvo.setLemail(lemail);
               lvo.setLpostno(lpostno);
               lvo.setLjuso(ljuso);
               lvo.setLphoto(lphoto);

               System.out.println("lvo.getLname; " + lvo.getLname());
               
               boolean bFlag = ldao.insertLdbMember(lvo);
               
               if(bFlag){
                  response.sendRedirect("/babyServlet/login/insertOK.jsp");
                  //RequestDispatcher rd = request.getRequestDispatcher("/login/board.jsp");
                  
               }else{
                  response.sendRedirect("/babyServlet/login/member.jsp");
      
               }
            
            }
            
            //��� ����ϱ�
            if("S".equals(ISUD.toUpperCase())){
               
               System.out.println("select�� �����ϱ�");
               
               lvo = new LdbMemberVO();
               ArrayList<LdbMemberVO> aList = ldao.selectLdbMember();
               System.out.println("(log) aListAll >>> " + aList );
               request.setAttribute("aList", aList);
           	
			   RequestDispatcher rd = request.getRequestDispatcher("/login/selectMember.jsp");
			   rd.forward(request, response);
               
//               if(aList.size() == 0){
//                  response.sendRedirect("/babyServlet/login/member.jsp");
//               
//               }else{
//                  
//                  for(int i = 0; i < aList.size() ; i++){
//                     
//                     lvo = aList.get(i);
//                     
//                     lmem = lvo.getLmem();
//                     lname = lvo.getLname();
//                     lid = lvo.getLid();
//                     lpw = lvo.getLpw();
//                     lhp = lvo.getLhp();
//                     lbirth = lvo.getLbirth();
//                     lemail = lvo.getLemail();
//                     lpostno = lvo.getLpostno();
//                     ljuso = lvo.getLjuso();
//                     lphoto = lvo.getLphoto();
//
//                  }//end of for
//                  
//                  response.sendRedirect("/babyServlet/login/selectMember.jsp");
//               
//                  RequestDispatcher rd = request.getRequestDispatcher("/login/member.jsp");                  
//                  rd.forward(request, response);
//               }// end of select in if
            }//end of select
            
            //���� �����ϱ�
            if("U".equals(ISUD.toUpperCase())){
            	
            	System.out.println("���� ���� ����");
            	
                System.out.println("MultipartRequest");
                Enumeration en = mr.getFileNames();
                      
                fileName = (String)en.nextElement();
                System.out.println("fileName" + fileName);
                      
                String fileInput = mr.getFilesystemName(fileName);
                lphoto = FilePath.DOWNLOAD_FILEPATH + fileInput;
                
                System.out.println("fileInput" + fileInput);
                System.out.println("lphoto" + lphoto);
                
                lmem = mr.getParameter("lmem");
                lname = mr.getParameter("lname");
                lid = mr.getParameter("lid");
                lpw = mr.getParameter("lpw");
                lhp = mr.getParameter("lhp");
                lbirth = mr.getParameter("lbirth");
                lemail = mr.getParameter("lemail");
                lpostno = mr.getParameter("lpostno");
                ljuso = mr.getParameter("ljuso");
                
                System.out.println(lmem + lname + lid + lpw + lhp + lbirth + lemail + lpostno + ljuso );
                
                lvo.setLmem(lmem);
                lvo.setLname(lname);
                lvo.setLid(lid);
                lvo.setLpw(lpw);
                lvo.setLhp(lhp);
                lvo.setLbirth(lbirth);
                lvo.setLemail(lemail);
                lvo.setLpostno(lpostno);
                lvo.setLjuso(ljuso);
                lvo.setLphoto(lphoto);

                System.out.println("alert(lvo.getLname); " + lvo.getLname());
                
                boolean bFlag = ldao.updateLdbMember(lvo);
                
                //���� �� ���ư���
                if(bFlag){
              	  
              	  	System.out.println(lid + lpw);
              	  
              	  	LdbMemberVO lvo_S = new LdbMemberVO();
              	  	lvo_S.setLid(lid);
              	  	lvo_S.setLpw(lpw);
              	  
              	  	System.out.println(lvo_S.getLid() + lvo_S.getLpw());
              	  	
              	  	ArrayList<LdbMemberVO> aList = null;
              	  	aList = ldao.searchLdbMember(lvo_S);
              	  
                    lvo = aList.get(0);
                    
                    lmem = lvo.getLmem();
                    lname = lvo.getLname();
                    lid = lvo.getLid();
                    lpw = lvo.getLpw();
                    lhp = lvo.getLhp();
                    lbirth = lvo.getLbirth();
                    lemail = lvo.getLemail();
                    lpostno = lvo.getLpostno();
                    ljuso = lvo.getLjuso();
                    lphoto = lvo.getLphoto();
                    
                    System.out.println(lname + lid + lpw + lhp + lbirth + lemail + lpostno + ljuso );
                    
                	Object obj = request.getAttribute("sList");//������Ʈ�� �޾ƿ�
                		
                    ArrayList<String> sList = new ArrayList<String>();
                    sList.add(lmem);
                    sList.add(lname);
                    sList.add(lid);
                    sList.add(lpw);
                    sList.add(lhp);
                    sList.add(lbirth);
                    sList.add(lemail);
                    sList.add(lpostno);
                    sList.add(ljuso);
                    sList.add(lphoto);
                    
                    
                    request.setAttribute("sList", sList);
                    
                    
                    RequestDispatcher rd = request.getRequestDispatcher("/login/updateMember.jsp");
                    rd.forward(request, response);
                   
                }else{
                	System.out.println("���� ���� ����");
                	response.sendRedirect("/login/loginOK.jsp");
                  
                }
                
            }//end of update
            
            //ȸ��Ż���ϱ�
            if("D".equals(ISUD.toUpperCase())){
            	
            	System.out.println("���� ���� ����");
            	
                lid = mr.getParameter("lid");
                lpw = mr.getParameter("lpw");

                lvo.setLid(lid);
                lvo.setLpw(lpw);

                System.out.println("lvo.getLid " + lvo.getLid());
                
                boolean bFlag = ldao.deleteLdbMember(lvo);
            	
                if(bFlag){
                		 
                	System.out.println("Ż�� ����");  
                	lid="";
                	lpw="";
  	              	RequestDispatcher rd = request.getRequestDispatcher("/login/deleteOK.jsp");
  	              	rd.forward(request, response);
//                	response.sendRedirect("/login/deleteOK.jsp");
                	
                }else{
                	 System.out.println("Ż�� ����");
           	   	  
	               	 ArrayList<LdbMemberVO> aList = ldao.loginLdbMember(lvo); 
	               	  
	               	 LdbMemberVO lvo_S = new LdbMemberVO();
	               	 lvo_S.setLid(lid);
	               	 lvo_S.setLpw(lpw);
               	  
               	  	 aList = ldao.searchLdbMember(lvo_S);
               	  
                     lvo = aList.get(0);
	 
					 lmem = lvo.getLmem();
					 lname = lvo.getLname();
					 lid = lvo.getLid();
					 lpw = lvo.getLpw();
					 lhp = lvo.getLhp();
					 lbirth = lvo.getLbirth();
					 lemail = lvo.getLemail();
					 lpostno = lvo.getLpostno();
					 ljuso = lvo.getLjuso();
					 lphoto = lvo.getLphoto();
					 
					 System.out.println(lmem + lname + lid + lpw + lhp + lbirth + lemail + lpostno + ljuso );
					 
					 ArrayList<String> sList = new ArrayList<String>();
					 sList.add(lmem);
					 sList.add(lname);
					 sList.add(lid);
					 sList.add(lpw);
					 sList.add(lhp);
					 sList.add(lbirth);
					 sList.add(lemail);
					 sList.add(lpostno);
					 sList.add(ljuso);
					 sList.add(lphoto);
					 
						 
					 request.setAttribute("sList", sList);
					 
					 
					 RequestDispatcher rd = request.getRequestDispatcher("/login/deleteMember.jsp");
					 rd.forward(request, response);
                	
                }
            	
            }//end of delete
            
         }catch(Exception e){
            e.getMessage();
         }
      }

   }
   
   public boolean checkId(String lid){
         
      System.out.println("������ ���� >_<");
      LdbMemberDAO ldao = new LdbMemberDAOImpl();
      LdbMemberVO lvo = null;
      lvo = new LdbMemberVO();
      
      lvo.setLid(lid);
      
      boolean bool = ldao.idCheck(lvo);
      
      System.out.println("bool >>> : " + bool);
         
      return bool;
   }
   
}