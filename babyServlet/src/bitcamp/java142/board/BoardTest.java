package bitcamp.java142.board;

import java.util.Scanner;

import bitcamp.java142.board.dao.LdbBoardDAO;
import bitcamp.java142.board.dao.LdbBoardDAOImpl;
import bitcamp.java142.board.vo.LdbBoardVO;

public class BoardTest {
	
	public static int insertLdbBorad(String lsubject, String lname, String lpw, String lmemo  ){
		
		System.out.println("(log) BoardTest.insertLdbBorad() ����");
		System.out.println(" " + lsubject + " " + lname + " " + lpw + " " + lmemo);
		
		LdbBoardDAO ldao = new LdbBoardDAOImpl();
		LdbBoardVO lvo = new LdbBoardVO();
		
		System.out.println("(log) BoardTest.insertLdbBorad() ������ ȣ�� ");
		lvo = new LdbBoardVO();
		lvo.setLsubject(lsubject);
		lvo.setLname(lname);
		lvo.setLpw(lpw);
		lvo.setLmemo(lmemo);
		
		
		int iFlag = ldao.boardInsert(lvo);
		
		System.out.println("(log) BoardTest.insertLdbBorad() ����");
		return iFlag;
	}
	
	public static int updateLdbBorad(String lsubject, String lmemo, String lno){
		System.out.println("(log) BoardTest.updateLdbBorad() ����");
		System.out.println(" "  + lno + " " + lsubject + " " +  " " + lmemo);
		
		LdbBoardDAO ldao = new LdbBoardDAOImpl();
		LdbBoardVO lvo = new LdbBoardVO();
		
		
		System.out.println("(log) BoardTest.insertLdbBorad() ������ ȣ�� ");
		lvo = new LdbBoardVO();
		lvo.setLno(lno);
		lvo.setLsubject(lsubject);
		lvo.setLmemo(lmemo);
		
		int iFlag = ldao.boardUpdate(lvo);
		
		
		
		return iFlag;
	}


	public static void main(String args[]){
		
		System.out.println("������ ������ ��ȣ�� �Է��ϼ��� ( ���(1),��ü��ȸ(2),����(3) )");
		Scanner sc = new Scanner(System.in);
		
		String sFlag = sc.nextLine();
	
		if("1".equals(sFlag)){
		System.out.println("(log) BoardTest.main() insert ����");
		
		String lsubject = "�� ����~~~";
		String lname = "���̸�";
		String lpw = "��й�ȣ";
		String lmemo = "�� ���� �Դϴ�~~~";
		
		System.out.println("(log) BoardTest class �ν��Ͻ�");
		BoardTest bt = new BoardTest();
		
		int iFlag = bt.insertLdbBorad(lsubject, lname, lpw, lmemo);
		
		if(iFlag !=0){
			System.out.println("������ �Է� �Ϸ�!");			
		}else {
			System.out.println("������ ��Ȯ�� ���!");
		}
		
		System.out.println("(log) BoardTest.main() insert ����");
		}
		
		
		if("3".equals(sFlag)){
			
			System.out.println("(log) BoardTest.main() update ����");
			
			String lsubject = "����������";
			String lmemo = "���� �� ����";
			String lno = "M0002";
			
			System.out.println("(log) BoardTest class �ν��Ͻ�");
			BoardTest bt = new BoardTest();
			
			int iFlag = bt.updateLdbBorad(lsubject, lmemo, lno);
			
			if(iFlag !=0){
				System.out.println("������ �Է� �Ϸ�!");
				
			}else {
				System.out.println("������ ��Ȯ�� ���!");
			}
			
			System.out.println("(log) BoardTest.main() update ����");
			}
		
		
	}//end of main
}//end of class
