
package dao;

import java.sql.Connection;

public class TestConn {
    public static void main(String[] args) {
        Connection conn = DATABASECONN.getInstance();
        if (conn != null) {
            System.out.println("Connection successful!");
        } else {
            System.out.println("Connection failed.");
        }
    }
}
