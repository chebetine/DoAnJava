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
 * Servlet implementation class ChamCong
 */
@WebServlet("/ChamCong")
public class ChamCong extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChamCong() {
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

	    String thangStr = request.getParameter("thang");
	    String namStr = request.getParameter("nam");
	    int thang = 0;
	    int nam = 0;

	    if (thangStr != null && !thangStr.isEmpty()) {
	        thang = Integer.parseInt(thangStr);
	    }
	    if (namStr != null && !namStr.isEmpty()) {
	        nam = Integer.parseInt(namStr);
	    }

	    Connection conn = null;

	    try {
	        conn = KetNoi.getConnection();
	        String sql = "INSERT INTO dschamcong (Thang, Nam, idnhanvien, SoNgayFull, NuaNgay, NgayNghi, GioLamThem, DiemTong) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	        PreparedStatement ps = conn.prepareStatement(sql);

	        for (String paramName : request.getParameterMap().keySet()) {
	            if (paramName.startsWith("songay_")) {
	                String idnhanvien = paramName.split("_")[1]; 
	                String songay = request.getParameter("songay_" + idnhanvien);
	                String nuangay = request.getParameter("nuangay_" + idnhanvien);
	                String ngaynghi = request.getParameter("ngaynghi_" + idnhanvien);
	                String sogio = request.getParameter("sogio_" + idnhanvien);
	                

	                int soNgayFull = (songay != null && !songay.isEmpty()) ? Integer.parseInt(songay) : 0;
	                int nuaNgay = (nuangay != null && !nuangay.isEmpty()) ? Integer.parseInt(nuangay) : 0;
	                int ngayNghi = (ngaynghi != null && !ngaynghi.isEmpty()) ? Integer.parseInt(ngaynghi) : 0;
	                int gioLamThem = (sogio != null && !sogio.isEmpty()) ? Integer.parseInt(sogio) : 0;
	                
	                int diemTong = soNgayFull * 2 + nuaNgay - ngayNghi * 2 + gioLamThem;

	                ps.setInt(1, thang); 
	                ps.setInt(2, nam); 
	                ps.setString(3, idnhanvien);
	                ps.setInt(4, soNgayFull);
	                ps.setInt(5, nuaNgay);
	                ps.setInt(6, ngayNghi);
	                ps.setInt(7, gioLamThem);
	                ps.setInt(8, diemTong);

	                ps.addBatch(); 
	            }
	        }

	        ps.executeBatch();
	        response.sendRedirect(request.getContextPath() + "/ChamCong.jsp");
	    } catch (SQLException e) {
	        e.printStackTrace();
	        out.println("<h3>Thêm danh sách thất bại: " + e.getMessage() + "</h3>");
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
