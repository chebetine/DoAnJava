<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  <!-- Import JDBC classes -->
<%@ page import="controller.KetNoi" %>

<!DOCTYPE html>
<html lang="en">
	  <head>
	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	    <title>Thêm mới nhân viên</title>
	    <meta
	      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
	      name="viewport"
	    />
	    <link
	      rel="icon"
	      href="assets2/img/kaiadmin/favicon.ico"
	      type="image/x-icon"
	    />
	
	    <!-- Fonts and icons -->
	    <script src="assets2/js/plugin/webfont/webfont.min.js"></script>
	    <script>
	      WebFont.load({
	        google: { families: ["Public Sans:300,400,500,600,700"] },
	        custom: {
	          families: [
	            "Font Awesome 5 Solid",
	            "Font Awesome 5 Regular",
	            "Font Awesome 5 Brands",
	            "simple-line-icons",
	          ],
	          urls: ["assets2/css/fonts.min.css"],
	        },
	        active: function () {
	          sessionStorage.fonts = true;
	        },
	      });
	    </script>
	
	    <!-- CSS Files -->
	    <link rel="stylesheet" href="assets2/css/bootstrap.min.css" />
	    <link rel="stylesheet" href="assets2/css/plugins.min.css" />
	    <link rel="stylesheet" href="assets2/css/kaiadmin.min.css" />
	    
	
	    <!-- CSS Just for demo purpose, don't include it in your project -->
	    <link rel="stylesheet" href="assets2/css/demo.css" />
	  </head>
	  <body>
	    <div class="wrapper">
	      <!-- Sidebar -->
	      <div class="sidebar" data-background-color="dark">
	        <div class="sidebar-logo">
	          <!-- Logo Header -->
	          <div class="logo-header" data-background-color="dark">
	            <a href="index2.html" class="logo">
	              <img
	                src="assets2/img/kaiadmin/logo_light.svg"
	                alt="navbar brand"
	                class="navbar-brand"
	                height="20"
	              />
	            </a>
	            <div class="nav-toggle">
	              <button class="btn btn-toggle toggle-sidebar">
	                <i class="gg-menu-right"></i>
	              </button>
	              <button class="btn btn-toggle sidenav-toggler">
	                <i class="gg-menu-left"></i>
	              </button>
	            </div>
	            <button class="topbar-toggler more">
	              <i class="gg-more-vertical-alt"></i>
	            </button>
	          </div>
	          <!-- End Logo Header -->
	        </div>
	        <div class="sidebar-wrapper scrollbar scrollbar-inner">
	          <div class="sidebar-content">
	          	<%
				    Connection connection = null;
				    Statement statement = null;
				    ResultSet resultSet = null;
				
				    try {
				        connection = KetNoi.getConnection();
				        if (connection != null) {
				            statement = connection.createStatement();
				            resultSet = statement.executeQuery("SELECT * FROM dsmenu WHERE Level = 1");
				
				            out.println("<ul class='nav nav-secondary'>");
				
				            while (resultSet.next()) {
				                String ten = resultSet.getString("NameMenu");
				                String Link = resultSet.getString("Link");
				                String parentName = resultSet.getString("idDSMenu");
				
				                out.println("<li class='nav-item'><a data-bs-toggle='collapse' href='#menu" + parentName + "'>");
				                out.println("<i class='fas fa-layer-group'></i>");  // Thêm icon
				                out.println("<p>" + ten + "</p>");
				                out.println("<span class='caret'></span></a>");
				
				                // Tạo truy vấn cho menu cấp 2
				                Statement subStatement = connection.createStatement();
				                ResultSet subResultSet = subStatement.executeQuery("SELECT * FROM dsmenu WHERE Level = 2 AND Parent = '" + parentName + "'");
				
				                // Nếu có menu cấp 2
				                if (subResultSet.next()) {
				                    out.println("<div class='collapse' id='menu" + parentName + "'>");
				                    out.println("<ul class='nav nav-collapse'>");
				                    do {
				                        String tenSub = subResultSet.getString("NameMenu");
				                        String LinkSub = subResultSet.getString("Link");
				                        out.println("<li><a href='" + LinkSub + "'><span class='sub-item'>" + tenSub + "</span></a></li>");
				                    } while (subResultSet.next());
				                    out.println("</ul>");
				                    out.println("</div>");
				                }
				
				                out.println("</li>"); // Kết thúc menu bậc 1
				            }
				
				            out.println("</ul>"); // Kết thúc danh sách bậc 1
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
	
	          </div>
	        </div>
	      </div>
	      <!-- End Sidebar -->
	
	      <div class="main-panel">
	        <div class="container">
	          <div class="page-inner">
	          	<div class="container">
		          <div class="page-inner">
		            <div class="page-header">
		              <h3 class="fw-bold mb-3">Thêm mới nhân viên</h3>
		              <ul class="breadcrumbs mb-3">
		                <li class="nav-home">
		                  <a href="index2.jsp">
		                    <i class="icon-home"></i>
		                  </a>
		                </li>
		                <li class="separator">
		                  <i class="icon-arrow-right"></i>
		                </li>
		                <li class="nav-item">
		                  <a href="DanhSachNV.jsp">Danh sách nhân viên</a>
		                </li>
		                <li class="separator">
		                  <i class="icon-arrow-right"></i>
		                </li>
		                <li class="nav-item">
		                  <a href="ThemMoiNV.jsp">Thêm mới nhân viên</a>
		                </li>
		              </ul>
		            </div>
		            <div class="row">
		              <div class="col-md-12">
		                <div class="card">
		                  <div class="card-header">
		                   <div class="container">
					          <div class="page-inner">
					            <div class="row">
					              <div class="col-md-12">
					               <form action="AddNhansu" method="POST">
					                <div class="card">
					                  <div class="card-header">
					                    <div class="card-title">Thêm nhân sự</div>
					                  </div>
					                  <div class="card-body">
					                    <div class="row">
					                      <div class="col-md-6 col-lg-4">
					                        <div class="form-group">
					                           <label for="password">Họ tên</label>
					                           <input type="text" name="name" class="form-control" placeholder="Họ tên" required />
					                        </div>
					                        <div class="form-group">
					                           <label for="dob">Ngày sinh</label>
					                           <input type="date" name="dob" class="form-control" placeholder="Ngày sinh" required />
					                        </div>
					                        <div class="form-group">
					                          <label for="password">Giới tính</label>
					                          <input type="text" name="gender" class="form-control" placeholder="Giới tính" required />
					                        </div>
					                        <div class="form-group">
					                          <label for="password">Quê quán</label>
					                          <input type="text" name="hometown" class="form-control" placeholder="Quê quán" required />
					                        </div>
					                        <div class="form-group">
					                          <label for="password">Chức vụ</label>
					                          <input type="text" name="position" class="form-control" placeholder="Chức vụ" required />
					                        </div>
					                        <div class="form-group">
					                          <label for="largeSelect">Quyền truy cập</label>
					                          <select
					                            class="form-select form-control-lg"
					                            name="quyen"
					                            id="largeSelect"
					                          >
					                          	<option> </option>
					                            <option value= "0">không</option>
					                            <option value="1">có</option>
					                          </select>
					                        </div>
					                      </div>
					                    </div>
					                  </div>
					                  <div class="card-action d-flex justify-content-start"  style="margin-left: 95px;">
					                     <button type="submit" class="btn btn-primary" style="width: 100px; margin-right: 15px;">Thêm</button>
					                     <button type="button" class="btn btn-danger" style="width: 100px;" onclick="location.href='${pageContext.request.contextPath}/DanhSachNV.jsp'">Thoát</button>
					                  </div>
					
					                </div>
					                </form>
					              </div>      
					            </div>
					          </div>
					        </div>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
	          </div>
	        </div>
	
	        <footer class="footer">
	          <div class="container-fluid d-flex justify-content-between">
	            <nav class="pull-left">
	              <ul class="nav">
	                <li class="nav-item">
	                  <a class="nav-link" href="http://www.themekita.com">
	                    ThemeKita
	                  </a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link" href="#"> Help </a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link" href="#"> Licenses </a>
	                </li>
	              </ul>
	            </nav>
	            <div class="copyright">
	              2024, made with <i class="fa fa-heart heart text-danger"></i> by
	              <a href="http://www.themekita.com">ThemeKita</a>
	            </div>
	            <div>
	              Distributed by
	              <a target="_blank" href="https://themewagon.com/">ThemeWagon</a>.
	            </div>
	          </div>
	        </footer>
	      </div>
	
	      <!-- Custom template | don't include it in your project! -->
	    </div>
	    <!--   Core JS Files   -->
	    <script src="assets2/js/core/jquery-3.7.1.min.js"></script>
	    <script src="assets2/js/core/popper.min.js"></script>
	    <script src="assets2/js/core/bootstrap.min.js"></script>
	
	    <!-- jQuery Scrollbar -->
	    <script src="assets2/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	
	    <!-- Chart JS -->
	    <script src="assets2/js/plugin/chart.js/chart.min.js"></script>
	
	    <!-- jQuery Sparkline -->
	    <script src="assets2/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>
	
	    <!-- Chart Circle -->
	    <script src="assets2/js/plugin/chart-circle/circles.min.js"></script>
	
	    <!-- Datatables -->
	    <script src="assets2/js/plugin/datatables/datatables.min.js"></script>
	
	    <!-- Bootstrap Notify -->
	    <script src="assets2/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
	
	    <!-- jQuery Vector Maps -->
	    <script src="assets2/js/plugin/jsvectormap/jsvectormap.min.js"></script>
	    <script src="assets2/js/plugin/jsvectormap/world.js"></script>
	
	    <!-- Sweet Alert -->
	    <script src="assets2/js/plugin/sweetalert/sweetalert.min.js"></script>
	
	    <!-- Kaiadmin JS -->
	    <script src="assets2/js/kaiadmin.min.js"></script>
	
	    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
	    <script src="assets2/js/setting-demo.js"></script>
	    <script src="assets2/js/demo.js"></script>
	    <script>
	      $("#lineChart").sparkline([102, 109, 120, 99, 110, 105, 115], {
	        type: "line",
	        height: "70",
	        width: "100%",
	        lineWidth: "2",
	        lineColor: "#177dff",
	        fillColor: "rgba(23, 125, 255, 0.14)",
	      });
	
	      $("#lineChart2").sparkline([99, 125, 122, 105, 110, 124, 115], {
	        type: "line",
	        height: "70",
	        width: "100%",
	        lineWidth: "2",
	        lineColor: "#f3545d",
	        fillColor: "rgba(243, 84, 93, .14)",
	      });
	
	      $("#lineChart3").sparkline([105, 103, 123, 100, 95, 105, 115], {
	        type: "line",
	        height: "70",
	        width: "100%",
	        lineWidth: "2",
	        lineColor: "#ffa534",
	        fillColor: "rgba(255, 165, 52, .14)",
	      });
	    </script>
	  </body>
</html>
