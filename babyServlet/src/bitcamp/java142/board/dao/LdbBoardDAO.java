package bitcamp.java142.board.dao;

import java.util.ArrayList;

import bitcamp.java142.board.vo.LdbBoardVO;
import bitcamp.java142.ch5.ldbjf.vo.LdbMemberVO;

public interface LdbBoardDAO {
	
	int boardInsert(LdbBoardVO i_lvo);
	
	int boardUpdate(LdbBoardVO i_lvo);
	
	int boardDelete(LdbBoardVO i_lvo);
	
	ArrayList<LdbBoardVO> boardSelectAll();
	
	ArrayList<LdbBoardVO> boardSearch(LdbBoardVO i_lvo);
	
	boolean pwCheck(LdbBoardVO i_lvo);


}
