package bitcamp.java142.ch5.ldbjf.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public abstract class LdbConnProperty {
	//연결 정보
	public static final String ORACLE11G_JDBCDRIVER =
		         "oracle.jdbc.driver.OracleDriver";
	public static final String ORACLE11G_URL =
		         "jdbc:oracle:thin:@127.0.0.1:1521:orclBEE";
	public static final String ORACLE11G_USER = "scott";
	public static final String ORACLE11G_PASS = "tiger";


	
	public static Connection getConnection() throws Exception {

		Connection conn = null;
		Class.forName(ORACLE11G_JDBCDRIVER);
		conn = DriverManager.getConnection(ORACLE11G_URL, ORACLE11G_USER, ORACLE11G_PASS);
		
		return conn;
	}
	
	
	public static void conClose(Connection conn, PreparedStatement pstmt, ResultSet rsRs){
		try{
			if(rsRs == null) 
				try { 
					rsRs.close(); 
					rsRs = null ; 
				}catch(Exception e){ 
				}

		
		if(pstmt == null) try {pstmt.close(); pstmt = null ; }catch(Exception e){ }
		if(conn == null) try {conn.close(); conn = null ; }catch(Exception e){}
		}catch(Exception e){
		}
	}
	
	public static void conClose(Connection conn, PreparedStatement pstmt){
		try{
		if(pstmt == null) try {pstmt.close(); pstmt = null ; }catch(Exception e){}
		if(conn == null) try {conn.close(); conn = null ; }catch(Exception e){}
		}catch(Exception e){
		}
	}
}//end of class
