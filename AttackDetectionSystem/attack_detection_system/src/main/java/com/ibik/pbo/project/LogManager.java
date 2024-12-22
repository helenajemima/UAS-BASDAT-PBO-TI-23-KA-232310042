package com.ibik.pbo.project;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import java.util.ArrayList;

public class LogManager extends JFrame implements ActionListener {
	
	public void insertLogsDirectly() {
	       JFrame frame = new JFrame("Intrusion Detection System");
	        frame.setSize(400, 300);
	        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

	        JLabel urlLabel = new JLabel("URL:");
	        JTextField urlField = new JTextField();
	        JLabel durationLabel = new JLabel("Durasi (detik):");
	        JTextField durationField = new JTextField();
	        JButton submitButton = new JButton("Submit");

	        urlLabel.setBounds(50, 50, 100, 25);
	        urlField.setBounds(150, 50, 200, 25);
	        durationLabel.setBounds(50, 100, 100, 25);
	        durationField.setBounds(150, 100, 200, 25);
	        submitButton.setBounds(150, 150, 100, 30);

	        frame.add(urlLabel);
	        frame.add(urlField);
	        frame.add(durationLabel);
	        frame.add(durationField);
	        frame.add(submitButton);

	        frame.setLayout(null);
	        frame.setVisible(true);

	        submitButton.addActionListener(new ActionListener() {
	            @Override
	            public void actionPerformed(ActionEvent e) {
	                String url = urlField.getText().trim();
	                int duration;
	                try {
	                    if (url.isEmpty()) {
	                        JOptionPane.showMessageDialog(frame, "URL tidak boleh kosong.");
	                        return;
	                    }

	                    duration = Integer.parseInt(durationField.getText().trim());
	                    if (duration <= 0) {
	                        JOptionPane.showMessageDialog(frame, "Durasi harus lebih besar dari 0 detik.");
	                        return;
	                    }

	                    new Thread(() -> insertLogsWithDuration(url, duration)).start();
	                } catch (NumberFormatException ex) {
	                    JOptionPane.showMessageDialog(frame, "Durasi harus berupa angka valid.");
	                }
	            }
	        });
	    }

	    public static void insertLogsWithDuration(String url, int duration) {
	        long startTime = System.currentTimeMillis();
	        long endTime = startTime + (duration * 1000);

	        try (Connection connection = DatabaseConnection.connect()) {
	            String query = "INSERT INTO logs (url, access_time) VALUES (?, NOW())";

	            while (System.currentTimeMillis() < endTime) {
	                try (PreparedStatement stmt = connection.prepareStatement(query)) {
	                    stmt.setString(1, url);
	                    stmt.executeUpdate();
	                    System.out.println("Log disimpan untuk URL: " + url);
	                }
	                Thread.sleep(1000);
	            }

	            SwingUtilities.invokeLater(() -> JOptionPane.showMessageDialog(null, 
	                "Data berhasil disimpan untuk durasi " + duration + " detik."));
	            checkAnomaly(url);
	        } catch (Exception ex) {
	            ex.printStackTrace();
	            SwingUtilities.invokeLater(() -> JOptionPane.showMessageDialog(null, 
	                "Terjadi kesalahan saat menyimpan data."));
	        }
	    }

