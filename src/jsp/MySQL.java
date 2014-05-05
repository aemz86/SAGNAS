package jsp;

import java.sql.*;
import com.mysql.jdbc.Connection;

public class MySQL {

	public static Connection connect() {
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			return (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mcc_sagnas", "root", "root");
		}catch(Exception e){
			throw new Error(e);
		}
	}
	public static boolean close(Connection c){
		try{
			c.close();
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
}
