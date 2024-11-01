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
      <h1>Chỉnh sửa menu</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
          <li class="breadcrumb-item"><a href="index.jsp">Quản lý menu</a></li>
          <li class="breadcrumb-item active">Chỉnh sửa menu</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">
            <!-- Recent Sales -->
            <div class="col-12">
              <div class="card recent-sales overflow-auto">
                <div class="card-body mt-4">
                  <h5 class="card-title">Chỉnh sửa menu</h5>
                  	<%
			            String id = request.getParameter("id");
			            String nameMN = "";
			            int level = 1;
			            String link = "";
			            int parent = 0;
			
			            // Kiểm tra xem có thông tin gửi lên từ form hay không
			            if (request.getMethod().equalsIgnoreCase("post")) {
			                String newNameMN = request.getParameter("nameMN");
			                int newLevel = Integer.parseInt(request.getParameter("option1"));
			                String newLink = request.getParameter("link");
			                int newParent = Integer.parseInt(request.getParameter("option2"));
			
			                Connection connection = null;
			                PreparedStatement preparedStatement = null;
			
			                try {
			                    connection = KetNoi.getConnection();
			                    String sqlUpdate = "UPDATE dsmenu SET NameMenu = ?, Level = ?, Link = ?, Parent = ? WHERE idDSMenu = ?";
			                    preparedStatement = connection.prepareStatement(sqlUpdate);
			                    preparedStatement.setString(1, newNameMN);
			                    preparedStatement.setInt(2, newLevel);
			                    preparedStatement.setString(3, newLink);
			                    preparedStatement.setInt(4, newParent);
			                    preparedStatement.setInt(5, Integer.parseInt(id));
			
			                    int rowsUpdated = preparedStatement.executeUpdate();
			                    if (rowsUpdated > 0) {
			                        out.println("<p>Cập nhật thành công!</p>");
			                    } else {
			                        out.println("<p>Không tìm thấy menu để cập nhật.</p>");
			                    }
			                } catch (SQLException e) {
			                    e.printStackTrace();
			                    out.println("<p>Lỗi cập nhật cơ sở dữ liệu: " + e.getMessage() + "</p>");
			                } finally {
			                    if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException e) { e.printStackTrace(); }
			                    if (connection != null) try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
			                }
			            }
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
			                    nameMN = resultSet.getString("NameMenu");
			                    level = resultSet.getInt("Level");
			                    link = resultSet.getString("Link");
			                    parent = resultSet.getInt("Parent");
			                }
			            } catch (SQLException e) {
			                e.printStackTrace();
			            } finally {
			                // Đóng kết nối
			                if (resultSet != null) try { resultSet.close(); } catch (SQLException e) { e.printStackTrace(); }
			                if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException e) { e.printStackTrace(); }
			                if (connection != null) try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
			            }
			        %>
			        <form action="ChinhSuaMN.jsp" method="post">
		            Cấp Menu: 
		            <select id="levelSelect" name="option1" onchange="toggleParentMenu()">
		                <option value="1" <%= level == 1 ? "selected" : "" %>>1</option>
		                <option value="2" <%= level == 2 ? "selected" : "" %>>2</option>
		                <option value="3" <%= level == 3 ? "selected" : "" %>>3</option>
		            </select>
		            <br/><br/>
		            Tên Menu: <input type="text" name="nameMN" value="<%= nameMN %>" required><br/><br/>
		
		            <%
		            boolean hasParentMenu = level > 1; // Chỉ hiển thị nếu cấp menu lớn hơn 1
		            %>
		            <div id="parentMenuContainer" <%= hasParentMenu ? "" : "style='display:none;'" %> >
		                Menu cha: <br/><br/>
		                <select id="parentMenu" name="option2">
		                    <%
		                        Connection connectionMenu = null;
		                        Statement statementMenu = null;
		                        ResultSet resultSetMenu = null;
		
		                        try {
		                            connectionMenu = KetNoi.getConnection();
		                            if (connectionMenu != null) {
		                                statementMenu = connectionMenu.createStatement();
		                                resultSetMenu = statementMenu.executeQuery("SELECT idDSMenu, NameMenu FROM dsmenu WHERE Level = 1");
		
		                                // Kiểm tra xem có menu cha không
		                                if (resultSetMenu.isBeforeFirst()) {
		                                    while (resultSetMenu.next()) {
		                                        int menuID = resultSetMenu.getInt("idDSMenu");
		                                        String nameMenu = resultSetMenu.getString("NameMenu");
		                                        out.println("<option value='" + menuID + "' " + (menuID == parent ? "selected" : "") + ">" + nameMenu + "</option>");
		                                    }
		                                } else {
		                                    out.println("<option value=''>Không có menu cha</option>");
		                                }
		                            } else {
		                                out.println("<p>Kết nối cơ sở dữ liệu không thành công.</p>");
		                            }
		                            
		                        } catch (SQLException e) {
		                            out.println("<p>Lỗi cơ sở dữ liệu: " + e.getMessage() + "</p>");
		                            e.printStackTrace();
		                        } finally {
		                            if (resultSetMenu != null) try { resultSetMenu.close(); } catch (SQLException e) { e.printStackTrace(); }
		                            if (statementMenu != null) try { statementMenu.close(); } catch (SQLException e) { e.printStackTrace(); }
		                            if (connectionMenu != null) try { connectionMenu.close(); } catch (SQLException e) { e.printStackTrace(); }
		                        }
		                    %>
		                </select>
		                <br/>
		            </div><br>
		
		            Link Menu: <input type="text" name="link" value="<%= link %>" required><br/><br/><br/>
		            <input type="hidden" name="id" value="<%= id %>">
		            <input type="submit" name ="submit" value="Lưu thông tin">
		            
		        </form>
		        <%
		        if (request.getParameter("submit") != null) { 
		        	response.sendRedirect("index.jsp");
		        }
		        %>
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