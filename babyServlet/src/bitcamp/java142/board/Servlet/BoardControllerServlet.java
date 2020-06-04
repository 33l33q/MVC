package bitcamp.java142.board.Servlet;

import java.io.IOException;
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

import bitcamp.java142.board.dao.LdbBoardDAO;
import bitcamp.java142.board.dao.LdbBoardDAOImpl;
import bitcamp.java142.board.vo.LdbBoardVO;
import bitcamp.java142.common.utils.FilePath;

/**
 * Servlet implementation class BoradControllerServlet
 */
@WebServlet("/BoardControllerServlet")
public class BoardControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");
		
		doGet(request, response);
		
		String lno ="";
		String lsubject = "";
		String lname ="";
		String lpw = "";
		String lmemo = "";
		String lphoto = "";
		String ldeleteYN = "";
		String linsertdate ="";
		String lupdatedate = "";
		
		if(!request.getContentType().toLowerCase().startsWith("multipart/form-data")){
		//���������Ͱ� ���� ���
			
			LdbBoardDAO lbdao = new LdbBoardDAOImpl();	
			LdbBoardVO lbvo = null;			
			lbvo = new LdbBoardVO();
			
			
			String ISUD = request.getParameter("ISUD");
			
			//����ȸ
			if("S".equals(ISUD.toUpperCase())){
				System.out.println("(log)����ȸ");
				
				lno = request.getParameter("chkInLno");
				
				System.out.println("lno >>> " + lno);
				
				LdbBoardVO lbvo_S = new LdbBoardVO();
				lbvo_S.setLno(lno);
				
				ArrayList<LdbBoardVO> aList = lbdao.boardSearch(lbvo_S);
				
				lbvo = aList.get(0);
				
				lno = lbvo.getLno();
				lsubject = lbvo.getLsubject();
				lname = lbvo.getLname();
				lpw = lbvo.getLpw();
				lmemo = lbvo.getLmemo();
				lphoto = lbvo.getLphoto();
				ldeleteYN = lbvo.getLdeleteYN();
				linsertdate = lbvo.getLinsertdate();
				lupdatedate = lbvo.getLupdatedate();
				
				
				ArrayList<String> sList = new ArrayList<String>();
				
				sList.add(lno);
				sList.add(lsubject);
				sList.add(lname);
				sList.add(lpw);
				sList.add(lmemo);
				sList.add(lphoto);
				sList.add(ldeleteYN);
				sList.add(linsertdate);
				sList.add(lupdatedate);
				
				
				
				request.setAttribute("sList", sList);
				
				RequestDispatcher rd = request.getRequestDispatcher("/board/searchBoard.jsp");
				rd.forward(request, response);
				
			}
			
			
			
			 if("SS".equals(ISUD.toUpperCase())){
	            	
	            	System.out.println("(log)select�� ����");
	            	
	            	lbvo = new LdbBoardVO();
	            	
	            	ArrayList aListAll = lbdao.boardSelectAll();
	            	
	            	System.out.println("(log) aListAll >>> " + aListAll );
	            	
	            	request.setAttribute("aListAll", aListAll);
	            	
					RequestDispatcher rd = request.getRequestDispatcher("/board/selectBoard.jsp");
					rd.forward(request, response);
	            	
			 }//��ü ��ȸ
			 
			 
			//���� �������� ����
            if("U".equals(ISUD.toUpperCase())){
            	
            	System.out.println("(log) ���� ������ ����");

				lno = request.getParameter("lno");
				System.out.println("lno >>> " + lno);
				
				LdbBoardVO lbvo_S = new LdbBoardVO();
				lbvo_S.setLno(lno);
				
				ArrayList<LdbBoardVO> aList = lbdao.boardSearch(lbvo_S);
				
				lbvo = aList.get(0);
				
				lno = lbvo.getLno();
				lsubject = lbvo.getLsubject();
				lname = lbvo.getLname();
				lpw = lbvo.getLpw();
				lmemo = lbvo.getLmemo();
				lphoto = lbvo.getLphoto();
				ldeleteYN = lbvo.getLdeleteYN();
				linsertdate = lbvo.getLinsertdate();
				lupdatedate = lbvo.getLupdatedate();
				
				
				ArrayList<String> sList = new ArrayList<String>();
				
				sList.add(lno);
				sList.add(lsubject);
				sList.add(lname);
				sList.add(lpw);
				sList.add(lmemo);
				sList.add(lphoto);
				sList.add(ldeleteYN);
				sList.add(linsertdate);
				sList.add(lupdatedate);
				
				request.setAttribute("sList", sList);
				
				RequestDispatcher rd = request.getRequestDispatcher("/board/updateBoard.jsp");
				rd.forward(request, response);
            	
            	
            }//end of update
            
            
            //���� �信���� ����
            if("D".equals(ISUD.toUpperCase())){
            	
            }//end of delete
            
				
				
		}else if(request.getContentType().toLowerCase().startsWith("multipart/form-data")){
		//���������Ͱ� �ִ� ���
			
			LdbBoardDAO lbdao = new LdbBoardDAOImpl();	
			LdbBoardVO lbvo = null;			
			lbvo = new LdbBoardVO();
			
			int size = 1024*1024*15;
			String fileName = "";
			
			System.out.println("(log)BoardControllerServlet.request.('multipart/form-data')����");
			
			
			try{
				
				System.out.println("(log)BoardControllerServlet.try ����");
				
				
				MultipartRequest mr = new MultipartRequest( request, 
									                        FilePath.UPLOAD_FILEPATH, 
									                        size, 
									                        "EUC-KR", 
									                        new DefaultFileRenamePolicy());
				String ISUD = mr.getParameter("ISUD");
				
				
				//insert
	            if("I".equals(ISUD.toUpperCase())){
	            	
	                System.out.println("MultipartRequest");
	                Enumeration en = mr.getFileNames();
	                
	                fileName = (String)en.nextElement();
	                System.out.println("fileName" + fileName);
	                      
	                String fileInput = mr.getFilesystemName(fileName);
	                lphoto = FilePath.DOWNLOAD_FILEPATH + fileInput;
	                
	                System.out.println("fileInput" + fileInput);
	                System.out.println("lphoto" + lphoto);
	                
	        		lno =mr.getParameter("lno");
	        		lsubject = mr.getParameter("lsubject");
	        		lname = mr.getParameter("lname");
	        		lpw = mr.getParameter("lpw");
	        		lmemo = mr.getParameter("lmemo");
	        		ldeleteYN = mr.getParameter("ldeleteYN");
	        		linsertdate = mr.getParameter("linsertdate");
	        		lupdatedate = mr.getParameter("lupdatedate");
	        		
	        		System.out.println(lno + lsubject + lname + lpw + lmemo + lphoto + ldeleteYN + linsertdate +  lupdatedate  );
	        			        		
	        		lbvo.setLno(lno);
	        		lbvo.setLsubject(lsubject);
	        		lbvo.setLname(lname);
	        		lbvo.setLpw(lpw);
	        		lbvo.setLmemo(lmemo);
	        		lbvo.setLphoto(lphoto);	
	        		lbvo.setLdeleteYN(ldeleteYN);
	        		lbvo.setLinsertdate(linsertdate);
	        		lbvo.setLupdatedate(lupdatedate);
	        		
	        		int bFalg = lbdao.boardInsert(lbvo);
	        		
	        		if(bFalg == 1 ){
	        			
						RequestDispatcher rd = request.getRequestDispatcher("/board/insertOK.jsp");
						rd.forward(request, response);
	        			
	        		}else{
	        			System.out.println("�Խñ� ��� ����!");
	        			response.sendRedirect("../board/insertOK.jsp");
	        		}
	            
	            }//end of �Է�
	            
	            if("SS".equals(ISUD.toUpperCase())){
	            	
	            	System.out.println("(log)select�� ����");
	            	
	            	lbvo = new LdbBoardVO();
	            	
	            	ArrayList aListAll = lbdao.boardSelectAll();
	            	
	            	System.out.println("(log) aListAll >>> " + aListAll );
	            	
	            	request.setAttribute("aListAll", aListAll);
	            	
					RequestDispatcher rd = request.getRequestDispatcher("/board/selectBoard.jsp");
					rd.forward(request, response);
	            	
	                    
	            	
	            }//end of select
	            
	            if("U".equals(ISUD.toUpperCase())){
	            	System.out.println("���� ���� ����");
	            	
	            	 System.out.println("MultipartRequest");
	                 Enumeration en = mr.getFileNames();
	                       
	                 fileName = (String)en.nextElement();
	                 System.out.println("fileName" + fileName);
	                       
	                 String fileInput = mr.getFilesystemName(fileName);
	                 lphoto = FilePath.DOWNLOAD_FILEPATH + fileInput;
	                 
	                 System.out.println("fileInput" + fileInput);
	                 System.out.println("lphoto >>>> : " + lphoto);
	                 

	        		lno =mr.getParameter("lno");
	        		lsubject = mr.getParameter("lsubject");
	        		lname = mr.getParameter("lname");
	        		lpw = mr.getParameter("lpw");
	        		lmemo = mr.getParameter("lmemo");
	        		ldeleteYN = mr.getParameter("ldeleteYN");
	        		linsertdate = mr.getParameter("linsertdate");
	        		lupdatedate = mr.getParameter("lupdatedate");
	        		
	        		
	        		lbvo.setLno(lno);
	        		lbvo.setLsubject(lsubject);
	        		lbvo.setLname(lname);
	        		lbvo.setLpw(lpw);
	        		lbvo.setLmemo(lmemo);
	        		lbvo.setLphoto(lphoto);
	        		lbvo.setLdeleteYN(ldeleteYN);
	        		lbvo.setLinsertdate(linsertdate);
	        		lbvo.setLupdatedate(lupdatedate);
	        		
	        		int bFlag = 0;
	        		
	        		bFlag = lbdao.boardUpdate(lbvo);
	                
	        		if(bFlag==1){
	        			
	    				LdbBoardVO lbvo_S = new LdbBoardVO();
	    				lbvo_S.setLno(lno);
	    				
	    				ArrayList<LdbBoardVO> aList = lbdao.boardSearch(lbvo_S);
	    				
	    				lbvo = aList.get(0);
	    				
	    				lno = lbvo.getLno();
	    				lsubject = lbvo.getLsubject();
	    				lname = lbvo.getLname();
	    				lpw = lbvo.getLpw();
	    				lmemo = lbvo.getLmemo();
	    				lphoto = lbvo.getLphoto();
	    				ldeleteYN = lbvo.getLdeleteYN();
	    				linsertdate = lbvo.getLinsertdate();
	    				lupdatedate = lbvo.getLupdatedate();
	    				
	    				
	    				ArrayList<String> sList = new ArrayList<String>();
	    				
	    				sList.add(lno);
	    				sList.add(lsubject);
	    				sList.add(lname);
	    				sList.add(lpw);
	    				sList.add(lmemo);
	    				sList.add(lphoto);
	    				sList.add(ldeleteYN);
	    				sList.add(linsertdate);
	    				sList.add(lupdatedate);
	    				
	    				
	    				request.setAttribute("sList", sList);
	    				
	    				RequestDispatcher rd = request.getRequestDispatcher("/board/searchBoard.jsp");
	    				rd.forward(request, response);

	        			
	        		}else if(bFlag != 1){
	        			
	        			System.out.println("���� ���� ����!");
	        			
	        		}
	            	
	            	
	            }//end of update
	            
	            if("D".equals(ISUD.toUpperCase())){
	            	
	            	lno = mr.getParameter("lno");
	            	
	            	lbvo.setLno(lno);
	            	
	            	int bFlag = lbdao.boardDelete(lbvo);
	            	
	            	
	            	if(bFlag==1){
	            		
	            			            		
	            		lbvo = new LdbBoardVO();
		            	
		            	ArrayList aListAll = lbdao.boardSelectAll();
		            	
		            	System.out.println("(log) aListAll >>> " + aListAll );
		            	
		            	request.setAttribute("aListAll", aListAll);
		            	
						RequestDispatcher rd = request.getRequestDispatcher("/board/selectBoard.jsp");
						rd.forward(request, response);
	            		
	            	}else if(bFlag != 1){
	            		System.out.println("���� ����!");
	            	}
	          
	            }//end of delete
	            
				
			}catch(Exception e){
				
			}//end of try
			
		}//end of if
	}//end of doPost

	public boolean checkPw(String lpw){
		System.out.println("(log)checkPw()");
		
		boolean bool = false;
		
		LdbBoardDAO lbdao = new LdbBoardDAOImpl();
		LdbBoardVO lbvo = null;
		lbvo = new LdbBoardVO();
		
		lbvo.setLpw(lpw);
		
		bool = lbdao.pwCheck(lbvo);
		
		System.out.println("bool >> " +  bool);
		
		return bool;
	}
	
}
