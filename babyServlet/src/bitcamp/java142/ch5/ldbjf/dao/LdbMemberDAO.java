package bitcamp.java142.ch5.ldbjf.dao;

import java.util.ArrayList;

import bitcamp.java142.ch5.ldbjf.vo.LdbMemberVO;

public interface LdbMemberDAO {
	
	boolean insertLdbMember(LdbMemberVO i_lvo);
	boolean updateLdbMember(LdbMemberVO i_lvo);
	boolean deleteLdbMember(LdbMemberVO i_lvo);

	ArrayList<LdbMemberVO>selectLdbMember();
	ArrayList<LdbMemberVO>searchLdbMember(LdbMemberVO i_lvo);
	ArrayList<LdbMemberVO> likeSearchLdbMember(LdbMemberVO i_lvo);
	
	//로그인 하기전에 확인하기
	public ArrayList<LdbMemberVO> loginLdbMember(LdbMemberVO i_lvo);
	
	//아이디체크 함수
	boolean idCheck(LdbMemberVO i_lvo);

}


