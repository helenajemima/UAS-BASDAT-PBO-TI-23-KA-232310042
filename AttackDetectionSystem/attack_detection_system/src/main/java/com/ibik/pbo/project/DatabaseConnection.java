package com.ibik.pbo.project;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
    public static Connection connect() {
        try {
            String url = "jdbc:mysql://localhost:3306/intrusion_detection_system";
            String user = "root";
            String password = "";
            Connection connection = DriverManager.getConnection(url, user, password);
            System.out.println("Koneksi berhasil!");
            return connection;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
