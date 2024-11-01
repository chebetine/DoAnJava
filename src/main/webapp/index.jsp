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
	<header id="header" class="header fixed-top d-flex align-items-center">
	
	  <div class="d-flex align-items-center justify-content-between">
	    <a href="index.jsp" class="logo d-flex align-items-center">
	      <img src="assets/img/logo.png" alt="">
	      <span class="d-none d-lg-block">NiceAdmin</span>
	    </a>
	    <i class="bi bi-list toggle-sidebar-btn"></i>
	  </div><!-- End Logo -->
	
	  <div class="search-bar">
	    <form class="search-form d-flex align-items-center" method="POST" action="#">
	      <input type="text" name="query" placeholder="Search" title="Enter search keyword">
	      <button type="submit" title="Search"><i class="bi bi-search"></i></button>
	    </form>
	  </div><!-- End Search Bar -->
	
	  <nav class="header-nav ms-auto">
	    <ul class="d-flex align-items-center">
	
	      <li class="nav-item d-block d-lg-none">
	        <a class="nav-link nav-icon search-bar-toggle " href="#">
	          <i class="bi bi-search"></i>
	        </a>
	      </li><!-- End Search Icon-->
	
	      <li class="nav-item dropdown">
	
	        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
	          <i class="bi bi-bell"></i>
	          <span class="badge bg-primary badge-number">4</span>
	        </a><!-- End Notification Icon -->
	
	        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
	          <li class="dropdown-header">
	            You have 4 new notifications
	            <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
	          </li>
	          <li>
	            <hr class="dropdown-divider">
	          </li>
	
	          <li class="notification-item">
	            <i class="bi bi-exclamation-circle text-warning"></i>
	            <div>
	              <h4>Lorem Ipsum</h4>
	              <p>Quae dolorem earum veritatis oditseno</p>
	              <p>30 min. ago</p>
	            </div>
	          </li>
	
	          <li>
	            <hr class="dropdown-divider">
	          </li>
	
	          <li class="notification-item">
	            <i class="bi bi-x-circle text-danger"></i>
	            <div>
	              <h4>Atque rerum nesciunt</h4>
	              <p>Quae dolorem earum veritatis oditseno</p>
	              <p>1 hr. ago</p>
	            </div>
	          </li>
	
	          <li>
	            <hr class="dropdown-divider">
	          </li>
	
	          <li class="notification-item">
	            <i class="bi bi-check-circle text-success"></i>
	            <div>
	              <h4>Sit rerum fuga</h4>
	              <p>Quae dolorem earum veritatis oditseno</p>
	              <p>2 hrs. ago</p>
	            </div>
	          </li>
	
	          <li>
	            <hr class="dropdown-divider">
	          </li>
	
	          <li class="notification-item">
	            <i class="bi bi-info-circle text-primary"></i>
	            <div>
	              <h4>Dicta reprehenderit</h4>
	              <p>Quae dolorem earum veritatis oditseno</p>
	              <p>4 hrs. ago</p>
	            </div>
	          </li>
	
	          <li>
	            <hr class="dropdown-divider">
	          </li>
	          <li class="dropdown-footer">
	            <a href="#">Show all notifications</a>
	          </li>
	
	        </ul><!-- End Notification Dropdown Items -->
	
	      </li><!-- End Notification Nav -->
	
	      <li class="nav-item dropdown">
	
	        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
	          <i class="bi bi-chat-left-text"></i>
	          <span class="badge bg-success badge-number">3</span>
	        </a><!-- End Messages Icon -->
	
	        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
	          <li class="dropdown-header">
	            You have 3 new messages
	            <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
	          </li>
	          <li>
	            <hr class="dropdown-divider">
	          </li>
	
	          <li class="message-item">
	            <a href="#">
	              <img src="assets/img/messages-1.jpg" alt="" class="rounded-circle">
	              <div>
	                <h4>Maria Hudson</h4>
	                <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
	                <p>4 hrs. ago</p>
	              </div>
	            </a>
	          </li>
	          <li>
	            <hr class="dropdown-divider">
	          </li>
	
	          <li class="message-item">
	            <a href="#">
	              <img src="assets/img/messages-2.jpg" alt="" class="rounded-circle">
	              <div>
	                <h4>Anna Nelson</h4>
	                <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
	                <p>6 hrs. ago</p>
	              </div>
	            </a>
	          </li>
	          <li>
	            <hr class="dropdown-divider">
	          </li>
	
	          <li class="message-item">
	            <a href="#">
	              <img src="assets/img/messages-3.jpg" alt="" class="rounded-circle">
	              <div>
	                <h4>David Muldon</h4>
	                <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
	                <p>8 hrs. ago</p>
	              </div>
	            </a>
	          </li>
	          <li>
	            <hr class="dropdown-divider">
	          </li>
	
	          <li class="dropdown-footer">
	            <a href="#">Show all messages</a>
	          </li>
	
	        </ul><!-- End Messages Dropdown Items -->
	
	      </li><!-- End Messages Nav -->
	
	      <li class="nav-item dropdown pe-3">
	
	        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
	          <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
	          <span class="d-none d-md-block dropdown-toggle ps-2">K. Anderson</span>
	        </a><!-- End Profile Iamge Icon -->
	
	        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
	          <li class="dropdown-header">
	            <h6>Kevin Anderson</h6>
	            <span>Web Designer</span>
	          </li>
	          <li>
	            <hr class="dropdown-divider">
	          </li>
	
	          <li>
	            <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
	              <i class="bi bi-person"></i>
	              <span>My Profile</span>
	            </a>
	          </li>
	          <li>
	            <hr class="dropdown-divider">
	          </li>
	
	          <li>
	            <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
	              <i class="bi bi-gear"></i>
	              <span>Account Settings</span>
	            </a>
	          </li>
	          <li>
	            <hr class="dropdown-divider">
	          </li>
	
	          <li>
	            <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
	              <i class="bi bi-question-circle"></i>
	              <span>Need Help?</span>
	            </a>
	          </li>
	          <li>
	            <hr class="dropdown-divider">
	          </li>
	
	          <li>
	            <a class="dropdown-item d-flex align-items-center" href="#">
	              <i class="bi bi-box-arrow-right"></i>
	              <span>Sign Out</span>
	            </a>
	          </li>
	
	        </ul><!-- End Profile Dropdown Items -->
	      </li><!-- End Profile Nav -->
	
	    </ul>
	  </nav><!-- End Icons Navigation -->
	
	</header><!-- End Header -->
	
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

</html>