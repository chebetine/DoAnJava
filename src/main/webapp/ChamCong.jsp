<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  <!-- Import JDBC classes -->
<%@ page import="controller.KetNoi" %>

<!DOCTYPE html>
<html lang="en">
	  <head>
	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	    <title>Chấm công nhân viên</title>
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
	        <div class="main-header">
	          <div class="main-header-logo">
	            <!-- Logo Header -->
	            <div class="logo-header" data-background-color="dark">
	              <a href="index.html" class="logo">
	                <img
	                  src="assets/img/kaiadmin/logo_light.svg"
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
	          <!-- Navbar Header -->
	          <nav
	            class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
	          >
	            <div class="container-fluid">
	              <nav
	                class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
	              >
	                <div class="input-group">
	                  <div class="input-group-prepend">
	                    <button type="submit" class="btn btn-search pe-1">
	                      <i class="fa fa-search search-icon"></i>
	                    </button>
	                  </div>
	                  <input
	                    type="text"
	                    placeholder="Search ..."
	                    class="form-control"
	                  />
	                </div>
	              </nav>
	
	              <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
	                <li
	                  class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none"
	                >
	                  <a
	                    class="nav-link dropdown-toggle"
	                    data-bs-toggle="dropdown"
	                    href="#"
	                    role="button"
	                    aria-expanded="false"
	                    aria-haspopup="true"
	                  >
	                    <i class="fa fa-search"></i>
	                  </a>
	                  <ul class="dropdown-menu dropdown-search animated fadeIn">
	                    <form class="navbar-left navbar-form nav-search">
	                      <div class="input-group">
	                        <input
	                          type="text"
	                          placeholder="Search ..."
	                          class="form-control"
	                        />
	                      </div>
	                    </form>
	                  </ul>
	                </li>
	                <li class="nav-item topbar-icon dropdown hidden-caret">
	                  <a
	                    class="nav-link dropdown-toggle"
	                    href="#"
	                    id="messageDropdown"
	                    role="button"
	                    data-bs-toggle="dropdown"
	                    aria-haspopup="true"
	                    aria-expanded="false"
	                  >
	                    <i class="fa fa-envelope"></i>
	                  </a>
	                  <ul
	                    class="dropdown-menu messages-notif-box animated fadeIn"
	                    aria-labelledby="messageDropdown"
	                  >
	                    <li>
	                      <div
	                        class="dropdown-title d-flex justify-content-between align-items-center"
	                      >
	                        Messages
	                        <a href="#" class="small">Mark all as read</a>
	                      </div>
	                    </li>
	                    <li>
	                      <div class="message-notif-scroll scrollbar-outer">
	                        <div class="notif-center">
	                          <a href="#">
	                            <div class="notif-img">
	                              <img
	                                src="assets2/img/jm_denis.jpg"
	                                alt="Img Profile"
	                              />
	                            </div>
	                            <div class="notif-content">
	                              <span class="subject">Jimmy Denis</span>
	                              <span class="block"> How are you ? </span>
	                              <span class="time">5 minutes ago</span>
	                            </div>
	                          </a>
	                          <a href="#">
	                            <div class="notif-img">
	                              <img
	                                src="assets2/img/chadengle.jpg"
	                                alt="Img Profile"
	                              />
	                            </div>
	                            <div class="notif-content">
	                              <span class="subject">Chad</span>
	                              <span class="block"> Ok, Thanks ! </span>
	                              <span class="time">12 minutes ago</span>
	                            </div>
	                          </a>
	                          <a href="#">
	                            <div class="notif-img">
	                              <img
	                                src="assets2/img/mlane.jpg"
	                                alt="Img Profile"
	                              />
	                            </div>
	                            <div class="notif-content">
	                              <span class="subject">Jhon Doe</span>
	                              <span class="block">
	                                Ready for the meeting today...
	                              </span>
	                              <span class="time">12 minutes ago</span>
	                            </div>
	                          </a>
	                          <a href="#">
	                            <div class="notif-img">
	                              <img
	                                src="assets2/img/talha.jpg"
	                                alt="Img Profile"
	                              />
	                            </div>
	                            <div class="notif-content">
	                              <span class="subject">Talha</span>
	                              <span class="block"> Hi, Apa Kabar ? </span>
	                              <span class="time">17 minutes ago</span>
	                            </div>
	                          </a>
	                        </div>
	                      </div>
	                    </li>
	                    <li>
	                      <a class="see-all" href="javascript:void(0);"
	                        >See all messages<i class="fa fa-angle-right"></i>
	                      </a>
	                    </li>
	                  </ul>
	                </li>
	                <li class="nav-item topbar-icon dropdown hidden-caret">
	                  <a
	                    class="nav-link dropdown-toggle"
	                    href="#"
	                    id="notifDropdown"
	                    role="button"
	                    data-bs-toggle="dropdown"
	                    aria-haspopup="true"
	                    aria-expanded="false"
	                  >
	                    <i class="fa fa-bell"></i>
	                    <span class="notification">4</span>
	                  </a>
	                  <ul
	                    class="dropdown-menu notif-box animated fadeIn"
	                    aria-labelledby="notifDropdown"
	                  >
	                    <li>
	                      <div class="dropdown-title">
	                        You have 4 new notification
	                      </div>
	                    </li>
	                    <li>
	                      <div class="notif-scroll scrollbar-outer">
	                        <div class="notif-center">
	                          <a href="#">
	                            <div class="notif-icon notif-primary">
	                              <i class="fa fa-user-plus"></i>
	                            </div>
	                            <div class="notif-content">
	                              <span class="block"> New user registered </span>
	                              <span class="time">5 minutes ago</span>
	                            </div>
	                          </a>
	                          <a href="#">
	                            <div class="notif-icon notif-success">
	                              <i class="fa fa-comment"></i>
	                            </div>
	                            <div class="notif-content">
	                              <span class="block">
	                                Rahmad commented on Admin
	                              </span>
	                              <span class="time">12 minutes ago</span>
	                            </div>
	                          </a>
	                          <a href="#">
	                            <div class="notif-img">
	                              <img
	                                src="assets2/img/profile2.jpg"
	                                alt="Img Profile"
	                              />
	                            </div>
	                            <div class="notif-content">
	                              <span class="block">
	                                Reza send messages to you
	                              </span>
	                              <span class="time">12 minutes ago</span>
	                            </div>
	                          </a>
	                          <a href="#">
	                            <div class="notif-icon notif-danger">
	                              <i class="fa fa-heart"></i>
	                            </div>
	                            <div class="notif-content">
	                              <span class="block"> Farrah liked Admin </span>
	                              <span class="time">17 minutes ago</span>
	                            </div>
	                          </a>
	                        </div>
	                      </div>
	                    </li>
	                    <li>
	                      <a class="see-all" href="javascript:void(0);"
	                        >See all notifications<i class="fa fa-angle-right"></i>
	                      </a>
	                    </li>
	                  </ul>
	                </li>
	                <li class="nav-item topbar-icon dropdown hidden-caret">
	                  <a
	                    class="nav-link"
	                    data-bs-toggle="dropdown"
	                    href="#"
	                    aria-expanded="false"
	                  >
	                    <i class="fas fa-layer-group"></i>
	                  </a>
	                  <div class="dropdown-menu quick-actions animated fadeIn">
	                    <div class="quick-actions-header">
	                      <span class="title mb-1">Quick Actions</span>
	                      <span class="subtitle op-7">Shortcuts</span>
	                    </div>
	                    <div class="quick-actions-scroll scrollbar-outer">
	                      <div class="quick-actions-items">
	                        <div class="row m-0">
	                          <a class="col-6 col-md-4 p-0" href="#">
	                            <div class="quick-actions-item">
	                              <div class="avatar-item bg-danger rounded-circle">
	                                <i class="far fa-calendar-alt"></i>
	                              </div>
	                              <span class="text">Calendar</span>
	                            </div>
	                          </a>
	                          <a class="col-6 col-md-4 p-0" href="#">
	                            <div class="quick-actions-item">
	                              <div
	                                class="avatar-item bg-warning rounded-circle"
	                              >
	                                <i class="fas fa-map"></i>
	                              </div>
	                              <span class="text">Maps</span>
	                            </div>
	                          </a>
	                          <a class="col-6 col-md-4 p-0" href="#">
	                            <div class="quick-actions-item">
	                              <div class="avatar-item bg-info rounded-circle">
	                                <i class="fas fa-file-excel"></i>
	                              </div>
	                              <span class="text">Reports</span>
	                            </div>
	                          </a>
	                          <a class="col-6 col-md-4 p-0" href="#">
	                            <div class="quick-actions-item">
	                              <div
	                                class="avatar-item bg-success rounded-circle"
	                              >
	                                <i class="fas fa-envelope"></i>
	                              </div>
	                              <span class="text">Emails</span>
	                            </div>
	                          </a>
	                          <a class="col-6 col-md-4 p-0" href="#">
	                            <div class="quick-actions-item">
	                              <div
	                                class="avatar-item bg-primary rounded-circle"
	                              >
	                                <i class="fas fa-file-invoice-dollar"></i>
	                              </div>
	                              <span class="text">Invoice</span>
	                            </div>
	                          </a>
	                          <a class="col-6 col-md-4 p-0" href="#">
	                            <div class="quick-actions-item">
	                              <div
	                                class="avatar-item bg-secondary rounded-circle"
	                              >
	                                <i class="fas fa-credit-card"></i>
	                              </div>
	                              <span class="text">Payments</span>
	                            </div>
	                          </a>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </li>
	
	                <li class="nav-item topbar-user dropdown hidden-caret">
	                  <a
	                    class="dropdown-toggle profile-pic"
	                    data-bs-toggle="dropdown"
	                    href="#"
	                    aria-expanded="false"
	                  >
	                    <div class="avatar-sm">
	                      <img
	                        src="assets2/img/profile.jpg"
	                        alt="..."
	                        class="avatar-img rounded-circle"
	                      />
	                    </div>
	                    <span class="profile-username">
	                      <span class="op-7">Hi,</span>
	                      <span class="fw-bold">Hizrian</span>
	                    </span>
	                  </a>
	                  <ul class="dropdown-menu dropdown-user animated fadeIn">
	                    <div class="dropdown-user-scroll scrollbar-outer">
	                      <li>
	                        <div class="user-box">
	                          <div class="avatar-lg">
	                            <img
	                              src="assets2/img/profile.jpg"
	                              alt="image profile"
	                              class="avatar-img rounded"
	                            />
	                          </div>
	                          <div class="u-text">
	                            <h4>Hizrian</h4>
	                            <p class="text-muted">hello@example.com</p>
	                            <a
	                              href="profile.html"
	                              class="btn btn-xs btn-secondary btn-sm"
	                              >View Profile</a
	                            >
	                          </div>
	                        </div>
	                      </li>
	                      <li>
	                        <div class="dropdown-divider"></div>
	                        <a class="dropdown-item" href="#">My Profile</a>
	                        <a class="dropdown-item" href="#">My Balance</a>
	                        <a class="dropdown-item" href="#">Inbox</a>
	                        <div class="dropdown-divider"></div>
	                        <a class="dropdown-item" href="#">Account Setting</a>
	                        <div class="dropdown-divider"></div>
	                        <a class="dropdown-item" href="#">Logout</a>
	                      </li>
	                    </div>
	                  </ul>
	                </li>
	              </ul>
	            </div>
	          </nav>
	          <!-- End Navbar -->
	        </div>
	
	        <div class="container">
	          <div class="page-inner">
	          	<div class="container">
		          <div class="page-inner">
		            <div class="page-header">
		              <h3 class="fw-bold mb-3">Chấm công nhân viên</h3>
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
		              </ul>
		            </div>
		            <div class="row">
		              <div class="col-md-12">
						<form action="ChamCong" method="post"> <!-- Form with POST method -->
		                <div class="card">
		                  <div class="card-header">
		                    <div class="d-flex align-items-center flex-wrap">
							  <h4 class="card-title me-5">Thời gian: </h4>
							  <div class="d-flex align-items-center flex-nowrap">
							    <div class="form-group me-2">
								    <label for="largeSelectThang">Tháng: </label>
								    <select class="form-select form-control-lg" name="thang" id="largeSelectThang" style="min-width: 100px;">
								        <%
								            for (int i = 1; i <= 12; i++) {
								                out.println("<option value='" + i + "'>" + i + "</option>");
								            }
								        %>
								    </select>
								</div>
								<div class="form-group me-2">
								    <label for="largeSelectNam">Năm: </label>
								    <select class="form-select form-control-lg" name="nam" id="largeSelectNam" style="min-width: 150px;">
								        <%
								            int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
								            for (int i = currentYear - 5; i <= currentYear + 5; i++) {
								                out.println("<option value='" + i + "'>" + i + "</option>");
								            }
								        %>
								    </select>
								</div>

							  </div>
							</div>

		                  </div>
		                  <div class="card-body">
							<div class="table-responsive">
							    <%
							        try {
							            connection = KetNoi.getConnection();
							            if (connection != null) {
							                statement = connection.createStatement();
							                resultSet = statement.executeQuery("SELECT idnhanvien, hoten, chucvu FROM dsnhanvien");
							
							                // Bắt đầu bảng
							                out.println("<table id='add-row' class='display table table-striped table-hover'>");
							                out.println("<thead><tr><th scope='col'>Họ tên</th><th scope='col'>Chức vụ</th><th scope='col'>Số ngày làm việc đầy đủ</th>"
							                        + "<th scope='col'>Số ngày làm nửa công</th><th scope='col'>Số ngày nghỉ</th><th scope='col'>Số giờ làm thêm</th>"
							                        + "</tr></thead>");
							                out.println("<tbody>");
							                while (resultSet.next()) {
							                    int idNhanvien = resultSet.getInt("idnhanvien");
							                    String ten = resultSet.getString("hoten");
							                    String chucvu = resultSet.getString("chucvu");
							                    out.println("<tr>");
							                    out.println("<td>" + ten + "</td>");
							                    out.println("<td>" + chucvu + "</td>");

							                    // Cột số ngày làm việc đầy đủ
							                    out.println("<td>");
							                    out.println("<input type='number' name='songay_" + idNhanvien + "' min='0' class='form-control' />");
							                    out.println("<input type='hidden' name='idnhanvien_" + idNhanvien + "' value='" + idNhanvien + "' />");
							                    out.println("</td>");

							                    // Cột số ngày làm nửa công
							                    out.println("<td>");
							                    out.println("<input type='number' name='nuangay_" + idNhanvien + "' min='0' class='form-control' />");
							                    out.println("<input type='hidden' name='idnhanvien_" + idNhanvien + "' value='" + idNhanvien + "' />");
							                    out.println("</td>");

							                    // Cột số ngày nghỉ
							                    out.println("<td>");
							                    out.println("<input type='number' name='ngaynghi_" + idNhanvien + "' min='0' class='form-control' />");
							                    out.println("<input type='hidden' name='idnhanvien_" + idNhanvien + "' value='" + idNhanvien + "' />");
							                    out.println("</td>");

							                    // Cột số giờ làm thêm
							                    out.println("<td>");
							                    out.println("<input type='number' name='sogio_" + idNhanvien + "' min='0' class='form-control' />");
							                    out.println("<input type='hidden' name='idnhanvien_" + idNhanvien + "' value='" + idNhanvien + "' />");
							                    out.println("</td>");

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
							    <input type="hidden" name="thang" value="<%= request.getParameter("thang") != null ? request.getParameter("thang") : "0" %>"/> <!-- Thêm tháng, kiểm tra giá trị null -->
							    <input type="hidden" name="nam" value="<%= request.getParameter("nam") != null ? request.getParameter("nam") : "0" %>"/> <!-- Thêm năm, kiểm tra giá trị null -->
							    <div class="ms-auto">
							        <button type="submit" class="btn btn-primary" style="width: 100px; margin-right: 15px;">Hoàn thành</button>
							    </div>
							</div>
		                  </div>
		                </div>
						</form>
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
	      const thangSelect = document.getElementById("largeSelectThang");
          for (let i = 1; i <= 12; i++) {
            const option = document.createElement("option");
            option.value = i;
            option.text = i;
            thangSelect.appendChild(option);
          }
          const namSelect = document.getElementById("largeSelectNam");
          for (let i = 2024; i <= 2124; i++) {
            const option = document.createElement("option");
            option.value = i;
            option.text = i;
            namSelect.appendChild(option);
          }
	    </script>
	  </body>
</html>
