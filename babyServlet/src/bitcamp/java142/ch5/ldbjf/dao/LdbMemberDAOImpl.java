package bitcamp.java142.ch5.ldbjf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bitcamp.java142.ch5.ldbjf.common.LdbCheabunClass;
import bitcamp.java142.ch5.ldbjf.common.LdbConnProperty;
import bitcamp.java142.ch5.ldbjf.sql.LdbSqlQueryMap;
import bitcamp.java142.ch5.ldbjf.vo.LdbMemberVO;


public class LdbMemberDAOImpl implements LdbMemberDAO {

   @Override
   public boolean insertLdbMember(LdbMemberVO i_lvo) {
      
      System.out.println("(log) LdbMemberScr.LdbMemberDAO.insertLdbMember(LdbMemberVO i_lvo) 함수 진입  ");
       
      System.out.println("i_lvo 참조변수 주소값 : " + i_lvo );
      
      System.out.println(" " + i_lvo.getLname() + " " +  i_lvo.getLid()+ " " + i_lvo.getLpw()+ " " + i_lvo.getLhp()
                   + " " +  i_lvo.getLbirth() + " " + i_lvo.getLemail() + " " + i_lvo.getLpostno() + " " +  i_lvo.getLloadAddr() +  i_lvo.getLaddr() );

         
      Connection con = null;
      PreparedStatement pstmt = null;
      
      int nCnt = 0;
      
      try{
         //connetion 구하기
         System.out.println("(log) LdbMemberScr.LdbConnProperty.getConnection() 함수 실행 "); 
         con = LdbConnProperty.getConnection();
         System.out.println("DB 주소 연결  >>> " + con);
         
         System.out.println("con.getAutoCommit() >>>  " + con.getAutoCommit());
         con.setAutoCommit(false);
         System.out.println("con.getAutoCommit() >>>  " + con.getAutoCommit());
         
         System.out.println("(log) LdbMemberScr.LdbSqlQueryMap.getInsertQuery() 함수 실행 "); 
         pstmt = con.prepareStatement(LdbSqlQueryMap.getInsertQuery());
         System.out.println("EciSqlQueryMap.getInsertQuery() : \n" 
               + LdbSqlQueryMap.getInsertQuery());    
         
         pstmt.setString(1, LdbCheabunClass.commonNo_LDB_MEMBER());
         pstmt.setString(2, i_lvo.getLname());
         pstmt.setString(3, i_lvo.getLid());
         pstmt.setString(4, i_lvo.getLpw());
         pstmt.setString(5, i_lvo.getLhp());
         pstmt.setString(6, i_lvo.getLbirth());
         pstmt.setString(7, i_lvo.getLemail());
         pstmt.setString(8, i_lvo.getLpostno());
         pstmt.setString(9, i_lvo.getLloadAddr());
         pstmt.setString(10, i_lvo.getLaddr());
         pstmt.setString(11, i_lvo.getLphoto());
         pstmt.setString(12, "Y");
         
         System.out.println("(log) LdbMemberScr.pstmt.executeUpdate() 함수 실행 "); 
         nCnt = pstmt.executeUpdate();
         
         System.out.println("숫자 확인 >>> " + nCnt);
         
         if(!con.getAutoCommit()) con.commit();
      }catch(Exception e){
         e.printStackTrace();
      }finally{
         try{LdbConnProperty.conClose(con, pstmt);}
         catch(Exception e2){}
      }
      if(nCnt == 0 ) return false;
      System.out.println("(log) LdbMemberScr.LdbMemberDAO.insertLdbMember(LdbMemberVO i_lvo) 함수 종료 ");
      return true;
   }