	    public static void checkAnomaly(String url) {
	        try (Connection connection = DatabaseConnection.connect()) {
	            String query = "SELECT COUNT(*) AS access_count FROM logs WHERE url = ?";
	            try (PreparedStatement stmt = connection.prepareStatement(query)) {
	                stmt.setString(1, url);
	                ResultSet rs = stmt.executeQuery();

	                if (rs.next()) {
	                    int count = rs.getInt("access_count");
	                    if (count > 30) {
	                        System.out.println("Anomali terdeteksi untuk URL: " + url + " dengan jumlah akses: " + count);

	                        String anomalyQuery = "INSERT INTO anomalies (log_id, status) " +
	                                "VALUES ((SELECT MIN(log_id) FROM logs WHERE url = ?), 'Intrusion')";
	                        try (PreparedStatement anomalyStmt = connection.prepareStatement(anomalyQuery)) {
	                            anomalyStmt.setString(1, url);
	                            anomalyStmt.executeUpdate();
	                        }

	                        SwingUtilities.invokeLater(() -> JOptionPane.showMessageDialog(null, 
	                            "Status: Anomaly (Intrusion)"));
	                    } else {
	                        System.out.println("Normal: Count = " + count);
	                        SwingUtilities.invokeLater(() -> JOptionPane.showMessageDialog(null, "Status: Normal"));
	                    }
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            SwingUtilities.invokeLater(() -> JOptionPane.showMessageDialog(null, 
	                "Terjadi kesalahan saat memeriksa anomali."));
	        }
	    }

	public void readLogsDirectly() {
	    try (Connection connection = DatabaseConnection.connect()) {
	        String query = "SELECT * FROM logs";
	        Statement stmt = connection.createStatement();
	        ResultSet rs = stmt.executeQuery(query);

	        ResultSetMetaData metaData = rs.getMetaData();
	        int columnCount = metaData.getColumnCount();
	        String[] columnNames = new String[columnCount];
	        for (int i = 1; i <= columnCount; i++) {
	            columnNames[i - 1] = metaData.getColumnName(i);
	        }

	        ArrayList<String[]> data = new ArrayList<>();
	        while (rs.next()) {
	            String[] row = new String[columnCount];
	            for (int i = 1; i <= columnCount; i++) {
	                row[i - 1] = rs.getString(i);
	            }
	            data.add(row);
	        }

	        String[][] tableData = data.toArray(new String[0][]);

	        JTable table = new JTable(tableData, columnNames);
	        JScrollPane scrollPane = new JScrollPane(table);

	        JOptionPane.showMessageDialog(
	            this,
	            scrollPane,
	            "Logs",
	            JOptionPane.INFORMATION_MESSAGE
	        );
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        JOptionPane.showMessageDialog(this, "Error reading logs.", "Error", JOptionPane.ERROR_MESSAGE);
	    }
	}


    public void updateLogDirectly() {
        String logId = JOptionPane.showInputDialog(this, "Enter Log ID to update:");
        String url = JOptionPane.showInputDialog(this, "Enter new URL:");
        if (logId != null && url != null && !logId.isEmpty() && !url.isEmpty()) {
            try (Connection connection = DatabaseConnection.connect()) {
                String query = "UPDATE logs SET url = ? WHERE log_id = ?";
                PreparedStatement stmt = connection.prepareStatement(query);
                stmt.setString(1, url);
                stmt.setInt(2, Integer.parseInt(logId));
                int rowsUpdated = stmt.executeUpdate();

                if (rowsUpdated > 0) {
                    JOptionPane.showMessageDialog(this, "Log successfully updated.", "Success", JOptionPane.INFORMATION_MESSAGE);
                } else {
                    JOptionPane.showMessageDialog(this, "Log not found.", "Error", JOptionPane.ERROR_MESSAGE);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(this, "Error updating log.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    public void deleteLogDirectly() {
        String logId = JOptionPane.showInputDialog(this, "Enter Log ID to delete:");
        if (logId != null && !logId.isEmpty()) {
            try (Connection connection = DatabaseConnection.connect()) {
                String query = "DELETE FROM logs WHERE log_id = ?";
                PreparedStatement stmt = connection.prepareStatement(query);
                stmt.setInt(1, Integer.parseInt(logId));
                int rowsDeleted = stmt.executeUpdate();

                if (rowsDeleted > 0) {
                    JOptionPane.showMessageDialog(this, "Log successfully deleted.", "Success", JOptionPane.INFORMATION_MESSAGE);
                } else {
                    JOptionPane.showMessageDialog(this, "Log not found.", "Error", JOptionPane.ERROR_MESSAGE);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(this, "Error deleting log.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }


    public static void main(String[] args) {
        SwingUtilities.invokeLater(LogManager::new);
    }

	@Override
	public void actionPerformed(ActionEvent e) {
	}
}
