package controller;

import jakarta.servlet.ServletException;
import controller.KetNoi;
import java.sql.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class AddNhansu
 */
@WebServlet("/AddNhansu")
public class AddNhansu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNhansu() {
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
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String hometown = request.getParameter("hometown");
        String position = request.getParameter("position");
        int quyen = Integer.parseInt(request.getParameter("quyen"));
        Connection conn = null;

        try {
            conn = KetNoi.getConnection();
            String sql = "INSERT INTO dsnhanvien (hoten, ngaysinh, gioitinh, quequan, chucvu, quyentc) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, dob);
            ps.setString(3, gender);
            ps.setString(4, hometown);
            ps.setString(5, position);
            ps.setInt(6, quyen);
            ps.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/DanhSachNV.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h3>Thêm nhân sự thất bại: " + e.getMessage() + "</h3>");
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
	}

}
