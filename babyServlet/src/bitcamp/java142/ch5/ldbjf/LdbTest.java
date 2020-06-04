package bitcamp.java142.ch5.ldbjf;

import java.util.ArrayList;
import java.util.Scanner;

import bitcamp.java142.ch5.ldbjf.dao.LdbMemberDAO;
import bitcamp.java142.ch5.ldbjf.dao.LdbMemberDAOImpl;
import bitcamp.java142.ch5.ldbjf.vo.LdbMemberVO;
//import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class LdbTest {
	
	
	  public static void dp(ArrayList<LdbMemberVO> aList){
		  for(int i = 0 ; i < aList.size() ; i++){
		  	LdbMemberVO lvo = aList.get(i);
		  	System.out.print("[" + (i+1) + "] 출력내역 >>> " + lvo.getLmem());
		  	System.out.print(" " + lvo.getLname());
		  	System.out.print(" " + lvo.getLid() );
		  	System.out.print(" " + lvo.getLpw());
		  	System.out.print(" " + lvo.getLhp());
		  	System.out.print(" " + lvo.getLbirth());
		  	System.out.print(" " + lvo.getLemail());
		  	System.out.print(" " + lvo.getLpostno());
		  	System.out.print(" " + lvo.getLloadAddr());
		  	System.out.print(" " + lvo.getLaddr());
		  	System.out.print(" " + lvo.getLphoto());
		  	System.out.print(" " + lvo.getLdeleteYN());
		  	System.out.print(" " + lvo.getLinsertdate());
		  	System.out.print(" " + lvo.getLupdatedate() + "\n");
		  }	
	  }
	 public static void main(String args[]){
		 
		 
//		 //로그인
//		System.out.println("(log) LdbMemberScr.main() 로그인 진입 ");		 
//		 
//		System.out.println("(log) LdbMemberScr.main() 변수 선언 및 초기화 ");
//		String id = "dltoal";
//		String pw = "dltoal1234";
//		
//		System.out.println("(log) LdbMemberScr.로그인() 생성자 호출 ");
//		LdbMemberDAO ldao = new LdbMemberDAOImpl();
//		LdbMemberVO lvo = null;
//		lvo = new LdbMemberVO();
//		lvo.setLid(id);
//		lvo.setLpw(pw);
//		
//		
//		System.out.println("(log) LdbMemberScr.main() 함수 회귀");
//		System.out.println("(log) LdbMemberScr.main() 데이터 출력");
//		
//		
//		ArrayList<LdbMemberVO> aList = ldao.loginLdbMember(lvo);
//		System.out.println(""+ aList.size());
//		
//		
//		
//		if(aList.size() == 1) {
//		System.out.println("로그인 성공");
//		}else{
//		System.out.println("로그인 실패");
//		}
		 
		 //전체 조회
		 
//		 System.out.println("(log) LdbMemberScr.main() 로그인 진입 ");	
//		 LdbMemberDAO ldao = new LdbMemberDAOImpl();
//		 
//		 System.out.println("(log) LdbMemberScr.main.전체조회() 생성자 호출 ");
//		 ArrayList<LdbMemberVO> aList = ldao.selectLdbMember();
//		 
//		 System.out.println("(log) LdbMemberScr.main() 함수 회귀");
//		 System.out.println("(log) LdbMemberScr.main() 데이터 출력");
//		 
//		 if(aList.size() == 0){
//			 System.out.println("NO DATA");
//		 }else{
//			 
//			for(int i = 0 ; i < aList.size(); i++){
//				LdbMemberVO lvo = aList.get(i);
//			  	System.out.print("[" + (i+1) + "] 출력내역 >>> " + lvo.getLmem());
//			  	System.out.print(" " + lvo.getLname());
//			  	System.out.print(" " + lvo.getLid() );
//			  	System.out.print(" " + lvo.getLpw());
//			  	System.out.print(" " + lvo.getLhp());
//			  	System.out.print(" " + lvo.getLbirth());
//			  	System.out.print(" " + lvo.getLmail());
//			  	System.out.print(" " + lvo.getLpostnum());
//			  	System.out.print(" " + lvo.getLjuso());
//			  	System.out.print(" " + lvo.getLdeleteYN());
//			  	System.out.print(" " + lvo.getLinsertdate());
//			  	System.out.print(" " + lvo.getLupdatedate() + "\n");
//	  
//		  }
//		 
//		 }
//		//입력
		 
		//검색
		 
		 	System.out.println("검색할 회원 번호를 입력하세여");
		 	Scanner sc = new Scanner(System.in);
		 	
		 	String lmem = sc.nextLine();
		 			 	
			LdbMemberDAO ldao = new LdbMemberDAOImpl();
			LdbMemberVO lvo_S = new LdbMemberVO();
			lvo_S.setLmem(lmem);
			
			ArrayList<LdbMemberVO> aList = ldao.searchLdbMember(lvo_S);
			
			if(aList.size() == 0){
				System.out.println("fail");
				
			}else{
				for(int i = 0 ; i < aList.size() ;i++){
					LdbMemberVO lvo = aList.get(i);
				  	System.out.print("[" + (i+1) + "] 출력내역 >>> " + lvo.getLmem());
				  	System.out.print(" " + lvo.getLname());
				  	System.out.print(" " + lvo.getLid() );
				  	System.out.print(" " + lvo.getLpw());
				  	System.out.print(" " + lvo.getLhp());
				  	System.out.print(" " + lvo.getLbirth());
				  	System.out.print(" " + lvo.getLemail());
				  	System.out.print(" " + lvo.getLpostno());
				  	System.out.print(" " + lvo.getLloadAddr());
				  	System.out.print(" " + lvo.getLaddr());
				  	System.out.print(" " + lvo.getLphoto());
				  	System.out.print(" " + lvo.getLdeleteYN());
				  	System.out.print(" " + lvo.getLinsertdate());
				  	System.out.print(" " + lvo.getLupdatedate() + "\n");
					
				}
			}
		 
		
//		 //업데이트
//		 
//		 
//		Scanner sc = new Scanner(System.in);
//		String strV = sc.nextLine();
//		
//		String str[] = strV.split(",");
//		String lmem  = str[0].toString();
//		String lpw   = str[1].toString();
//		
//		LdbMemberDAO ldao = new LdbMemberDAOImpl();
//		LdbMemberVO lvo = new LdbMemberVO();
//		
//		lvo.setLmem(lmem);
//		lvo.setLpw(lpw);
//		
//		boolean bFlag = ldao.updateLdbMember(lvo);
//		
//		System.out.println("(log)" + lvo.getLpw() + " : " + lvo.getLmem());
//		
//		if(bFlag){
//			System.out.println("수정 성공!");
//		}else{
//			System.out.println("수정 실패!");
//		}
		
		
		
		 
		 
		 
		 
		 
		 		 
	 }//end of main

}//end of class
