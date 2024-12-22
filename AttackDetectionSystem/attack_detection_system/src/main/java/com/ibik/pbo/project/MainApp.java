package com.ibik.pbo.project;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MainApp extends JFrame implements ActionListener {

    private JButton btnAddLog, btnViewLog, btnUpdateLog, btnDeleteLog, btnDetectAnomalies, btnExit;

    private void showLoginDialog() {
        JDialog loginDialog = new JDialog((Frame) null, "Login", true);
        loginDialog.setSize(350, 300);
        loginDialog.setResizable(false);

        JPanel loginPanel = new JPanel();
        loginPanel.setLayout(new BoxLayout(loginPanel, BoxLayout.Y_AXIS));
        loginPanel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));

        JPanel emailPanel = new JPanel();
        emailPanel.setLayout(new FlowLayout(FlowLayout.LEFT));
        JLabel emailLabel = new JLabel("Username:");
        JTextField emailField = new JTextField(30);
        emailField.setPreferredSize(new Dimension(300, 30));
        emailPanel.add(emailLabel);
        emailPanel.add(emailField);
        
        JPanel passwordPanel = new JPanel();
        passwordPanel.setLayout(new FlowLayout(FlowLayout.LEFT));
        JLabel passwordLabel = new JLabel("Password:");
        JPasswordField passwordField = new JPasswordField(30);
        passwordField.setPreferredSize(new Dimension(300, 30));
        passwordPanel.add(passwordLabel);
        passwordPanel.add(passwordField);

        JButton loginButton = new JButton("Login");
        loginButton.addActionListener(e -> {
            String email = emailField.getText().trim();
            String password = new String(passwordField.getPassword()).trim();

            if (email.isEmpty() || password.isEmpty()) {
                JOptionPane.showMessageDialog(loginDialog, "Username and Password cannot be empty!", "Validation Error", JOptionPane.WARNING_MESSAGE);
                return;
            }

            if (validateCredentials(email, password)) {
                JOptionPane.showMessageDialog(loginDialog, "Login successful!", "Success", JOptionPane.INFORMATION_MESSAGE);
                loginDialog.dispose();
            } else {
                JOptionPane.showMessageDialog(loginDialog, "Invalid username or password!", "Login Error", JOptionPane.ERROR_MESSAGE);
            }
        });

        loginPanel.add(emailPanel);
        loginPanel.add(Box.createVerticalStrut(10));
        loginPanel.add(passwordPanel);
        loginPanel.add(Box.createVerticalStrut(20));
        loginPanel.add(loginButton);

        loginDialog.add(loginPanel);
        loginDialog.setLocationRelativeTo(null);
        loginDialog.setVisible(true);
    }
    private boolean validateCredentials(String username, String password) {
        try (Connection conn = DatabaseConnection.connect()) {
            String query = "SELECT username FROM users WHERE username = ? AND password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, username);
                stmt.setString(2, password);
                try (ResultSet rs = stmt.executeQuery()) {
                    return rs.next();
                }
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Database error: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        return false;
    }

    private void launchMainApp() {
        SwingUtilities.invokeLater(MainApp::new); 
    }

    public MainApp() {
        setTitle("Sistem Intrusion Detection");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(400, 400);
        setLayout(new GridLayout(6, 1)); 

        btnAddLog = new JButton("Tambah Log");
        btnViewLog = new JButton("Lihat Log");
        btnUpdateLog = new JButton("Perbarui Log");
        btnDeleteLog = new JButton("Hapus Log");
        btnDetectAnomalies = new JButton("Deteksi Anomali");
        btnExit = new JButton("Keluar");

        btnAddLog.addActionListener(this);
        btnViewLog.addActionListener(this);
        btnUpdateLog.addActionListener(this);
        btnDeleteLog.addActionListener(this);
        btnDetectAnomalies.addActionListener(this);
        btnExit.addActionListener(this);

        add(btnAddLog);
        add(btnViewLog);
        add(btnUpdateLog);
        add(btnDeleteLog);
        add(btnDetectAnomalies);
        add(btnExit);

        setVisible(false);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == btnAddLog) {
            SwingUtilities.invokeLater(() ->  new LogManager().insertLogsDirectly());
        } else if (e.getSource() == btnViewLog) {
            SwingUtilities.invokeLater(() -> new LogManager().readLogsDirectly());
        } else if (e.getSource() == btnUpdateLog) {
            SwingUtilities.invokeLater(() -> new LogManager().updateLogDirectly());
        } else if (e.getSource() == btnDeleteLog) {
            SwingUtilities.invokeLater(() -> new LogManager().deleteLogDirectly());
        } else if (e.getSource() == btnDetectAnomalies) {
            AnomalyDetection anomalyDetection = new AnomalyDetection();
            anomalyDetection.show(); 
            anomalyDetection.detectAnomalies(anomalyDetection.getResultTextArea());
        } else if (e.getSource() == btnExit) {
            System.out.println("Sistem dihentikan.");
            System.exit(0);
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            MainApp app = new MainApp();
            app.showLoginDialog();
            app.setVisible(true);
        });
    }

}
