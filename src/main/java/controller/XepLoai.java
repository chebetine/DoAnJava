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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/XepLoai")
public class XepLoai extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XepLoai() {
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
        int thang = Integer.parseInt(thangStr);
        int nam = Integer.parseInt(namStr);

        Connection conn = null;
        PreparedStatement ps = null;
        PreparedStatement getMaCCStmt = null;

        try {
            conn = KetNoi.getConnection();
            if (conn == null) {
                out.println("<h3>Kết nối cơ sở dữ liệu không thành công.</h3>");
                return;
            }

            // Truy vấn để thêm vào bảng dsxeploai
            String sql = "INSERT INTO dsxeploai (MaCC, HieuSuat, ThaiDo, KyNang, XepLoai) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);

            // Truy vấn để lấy MaCC và DiemTong cho nhân viên
            String getMaCCQuery = "SELECT MaCC, DiemTong FROM dschamcong WHERE idnhanvien = ? AND Thang = ? AND Nam = ?";
            getMaCCStmt = conn.prepareStatement(getMaCCQuery);

            for (String paramName : request.getParameterMap().keySet()) {
                if (paramName.startsWith("hieusuat_")) {
                    String idnhanvien = paramName.split("_")[1];
                    String hieusuat = request.getParameter("hieusuat_" + idnhanvien);
                    String thaido = request.getParameter("thaido_" + idnhanvien);
                    String kynang = request.getParameter("kynang_" + idnhanvien);

                    int hieuSuat = (hieusuat != null && !hieusuat.isEmpty()) ? Integer.parseInt(hieusuat) : 0;
                    int thaiDo = (thaido != null && !thaido.isEmpty()) ? Integer.parseInt(thaido) : 0;
                    int kyNang = (kynang != null && !kynang.isEmpty()) ? Integer.parseInt(kynang) : 0;

                    // Lấy MaCC và DiemTong từ bảng dschamcong
                    getMaCCStmt.setInt(1, Integer.parseInt(idnhanvien));
                    getMaCCStmt.setInt(2, thang);
                    getMaCCStmt.setInt(3, nam);
                    ResultSet maCCResultSet = getMaCCStmt.executeQuery();

                    if (maCCResultSet.next()) {
                        int maCC = maCCResultSet.getInt("MaCC");
                        int diemTong = maCCResultSet.getInt("DiemTong"); 
                        int xep = hieuSuat*30/100 + thaiDo*30/100 + kyNang*30/100 + diemTong*10/100;
                        String xepLoai = null;
                        if(xep < 30) {
                        	xepLoai = "Kém";
                        }
                        if(30 < xep && xep < 50) {
                        	xepLoai = "Yếu";
                        }
                        if(50 <= xep && xep < 65) {
                        	xepLoai = "Trung bình";
                        }
                        if(65 <= xep && xep < 80) {
                        	xepLoai = "Khá";
                        }
                        if(80 <= xep && xep < 90) {
                        	xepLoai = "Tốt";
                        }if(xep >= 90) {
                        	xepLoai = "Xuất sắc";
                        }

                        ps.setInt(1, maCC);
                        ps.setInt(2, hieuSuat);
                        ps.setInt(3, thaiDo);
                        ps.setInt(4, kyNang);
                        ps.setString(5, xepLoai);
                        ps.addBatch(); 
                    } else {
                        out.println("<h3>Không tìm thấy MaCC cho nhân viên: " + idnhanvien + "</h3>");
                    }
                }
            }

            ps.executeBatch(); // Thực hiện batch insert
            response.sendRedirect(request.getContextPath() + "/ThemXL.jsp");
        } catch (SQLException e) {
            out.println("<h3>Thêm danh sách thất bại: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (getMaCCStmt != null) {
                try {
                    getMaCCStmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
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
