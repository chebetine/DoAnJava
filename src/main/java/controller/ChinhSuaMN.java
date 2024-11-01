package controller;

import jakarta.servlet.ServletException;
import controller.KetNoi;
import java.sql.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ChinhSuaMN
 */
@WebServlet("/ChinhSuaMN")
public class ChinhSuaMN extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChinhSuaMN() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id"); // ID của menu cần chỉnh sửa
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;

	    try {
	        connection = KetNoi.getConnection();
	        String sql = "SELECT * FROM dsmenu WHERE idDSMenu = ?";
	        preparedStatement = connection.prepareStatement(sql);
	        preparedStatement.setInt(1, Integer.parseInt(id));
	        resultSet = preparedStatement.executeQuery();

	        if (resultSet.next()) {
	            request.setAttribute("nameMN", resultSet.getString("NameMenu"));
	            request.setAttribute("level", resultSet.getInt("Level"));
	            request.setAttribute("link", resultSet.getString("Link"));
	            request.setAttribute("parent", resultSet.getInt("Parent")); // Hoặc tên menu cha tùy vào yêu cầu
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Đóng kết nối
	        if (resultSet != null) try { resultSet.close(); } catch (SQLException e) { e.printStackTrace(); }
	        if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException e) { e.printStackTrace(); }
	        if (connection != null) try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
	    }

	    request.getRequestDispatcher("ChinhSuaMN.jsp").forward(request, response);
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
