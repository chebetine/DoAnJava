package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class TaoYC
 */
@WebServlet("/TaoYC")
public class TaoYC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaoYC() {
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

	    // Lấy các tham số từ form
	    String idNhanVien = request.getParameter("idNhanVien"); // Lấy ID nhân viên từ dropdown
	    String ngayyc = request.getParameter("ngayyc");
	    String yeucau = request.getParameter("loaiyc");
	    String ngaybd = request.getParameter("ngaybd");
	    String ngaykt = request.getParameter("ngaykt");
	    String trthai = request.getParameter("tthai");
	    String mota = request.getParameter("mota");
	    String phanhoi = request.getParameter("phanhoi");
	    Connection conn = null;

	    try {
	        // Kết nối cơ sở dữ liệu
	        conn = KetNoi.getConnection();
	        String sql = "INSERT INTO qlyeucau (idnhanvien, LoaiYC, NgayYC, NgayBD, NgayKT, TrangThai, MoTa, PhanHoi) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        
	        // Thiết lập các giá trị cho PreparedStatement
	        ps.setString(1, idNhanVien); // Sử dụng idNhanVien thay vì name
	        ps.setString(2, yeucau);
	        ps.setString(3, ngayyc);
	        ps.setString(4, ngaybd);
	        ps.setString(5, ngaykt);
	        ps.setString(6, trthai);
	        ps.setString(7, mota);
	        ps.setString(8, phanhoi);
	        
	        // Thực thi câu lệnh INSERT
	        ps.executeUpdate();

	        // Chuyển hướng sau khi thêm thành công
	        response.sendRedirect(request.getContextPath() + "/DanhSachYC.jsp");
	    } catch (SQLException e) {
	        e.printStackTrace();
	        out.println("<h3>Thêm yêu cầu thất bại: " + e.getMessage() + "</h3>");
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
