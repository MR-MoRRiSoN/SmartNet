package com.example.smartnet.connection;

import java.sql.DriverManager;
import java.sql.Statement;

public class Connection {
    public static Statement connect()

    {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            java.sql.Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=WebAppSmartnet;user=testuser;password=123456;encrypt=false");
            return connection.createStatement();

        } catch (Exception e) {
            return null;
        }
    }





}
