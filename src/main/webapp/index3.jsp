<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  <!-- Import JDBC classes -->
<%@ page import="controller.KetNoi" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	
	<title>Admin-Quản ly</title>
	<meta content="" name="description">
	<meta content="" name="keywords">
	
	<!-- Favicons -->
	<link href="assets/img/favicon.png" rel="icon">
	<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
	
	<!-- Google Fonts -->
	<link href="https://fonts.gstatic.com" rel="preconnect">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	
	<!-- Vendor CSS Files -->
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
	<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
	<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
	
	<!-- Template Main CSS File -->
	<link href="assets/css/style.css" rel="stylesheet">
	
	<!-- =======================================================
	* Template Name: NiceAdmin
	* Updated: Sep 18 2023 with Bootstrap v5.3.2
	* Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
	* Author: BootstrapMade.com
	* License: https://bootstrapmade.com/license/
	======================================================== -->
</head>

<body>
	
	<!-- ======= Header ======= -->
	
	
	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">
	
	  <ul class="sidebar-nav" id="sidebar-nav">
	
	    <li class="nav-item">
	      <a class="nav-link " href="index.jsp">
	        <i class="bi bi-grid"></i>
	        <span>Quản lý menu</span>
	      </a>
	    </li><!-- End Dashboard Nav -->
	
	    <li class="nav-item">
	      <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
	        <i class="bi bi-menu-button-wide"></i><span>Quản lý quyền truy cập</span><i class="bi bi-chevron-down ms-auto"></i>
	      </a>
	      <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
	        <li>
	          <a href="QuyenTC.jsp">
	            <i class="bi bi-circle"></i><span>Danh sách thành viên</span>
	          </a>
	        </li>
	      </ul>
	    </li><!-- End Components Nav -->
	    <li class="nav-item">
	      <a class="nav-link collapsed" href="pages-login.html">
	        <i class="bi bi-box-arrow-in-right"></i>
	        <span>Login</span>
	      </a>
	    </li><!-- End Login Page Nav -->
	  </ul>
	
	</aside><!-- End Sidebar-->
	
	<main id="main" class="main">
	
	  <div class="pagetitle">
	    <h1>Danh sách menu trên website quản lý nhân sự</h1>
	    <nav>
	      <ol class="breadcrumb">
	        <li class="breadcrumb-item"><a href="index.html">Trang chủ</a></li>
	        <li class="breadcrumb-item active">Quản lý menu</li>
	      </ol>
	    </nav>
	  </div><!-- End Page Title -->
	
	  <section class="section dashboard">
	    <div class="row">
	          <!-- Recent Sales -->
	          <div class="col-12">
	            <div class="card recent-sales overflow-auto">
	              <div class="card-body mt-4">
	                <h5 class="card-title">Danh sách menu</h5>
	                	<%
				    Connection connection = null;
				    Statement statement = null;
				    ResultSet resultSet = null;
				
				    String deleteId = request.getParameter("deleteId");
				    if (deleteId != null) {
				        try {
				            connection = KetNoi.getConnection();
				            if (connection != null) {
				                statement = connection.createStatement();
				                String sqlDelete = "DELETE FROM dsmenu WHERE NameMenu = '" + deleteId + "'"; // Cẩn thận với SQL Injection
				                statement.executeUpdate(sqlDelete);
				                out.println("<p>Đã xóa menu: " + deleteId + "</p>");
				            }
				        } catch (SQLException e) {
				            e.printStackTrace();
				        } finally {
				            try {
				                if (statement != null) statement.close();
				                if (connection != null) connection.close();
				            } catch (SQLException e) {
				                e.printStackTrace();
				            }
				        }
				    }
			
				    try {
				        connection = KetNoi.getConnection();
				        if (connection != null) {
				            statement = connection.createStatement();
				            resultSet = statement.executeQuery("SELECT * FROM dsmenu"); 
			
				            // Bắt đầu bảng
				            out.println("<table class='table table-borderless datatable'>");
				            out.println("<thead><tr><th scope='col'>Tên Menu</th><th scope='col'>Cấp Menu</th><th scope='col'>Link</th><th scope='col'>Sửa</th><th scope='col'>Xóa</th></tr></thead>"); // Thêm tiêu đề cho các cột
				            out.println("<tbody>");
				            while (resultSet.next()) {
				            	int idMenu = resultSet.getInt("idDSMenu");
				                String ten = resultSet.getString("NameMenu");
				                String cap = resultSet.getString("Level");
				                String link = resultSet.getString("Link");
				                out.println("<tr>");
				                out.println("<td>" + ten + "</td>");
				                out.println("<td class='center-absolute'>" + cap + "</td>");
				                out.println("<td >" + link + "</td>");
				                out.println("<td class='center-absolute'> <span class='badge bg-success'><a href='ChinhSuaMN.jsp?id=" + idMenu + "' style = 'color:white'>Sửa</a></span></td>"); // Nếu có trang sửa
				                out.println("<td class='center-absolute'> <span class='badge bg-danger'><a href='?deleteId=" + ten + "' onclick='return confirm(\"Bạn có chắc chắn muốn xóa không?\");' style = 'color:white'>Xóa</a></span></td>"); // Thực hiện xóa tại đây
				                out.println("</tr>");
				            }
				            out.println("</tbody>");
				            // Kết thúc bảng
				            out.println("</table>");
				        } else {
				            out.println("<p>Kết nối cơ sở dữ liệu không hợp lệ.</p>");
				        }
					    } catch (SQLException e) {
					        e.printStackTrace();
					    } finally {
					        try {
					            if (resultSet != null) resultSet.close();
					            if (statement != null) statement.close();
					            if (connection != null) connection.close();
					        } catch (SQLException e) {
					            e.printStackTrace();
					        }
				    }
				    %>
				    <br/>
				    <a href="ThemMN.jsp" class="btn btn-primary btn-round ms-auto">
					    <i class="fa fa-plus"></i>
					    Thêm mới menu
					</a>
				</div>
	
	            </div>
	          </div>
	    </div>
	  </section>
	
	</main><!-- End #main -->
	
	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
	  <div class="copyright">
	    &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
	  </div>
	  <div class="credits">
	    <!-- All the links in the footer should remain intact. -->
	    <!-- You can delete the links only if you purchased the pro version. -->
	    <!-- Licensing information: https://bootstrapmade.com/license/ -->
	    <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
	    Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
	  </div>
	</footer><!-- End Footer -->
	
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
	
	<!-- Vendor JS Files -->
	<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/chart.js/chart.umd.js"></script>
	<script src="assets/vendor/echarts/echarts.min.js"></script>
	<script src="assets/vendor/quill/quill.min.js"></script>
	<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	
	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
	
</body>
