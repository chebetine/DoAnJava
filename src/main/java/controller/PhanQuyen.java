package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class PhanQuyen
 */
@WebServlet("/PhanQuyen")
public class PhanQuyen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhanQuyen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idNhanvien = Integer.parseInt(request.getParameter("idNhanvien"));
        int quyen = Integer.parseInt(request.getParameter("quyen"));

        Connection connection = null;
        PreparedStatement pstmt = null;

        try {
            connection = KetNoi.getConnection();
            String sql = "UPDATE dsnhanvien SET quyentc = ? WHERE idnhanvien = ?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, quyen);
            pstmt.setInt(2, idNhanvien);

            int rowUpdated = pstmt.executeUpdate();
            if (rowUpdated > 0) {
                response.sendRedirect("QuyenTC.jsp?success=1");
                request.getSession().setAttribute("successMessage", "Cập nhật quyền thành công.");
            } else {
                response.sendRedirect("QuyenTC.jsp?error=1");
                request.getSession().setAttribute("errorMessage", "Cập nhật quyền không thành công.");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("QuyenTC.jsp?error=1");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}
}

	
