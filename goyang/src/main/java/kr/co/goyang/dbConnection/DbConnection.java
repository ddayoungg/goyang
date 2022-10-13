package kr.co.goyang.dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * DB연동을 보다 신속 제공하는 일
 */

public class DbConnection {
	
	private static DbConnection dbConn;
	
	private DbConnection() {
		// TODO Auto-generated constructor stub
	}
	
	public static DbConnection getInstance() {
		if(dbConn==null) {
			dbConn=new DbConnection();
		}
		
		return dbConn;
	}
	
	//DBMS와 연동된 Connection을 반환하는 일
	public Connection getConn() throws SQLException{
		Connection con=null;
		//1.드라이버 로딩
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//2.Connection 얻기
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String id="goyang";
		String pass="tour";
		con=DriverManager.getConnection(url, id, pass);
		
		return con;
	}
	
	//DBMS와 연결되어 사용된 객체를 닫는 일
	public void dbClose(ResultSet rs,Statement stmt,Connection con) throws SQLException{
		if(rs!=null) {rs.close();}
		if(stmt!=null) {stmt.close();}
		if(con!=null) {con.close();}
	}

}
