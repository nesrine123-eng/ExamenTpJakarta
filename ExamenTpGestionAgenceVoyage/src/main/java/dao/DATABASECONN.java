package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DATABASECONN {
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver"; 
    private static final String URL = "jdbc:mysql://localhost:3306/hotel_management"; 
    private static final String USER = "root"; 
    private static final String PASSWORD = ""; 
    private static Connection connection;

   
    private DATABASECONN() {}

   
    private static void initConnection() {
        try {
                 Class.forName(DRIVER);

          
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connection established successfully.");
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Failed to establish database connection.");
            e.printStackTrace();
        }
    }

   
    public static Connection getInstance() {
        if (connection == null) {
            initConnection();
        }
        return connection;
    }
}