   @Override
   public boolean updateLdbMember(LdbMemberVO i_lvo) {
      
      System.out.println("(log) LdbMemberScr.LdbMemberDAO.updateLdbMember(LdbMemberVO i_lvo) 함수 진입");
      System.out.println(" i_lvo 참조변수 주소값 : " + i_lvo );
      System.out.println(i_lvo.getLpw() + " " +  i_lvo.getLbirth() + i_lvo.getLphoto());
      
      //지역변수 초기화      
      Connection con = null;
      PreparedStatement pstmt = null;
      
      int nCnt = 0;
      
      
      try
      {   
         System.out.println("(log) LdbMemberScr.LdbConnProperty.getConnection() 함수 실행 "); 
         con = LdbConnProperty.getConnection();
         System.out.println("DB 주소 연결  >>> " + con);
         
         System.out.println("(log) LdbMemberScr.LdbSqlQueryMap.getUpdateQuery() 함수 실행 "); 
         pstmt = con.prepareStatement(LdbSqlQueryMap.getUpdateQuery());
         System.out.println("EciSqlQueryMap.getInsertQuery() : \n" 
               + LdbSqlQueryMap.getUpdateQuery());    
         
         pstmt.setString(1, i_lvo.getLpw());
         pstmt.setString(2, i_lvo.getLhp());
         pstmt.setString(3, i_lvo.getLbirth());
         pstmt.setString(4, i_lvo.getLemail());
         pstmt.setString(5, i_lvo.getLpostno());
         pstmt.setString(6, i_lvo.getLloadAddr());
         pstmt.setString(7, i_lvo.getLaddr());
         pstmt.setString(8, i_lvo.getLphoto());
         pstmt.setString(9, i_lvo.getLid());
         pstmt.setString(10, i_lvo.getCheckLpw());
         
         System.out.println("(log) LdbMemberScr.pstmt.executeUpdate() 함수 실행 "); 
         nCnt = pstmt.executeUpdate();
         System.out.println("nCnt  >>> : " + nCnt);
         
         if(!con.getAutoCommit()) con.commit();
         System.out.println("수정 되었습니다 >>> " + nCnt);
         
      }catch(Exception e){
         System.out.println("에러발생!" + e.getMessage());
      }finally{
         try{LdbConnProperty.conClose(con, pstmt);}catch(Exception e2){
         }
      }
      
      if (nCnt == 0) return false;
      System.out.println("(log) LdbMemberScr.LdbMemberDAO.updateLdbMember(LdbMemberVO i_lvo) 함수 종료");
      return true;
   }

   @Override
   public boolean deleteLdbMember(LdbMemberVO i_lvo) {
      System.out.print("(log) LdbMemberScr.LdbMemberDAO.deleteLdbMember(LdbMemberVO i_lvo) 함수 진입");
      System.out.println(" i_lvo 참조변수 주소값 : " + i_lvo );
      System.out.println(i_lvo.getLid() +  i_lvo.getLpw());
      
      //지역변수 초기화
      Connection   con         = null;
      PreparedStatement pstmt = null;
      
      int nCnt = 0;
      
      try{
         System.out.println("(log) LdbMemberScr.LdbConnProperty.getConnection() 함수 실행 "); 
         con = LdbConnProperty.getConnection();
         System.out.println("DB 주소 연결  >>> " + con);
         
         System.out.println("con.getAutoCommit() >>>  " + con.getAutoCommit());
         con.setAutoCommit(false);
         System.out.println("con.getAutoCommit() >>>  " + con.getAutoCommit());
         
         System.out.println("(log) LdbMemberScr.LdbSqlQueryMap.getDeleteQuery() 함수 실행 "); 
         pstmt = con.prepareStatement(LdbSqlQueryMap.getDeleteQuery());
         System.out.println("EciSqlQueryMap.getDeleteQuery() : \n" 
               + LdbSqlQueryMap.getDeleteQuery());    
                  
         pstmt.setString(1, i_lvo.getLid());
         pstmt.setString(2, i_lvo.getLpw());
         
         System.out.println("i_lvo.getLmem() >>> : " + i_lvo.getLmem() );
         System.out.println("i_lvo.getLpw() >>> : " + i_lvo.getLpw());

         
         
         System.out.println("(log) LdbMemberScr.pstmt.executeUpdate() 함수 실행 "); 
         nCnt = pstmt.executeUpdate();
         System.out.println("nCnt  >>> : " + nCnt);
         
         if (!con.getAutoCommit()) con.commit(); 
            System.out.println("delete 잘 되었음 >>> : " + nCnt);
            
            LdbConnProperty.conClose(con, pstmt);

      }catch(Exception e){
      }finally{
         LdbConnProperty.conClose(con, pstmt);
         try{
            LdbConnProperty.conClose(con, pstmt);
         }catch(Exception e2){
            System.out.println("문제가 발생했습니다 >>> : " + e2.getMessage());
         }
            }
      if (nCnt == 0) return false;
      System.out.println("(log) LdbMemberScr.LdbMemberDAO.deleteLdbMember(LdbMemberVO i_lvo) 함수 종료");
      return true;
   }
   

