package bitcamp.java142.board.sql;

public abstract class LdbBoardSqlMap {
	
	
	
	public static final String LDB_BOARD_CHEABUN =
		" SELECT  /*+ INSERT_DESC(A.SYS_C0000000) */  " 
        + " NVL(MAX(SUBSTR(A.LNO, -4)),0) + 1 COMMNO FROM M2_LDB_BOARD A ";

	public static final String CHECK_PW = 
			"SELECT A.LPW FROM M2_LDB_BOARD A WHERE A.LPW = ? AND 1=1";

	
	public static String getInsertQuery(){
		StringBuffer sb = new StringBuffer();
		
		sb.append(" INSERT INTO M2_LDB_BOARD(              \n ");
		sb.append("                             LNO         \n ");
		sb.append("                            ,LSUBJECT    \n ");
		sb.append("                            ,LNAME	    \n ");
		sb.append("                            ,LPW		    \n ");
		sb.append("                            ,LMEMO	    \n ");
		sb.append("                            ,LPHOTO	    \n ");
		sb.append("                            ,LDELETEYN   \n ");
		sb.append("                            ,LINSERTDATE	\n ");
		sb.append("                            ,LUPDATEDATE)\n ");
		sb.append(" VALUES(                                 \n ");
		sb.append("            ?                            \n ");
		sb.append("            ,?                     	    \n ");
		sb.append("            ,?                    	    \n ");
		sb.append("            ,?                     	    \n ");
		sb.append("            ,?                     	    \n ");
		sb.append("            ,?                    	    \n ");
		sb.append("            ,?                    	    \n ");
		sb.append("            ,SYSDATE                     \n ");
		sb.append("            ,SYSDATE                    )\n ");
		
		return sb.toString();
	}
	
	public static String getSelectAllQuery(){
		
		StringBuffer sb = new StringBuffer();
		
		sb.append(" SELECT   A.LNO           LNO   		  \n ");
		sb.append("         ,A.LSUBJECT      LSUBJECT  	  \n ");
		sb.append("         ,A.LNAME         LNAME   	  \n ");
		sb.append("         ,A.LPW           LPW  	      \n ");
		sb.append("         ,A.LMEMO         LMEMO  	  \n ");
		sb.append("         ,A.LPHOTO        LPHOTO  	  \n ");
		sb.append("         ,A.LDELETEYN     LDELETEYN    \n ");
		sb.append("         ,TO_CHAR(A.LINSERTDATE, 'YYYY-MM-DD')  LINSERTDATE \n ");
		sb.append("         ,TO_CHAR(A.LUPDATEDATE, 'YYYY-MM-DD')  LUPDATEDATE \n ");
		sb.append(" FROM    M2_LDB_BOARD A				  \n ");
		sb.append(" WHERE   1=1							  \n ");
		sb.append(" AND		A.LDELETEYN = 'Y'		 	  \n ");
		sb.append(" ORDER BY 1							  \n ");
		
		return sb.toString();
		
	}
	
	
	public static String getSelectQuery(){
		StringBuffer sb = new StringBuffer();
		
		sb.append(" SELECT   A.LNO           LNO   		  \n ");
		sb.append("         ,A.LSUBJECT      LSUBJECT  	  \n ");
		sb.append("         ,A.LNAME         LNAME   	  \n ");
		sb.append("         ,A.LPW           LPW  	      \n ");
		sb.append("         ,A.LMEMO         LMEMO  	  \n ");
		sb.append("         ,A.LPHOTO        LPHOTO  	  \n ");
		sb.append("         ,A.LDELETEYN     LDELETEYN    \n ");
		sb.append("         ,TO_CHAR(A.LINSERTDATE, 'YYYY-MM-DD')  LINSERTDATE \n ");
		sb.append("         ,TO_CHAR(A.LUPDATEDATE, 'YYYY-MM-DD')  LUPDATEDATE \n ");
		sb.append(" FROM    M2_LDB_BOARD A				  \n ");
		sb.append(" WHERE   A.LNO = ?					  \n ");
		sb.append(" AND		1=1							  \n ");
		sb.append(" AND		A.LDELETEYN = 'Y'		 	  \n ");
		sb.append(" ORDER BY 1							  \n ");
		
		return sb.toString();
	}
	
	public static String getUpdateQuery(){
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("	UPDATE  M2_LDB_BOARD 		   	\n ");
		sb.append(" SET     LSUBJECT	 = ?		\n ");
		sb.append("	        ,LMEMO		 = ?		\n ");
		sb.append("	        ,LPHOTO		 = ?		\n ");
		sb.append("         ,LUPDATEDATE = SYSDATE 	\n ");
		sb.append(" WHERE   LDELETEYN 	 = 'Y'		\n ");
		sb.append(" AND     LNO      	 = ?			\n ");
		return sb.toString();
	}
	
	public static String getDeleteQuery(){
		StringBuffer sb = new StringBuffer();
		
		sb.append("	UPDATE  M2_LDB_BOARD 		   	\n ");
		sb.append(" SET     LDELETEYN 	 = 'N'		\n ");
		sb.append("         ,LUPDATEDATE = SYSDATE 	\n ");
		sb.append(" WHERE   LDELETEYN 	 = 'Y'		\n ");
		sb.append(" AND     LNO      	 = ?		\n ");
		return sb.toString();
		
	}
}//end of class
