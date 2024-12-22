package com.ibik.pbo.project;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.sql.*;

public class AnomalyDetection {
    private JFrame frame;
    private JTextArea resultTextArea;
    private JButton detectButton;

    public AnomalyDetection() {
        frame = new JFrame("Anomaly Detection");
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        frame.setSize(500, 400);
        frame.setLayout(new BorderLayout());

        resultTextArea = new JTextArea();
        resultTextArea.setEditable(false);
        JScrollPane scrollPane = new JScrollPane(resultTextArea);

        detectButton = new JButton("Detect Anomalies");
        detectButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                detectAnomalies(resultTextArea);  
            }
        });

        frame.add(detectButton, BorderLayout.NORTH);
        frame.add(scrollPane, BorderLayout.CENTER);
    }

    public void show() {
        frame.setVisible(true);
    }

    public static void detectAnomalies(JTextArea resultTextArea) {
        resultTextArea.setText("");  
        boolean anomalyDetected = false; 
        try (Connection connection = DatabaseConnection.connect()) {
            String query = "SELECT MIN(log_id) AS log_id, url, COUNT(*) AS access_count " +
                    "FROM logs GROUP BY url HAVING access_count > 30";
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                anomalyDetected = true; 
                int logId = rs.getInt("log_id");
                String url = rs.getString("url");
                int count = rs.getInt("access_count");
                resultTextArea.append("Anomaly detected: URL = " + url + ", Access count = " + count + "\n");

                String anomalyQuery = "INSERT INTO anomalies (log_id, status) VALUES (?, 'Intrusion')";
                PreparedStatement anomalyStmt = connection.prepareStatement(anomalyQuery);
                anomalyStmt.setInt(1, logId);
                anomalyStmt.executeUpdate();
            }

            if (!anomalyDetected) {
                resultTextArea.append("No anomalies detected. Status: Normal.\n");  
            }

            resultTextArea.append("Anomaly detection process completed.\n");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    public JTextArea getResultTextArea() {
        return resultTextArea;
    }


    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                AnomalyDetection gui = new AnomalyDetection();
                gui.show();
            }
        });
    }
}