   @Override
   public ArrayList<LdbMemberVO> selectLdbMember() {
      
      System.out.println("(log) LdbMemberScr.LdbMemberDAO.selectLdbMember() 함수 진입");

      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rsRs = null;
      ArrayList<LdbMemberVO> aList = null;
      LdbMemberVO lvo = null;
      
      
      try {
         
         System.out.println("(log) LdbMemberScr.LdbConnProperty.getConnection() 함수 실행 ");
         con = LdbConnProperty.getConnection();
         System.out.println(" con >>> : " + LdbConnProperty.getConnection());
         
         System.out.println("(log) LdbMemberScr.LdbConnProperty.getSelectQuery() 함수 실행 ");
         pstmt = con.prepareStatement(LdbSqlQueryMap.getSelectQuery());
           System.out.println(" LdbSqlQueryMap.getSelectQuery() :: \n" 
                  + LdbSqlQueryMap.getSelectQuery());   
            
          
           System.out.println("(log) LdbMemberScr.pstmt.executeQuery() 함수 실행 "); 
         rsRs = pstmt.executeQuery();
         System.out.println(" rsRs >>> : " +  rsRs);
         
         if(rsRs != null){
            aList = new ArrayList<LdbMemberVO>();
            while(rsRs.next()){
               lvo = new LdbMemberVO();
               lvo.setLmem(rsRs.getString("LMEM"));
               lvo.setLname(rsRs.getString("LNAME"));
               lvo.setLid(rsRs.getString("LID"));
               lvo.setLpw(rsRs.getString("LPW"));
               lvo.setLhp(rsRs.getString("LHP"));
               lvo.setLbirth(rsRs.getString("LBIRTH"));
               lvo.setLemail(rsRs.getString("LEMAIL"));
               lvo.setLpostno(rsRs.getString("LPOSTNO"));
               lvo.setLloadAddr(rsRs.getString("LLOADADDR"));
               lvo.setLaddr(rsRs.getString("LADDR"));
               lvo.setLphoto(rsRs.getString("LPHOTO"));
               lvo.setLdeleteYN(rsRs.getString("LDELETEYN"));
               lvo.setLinsertdate(rsRs.getString("LINSERTDATE"));
               lvo.setLupdatedate(rsRs.getString("LUPDATEDATE"));
               aList.add(lvo);
            }
            System.out.println("aList.size() >>> : " + aList.size());
         }else{
            System.out.println("데이터가 없습니다");
         }
         
         LdbConnProperty.conClose(con, pstmt, rsRs);
         
      }catch(Exception e){
         System.out.println("에러가 >>> : " + e.getMessage());
      }finally{
         LdbConnProperty.conClose(con, pstmt, rsRs);
         try{LdbConnProperty.conClose(con, pstmt, rsRs);
         }catch(Exception e2){
            System.out.println("문제가 발생했습니다 >>> : " + e2.getMessage());
         }
      }
      System.out.println("(log) LdbMemberScr.LdbMemberDAO.selectLdbMember() 함수 종료");
      return aList;
   }

   @Override
   public ArrayList<LdbMemberVO> searchLdbMember(LdbMemberVO i_lvo) {
      System.out.print("(log) LdbMemberScr.searchLdbMember() 함수 진입");
      System.out.println("i_lvo 참조변수 주소값 : " + i_lvo );
      System.out.println("매개변수 확인 : " + i_lvo.getLid() + " : " + i_lvo.getLpw() );
       
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rsRs = null;
      ArrayList<LdbMemberVO> aList = null;
      LdbMemberVO lvo = null;
      
      try{
         System.out.println("(log) LdbMemberScr.LdbConnProperty.getConnection() 함수 실행");
         con = LdbConnProperty.getConnection();
         System.out.println("con >>> : " + con);
         
         System.out.println("(log) LdbMemberScr.LdbConnProperty.prepareStatement.getSearchQuery() 함수 실행");
         pstmt = con.prepareStatement(LdbSqlQueryMap.getSearchQuery());
           System.out.println("LdbSqlQueryMap.getSearchQuery() :: \n" 
                  + LdbSqlQueryMap.getSearchQuery());
           
           
           pstmt.setString(1, i_lvo.getLid());
           pstmt.setString(2, i_lvo.getLpw());
           System.out.println( i_lvo.getLid()  + " : "  + i_lvo.getLpw());
          
           System.out.println("(log) LdbMemberScr.pstmt.executeQuery() 함수 실행 "); 
         rsRs = pstmt.executeQuery();
         System.out.println(" rsRs >>> : " +  rsRs);
         
            if(rsRs != null){
               
               aList = new ArrayList<LdbMemberVO>();
               
               while(rsRs.next()){
                  lvo = new LdbMemberVO();
                  lvo.setLmem(rsRs.getString("LMEM"));
                  lvo.setLname(rsRs.getString("LNAME"));
                  lvo.setLid(rsRs.getString("LID"));
                  lvo.setLpw(rsRs.getString("LPW"));
                  lvo.setLhp(rsRs.getString("LHP"));
                  lvo.setLbirth(rsRs.getString("LBIRTH"));
                  lvo.setLemail(rsRs.getString("LEMAIL"));
                  lvo.setLpostno(rsRs.getString("LPOSTNO"));
                  lvo.setLloadAddr(rsRs.getString("LLOADADDR"));
                  lvo.setLaddr(rsRs.getString("LADDR"));
                  lvo.setLphoto(rsRs.getString("LPHOTO"));
                  lvo.setLdeleteYN(rsRs.getString("LDELETEYN"));
                  lvo.setLinsertdate(rsRs.getString("LINSERTDATE"));
                  lvo.setLupdatedate(rsRs.getString("LUPDATEDATE"));
                  lvo.setLphoto(rsRs.getString("LPHOTO"));
                  aList.add(lvo);
               }
               System.out.println("aList.size() >>> : " + aList.size());
            }else{
               System.out.println("데이터가 없습니다");
            }
            LdbConnProperty.conClose(con, pstmt, rsRs);
            
            
      }catch(Exception e){
         System.out.println("오류가 발생했습니다 " +  e.getMessage());
      }finally{
         LdbConnProperty.conClose(con, pstmt, rsRs);
      }
      System.out.println("(log) LdbMemberScr.LdbMemberDAO.searchLdbMember() 함수 종료");
      
      return aList;
   }//end of search

