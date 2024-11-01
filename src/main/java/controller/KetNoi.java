package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class KetNoi {
    private static Connection conn;

    public static Connection getConnection() throws SQLException {
        String userName = "root";
        String pass = "123456";
        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlynhansu", userName, pass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        if (conn != null) {
            System.out.println("Ket noi thanh cong");
        } else {
            System.out.println("Ket noi that bai");
        }

        return conn; // Trả về đối tượng Connection
    }

}
