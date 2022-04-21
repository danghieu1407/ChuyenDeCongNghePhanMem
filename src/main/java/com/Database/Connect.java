package com.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Connect {
    public Connection conn = null;

    public static Connection connectSQL() throws SQLException {
        try {
            String username = "sa";
            String pass = "123456";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionUrl = "jdbc:sqlserver://localhost;database=CDCNPM";
            Connection con = DriverManager.getConnection(connectionUrl, username, pass);
            System.out.println("Ket noi thanh cong");
            return con;
        } catch (Exception e) {
            System.out.println("Ket noi that bai");
            e.printStackTrace();
        }
        return null;

    }

    public static Connection getConnection() {
        return null;
    }
}