   @Override
   public ArrayList<LdbMemberVO> likeSearchLdbMember(LdbMemberVO i_lvo) {
      System.out.println("(log) LdbMemberScr.LdbMemberDAO.likeSearchLdbMember() 함수 진입");
      System.out.println("i_lvo 참조변수 주소값 : " + i_lvo );
      System.out.println("매개변수 확인 : " + i_lvo.getLmem() );
       
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rsRs = null;
      ArrayList<LdbMemberVO> aList = null;
      LdbMemberVO lvo = null;
      
      try{
         System.out.println("(log) LdbMemberScr.LdbConnProperty.getConnection() 함수 실행");
         con = LdbConnProperty.getConnection();
         System.out.println("con >>> : " + con);
         
         System.out.println("(log) LdbMemberScr.LdbConnProperty.prepareStatement.getLikeSearchQuery() 함수 실행");
         pstmt = con.prepareStatement(LdbSqlQueryMap.getLikeSearchQuery());
           System.out.println("LdbSqlQueryMap.getLikeSearchQuery() :: \n" 
                  + LdbSqlQueryMap.getLikeSearchQuery());
           
           
           pstmt.setString(1, i_lvo.getLmem());
           System.out.println(i_lvo.getLmem());
          
           System.out.println("(log) LdbMemberScr.pstmt.executeQuery() 함수 실행 "); 
         rsRs = pstmt.executeQuery();
         
            if(rsRs != null){
               
               aList = new ArrayList<LdbMemberVO>();
               
               while(rsRs.next()){
                  
                  lvo = new LdbMemberVO();
                  lvo.setLmem(rsRs.getString("LMEM"));
                  lvo.setLname(rsRs.getString("LNAME"));
                  lvo.setLid(rsRs.getString("LID"));
                  lvo.setLpw(rsRs.getString("LPW"));
                  lvo.setLhp(rsRs.getString("LHP"));
                  lvo.setLbirth(rsRs.getString("LBIRTH"));
                  lvo.setLemail(rsRs.getString("LEMAIL"));
                  lvo.setLpostno(rsRs.getString("LPOSTNO"));
                  lvo.setLloadAddr(rsRs.getString("LLOADADDR"));
                  lvo.setLaddr(rsRs.getString("LADDR"));
                  lvo.setLphoto(rsRs.getString("LPHOTO"));
                  lvo.setLdeleteYN(rsRs.getString("LDELETEYN"));
                  lvo.setLinsertdate(rsRs.getString("LINSERTDATE"));
                  lvo.setLupdatedate(rsRs.getString("LUPDATEDATE"));
                  aList.add(lvo);
               }
               System.out.println("aList >>> : " + aList);
               System.out.println("aList.size() >>> : " + aList.size());
            }else{
               System.out.println("데이터가 없습니다");
            }
            
            LdbConnProperty.conClose(con, pstmt, rsRs);
         
      }catch(Exception e){
         System.out.println("오류가 발생했습니다 " +  e.getMessage());
      }finally{
         LdbConnProperty.conClose(con, pstmt, rsRs);
      }

      System.out.println("(log) LdbMemberScr.LdbMemberDAO.likeSearchLdbMember() 함수 종료");
      
      return aList;
   }

