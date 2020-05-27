package bitcamp.java142.board;

import java.util.Scanner;

import bitcamp.java142.board.dao.LdbBoardDAO;
import bitcamp.java142.board.dao.LdbBoardDAOImpl;
import bitcamp.java142.board.vo.LdbBoardVO;

public class BoardTest {
	
	public static int insertLdbBorad(String lsubject, String lname, String lpw, String lmemo  ){
		
		System.out.println("(log) BoardTest.insertLdbBorad() 진입");
		System.out.println(" " + lsubject + " " + lname + " " + lpw + " " + lmemo);
		
		LdbBoardDAO ldao = new LdbBoardDAOImpl();
		LdbBoardVO lvo = new LdbBoardVO();
		
		System.out.println("(log) BoardTest.insertLdbBorad() 생성자 호출 ");
		lvo = new LdbBoardVO();
		lvo.setLsubject(lsubject);
		lvo.setLname(lname);
		lvo.setLpw(lpw);
		lvo.setLmemo(lmemo);
		
		
		int iFlag = ldao.boardInsert(lvo);
		
		System.out.println("(log) BoardTest.insertLdbBorad() 종료");
		return iFlag;
	}
	
	public static int updateLdbBorad(String lsubject, String lmemo, String lno){
		System.out.println("(log) BoardTest.updateLdbBorad() 진입");
		System.out.println(" "  + lno + " " + lsubject + " " +  " " + lmemo);
		
		LdbBoardDAO ldao = new LdbBoardDAOImpl();
		LdbBoardVO lvo = new LdbBoardVO();
		
		
		System.out.println("(log) BoardTest.insertLdbBorad() 생성자 호출 ");
		lvo = new LdbBoardVO();
		lvo.setLno(lno);
		lvo.setLsubject(lsubject);
		lvo.setLmemo(lmemo);
		
		int iFlag = ldao.boardUpdate(lvo);
		
		
		
		return iFlag;
	}


	public static void main(String args[]){
		
		System.out.println("수행할 동작의 번호를 입력하세요 ( 등록(1),전체조회(2),수정(3) )");
		Scanner sc = new Scanner(System.in);
		
		String sFlag = sc.nextLine();
	
		if("1".equals(sFlag)){
		System.out.println("(log) BoardTest.main() insert 진입");
		
		String lsubject = "글 제목~~~";
		String lname = "김이름";
		String lpw = "비밀번호";
		String lmemo = "글 내용 입니당~~~";
		
		System.out.println("(log) BoardTest class 인스턴스");
		BoardTest bt = new BoardTest();
		
		int iFlag = bt.insertLdbBorad(lsubject, lname, lpw, lmemo);
		
		if(iFlag !=0){
			System.out.println("데이터 입력 완료!");			
		}else {
			System.out.println("데이터 재확인 요망!");
		}
		
		System.out.println("(log) BoardTest.main() insert 종료");
		}
		
		
		if("3".equals(sFlag)){
			
			System.out.println("(log) BoardTest.main() update 진입");
			
			String lsubject = "수정글제목";
			String lmemo = "수정 글 내용";
			String lno = "M0002";
			
			System.out.println("(log) BoardTest class 인스턴스");
			BoardTest bt = new BoardTest();
			
			int iFlag = bt.updateLdbBorad(lsubject, lmemo, lno);
			
			if(iFlag !=0){
				System.out.println("데이터 입력 완료!");
				
			}else {
				System.out.println("데이터 재확인 요망!");
			}
			
			System.out.println("(log) BoardTest.main() update 종료");
			}
		
		
	}//end of main
}//end of class
