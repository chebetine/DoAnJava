package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import controller.KetNoi;
import java.sql.*;

@WebServlet("/ThemMN")
public class ThemMN extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ThemMN() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        String level = request.getParameter("option1");
        String name = request.getParameter("nameMN");
        String parent = request.getParameter("option2"); 
        String link = request.getParameter("link");

        if (name != null && !name.isEmpty() && link != null && !link.isEmpty()) {
            Connection connection = null;
            PreparedStatement preparedStatement = null;

            try {
                // Kết nối tới cơ sở dữ liệu
                connection = KetNoi.getConnection();
                
                // Câu lệnh SQL để thêm menu vào bảng dsmenu
                String sql = "INSERT INTO dsmenu (NameMenu, Level, Link, Parent) VALUES (?, ?, ?, ?)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, name);
                preparedStatement.setInt(2, Integer.parseInt(level));
                preparedStatement.setString(3, link);
                preparedStatement.setString(4, parent); // Parent là MenuID, vẫn là chuỗi

                int rowsInserted = preparedStatement.executeUpdate();

                if (rowsInserted > 0) {
                    request.setAttribute("message", "Thêm menu thành công!");
                } else {
                    request.setAttribute("message", "Có lỗi xảy ra, vui lòng thử lại.");
                }
                
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("message", "Lỗi cơ sở dữ liệu: " + e.getMessage());
            } finally {
                if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (connection != null) try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
            }

            request.getRequestDispatcher("ThemMN.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Vui lòng điền đầy đủ thông tin!");
            request.getRequestDispatcher("ThemMN.jsp").forward(request, response);
        }
    }
}