   //로그인
   public ArrayList<LdbMemberVO> loginLdbMember(LdbMemberVO i_lvo){
      System.out.println("(log) LdbMemberScr.LdbMemberDAO.loginLdbMember() 함수 진입");
      System.out.println("i_lvo 참조변수 주소값 : " + i_lvo );
      System.out.println("매개변수 확인 : " + i_lvo.getLid() + " / " + i_lvo.getLpw() );
      
      
      Connection con = null;
      ResultSet rsRs = null;
      PreparedStatement pstmt= null;
      
      ArrayList<LdbMemberVO> aList = null;
      LdbMemberVO lvo = null;
      
      try{
         System.out.println("(log) LdbMemberScr.LdbConnProperty.getConnection() 함수 실행");
         con = LdbConnProperty.getConnection();
         
         System.out.println("(log) LdbMemberScr.LdbConnProperty.prepareStatement.getLoginQuery() 함수 실행");
         pstmt = con.prepareStatement(LdbSqlQueryMap.getLoginQuery());
         
         System.out.println("LdbSqlQueryMap.getLoginQuery() >>> : " +  LdbSqlQueryMap.getLoginQuery());
         
         
         pstmt.setString(1, i_lvo.getLid());
         pstmt.setString(2, i_lvo.getLpw());
         
         System.out.println("변수 확인 " + i_lvo.getLid() + " / " + i_lvo.getLpw() );

         System.out.println("(log) LdbMemberScr.pstmt.executeQuery() 함수 실행 "); 
         rsRs = pstmt.executeQuery();
         
         
         
         if(rsRs != null){
            
            aList = new ArrayList<LdbMemberVO>();
            
            while(rsRs.next()){
               lvo = new LdbMemberVO();
               
               lvo.setLid(rsRs.getString(1));
               lvo.setLpw(rsRs.getString(2));
               lvo.setLdeleteYN(rsRs.getString(3));
               
               aList.add(lvo);
            }
            System.out.println("aList >>> : " + aList);
            System.out.println("aList.size() >>> : " + aList.size());
         }else{
            System.out.print("데이터가 존재하지 않습니다!");
         }
         
         
      }catch(Exception e){
         System.out.println("오류 발생 >>> : " + e.getMessage());
      }finally{
         LdbConnProperty.conClose(con, pstmt, rsRs);
      }
      
      System.out.println("(log) LdbMemberScr.LdbMemberDAO.loginLdbMember() 함수 종료");
      return aList;

   }//end of login
   
   //아이디 체크 함수
   
   public boolean idCheck(LdbMemberVO i_lvo){
      
      Connection conn       = null;
      PreparedStatement pstmt = null;
      ResultSet   rsRs       = null;
      LdbMemberVO lvo       = null;
      

      int idNcnt = 0;
      boolean bool = false;

      try{
      
         System.out.println("(log) LdbMemberScr.LdbCheabunClass.LdbConnProperty.getConnection() 함수 실행 ");
         conn = LdbConnProperty.getConnection();
         System.out.println("DB 주소 연결  >>> " + conn);
         
         System.out.println("(log) LdbMemberScr.LdbCheabunClass.LdbConnProperty.prepareStatement.CHECK_ID 쿼리 실행 ");
         pstmt = conn.prepareStatement(LdbSqlQueryMap.CHECK_ID);
         
         pstmt.setString(1, i_lvo.getLid());
         
         System.out.println("EciSqlQueryMap.CHECK_ID : \n" + LdbSqlQueryMap.CHECK_ID);
         
         System.out.println("(log) LdbMemberScr.LdbCheabunClass.LdbConnProperty.executeQuery() 함수 실행 ");
         
         
         idNcnt = pstmt.executeUpdate();
         
         System.out.println("값확인하기 >>> : " + idNcnt);
         
         
      }catch(Exception e){
         System.out.println("에러가 >>> : " + e.getMessage());
      }finally{
         LdbConnProperty.conClose(conn, pstmt, rsRs);
         try{LdbConnProperty.conClose(conn, pstmt, rsRs);
         }catch(Exception e2){
            System.out.println("문제가 발생했습니다 >>> : " + e2.getMessage());
         }

      if (idNcnt == 0){
         bool = true;
      }else{
         bool= false;
      }
      }
      
      return bool;
   }
   
}//end of class
