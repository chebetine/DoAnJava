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
 * Servlet implementation class UpdateNsServlet
 */
@WebServlet("/UpdateNsServlet")
public class UpdateNsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNsServlet() {
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

       
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String hometown = request.getParameter("hometown");
        String position = request.getParameter("position");
        int quyen = Integer.parseInt(request.getParameter("quyen"));
        Connection conn = null;

        try {
            conn = KetNoi.getConnection();
            String sql = "UPDATE nhanvien SET hoten=?, ngaysinh=?, gioitinh=?, quequan=?, chucvu=?, quyentc=? WHERE idNhanVien=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, dob);
            ps.setString(3, gender);
            ps.setString(4, hometown);
            ps.setString(5, position);
            ps.setInt(6, quyen);
            ps.setInt(7, id);
            ps.executeUpdate();

            
            response.sendRedirect(request.getContextPath() + "/DanhSachNV.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h3>Sửa nhân sự thất bại: " + e.getMessage() + "</h3>");
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
