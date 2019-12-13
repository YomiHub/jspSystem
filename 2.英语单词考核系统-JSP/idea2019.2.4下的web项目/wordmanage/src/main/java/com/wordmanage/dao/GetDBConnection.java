package com.wordmanage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class GetDBConnection {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/";
    static final String USER = "root";
    static final String PASS = "rootpass";

    public static Connection connectDB() {
        String p = "rootpass";
        String id = "root";
        String DBName = "wordmanager";
        Connection conn = null;
        Statement stmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/"+DBName+"?characterEncoding=gbk", id, p);
            System.out.println("connecting database"+ DBName);
        } catch (SQLException var19) {
            var19.printStackTrace();
        } catch (Exception var20) {
            var20.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException var18) {

            }
        }

        return conn;
    }
}
