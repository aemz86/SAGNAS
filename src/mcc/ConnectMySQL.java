package mcc;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.ResultSet;  
import java.sql.Statement;  
  

public class ConnectMySQL {  
    public static void main(String[] args) {  
        try {  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection connection = DriverManager.getConnection(  
                    "jdbc:mysql://localhost:3306/mcc", "root", "root");  
            Statement statement = connection.createStatement();  
            ResultSet resultSet = statement  
                    .executeQuery("SELECT * FROM login");  
            while (resultSet.next()) {  
                System.out.println("Password:"  
                        + resultSet.getString("password"));  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
}  