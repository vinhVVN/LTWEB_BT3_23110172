<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <!-- Font + Bootstrap -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f5f7fa;
            font-family: "Poppins", sans-serif;
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 260px;
            background: rgba(255, 255, 255, 0.65);
            backdrop-filter: blur(14px);
            box-shadow: 4px 0 25px rgba(0,0,0,0.08);
            padding: 25px 18px;
            position: fixed;
            top: 0;
            bottom: 0;
        }

        .sidebar h4 {
            font-weight: 600;
            color: #333;
            margin-bottom: 25px;
        }

        .menu-link {
            display: block;
            padding: 12px 14px;
            border-radius: 12px;
            font-size: 15px;
            color: #333;
            margin-bottom: 10px;
            text-decoration: none;
            transition: 0.25s;
        }

        .menu-link:hover {
            background: rgba(0,0,0,0.06);
            transform: translateX(5px);
        }

        .menu-link.logout {
            color: #d33;
            font-weight: 600;
        }

        /* Main Content */
        .main-content {
            margin-left: 270px;
            padding: 40px;
            width: calc(100% - 270px);
        }

        /* Header */
        .dashboard-header {
            background: linear-gradient(135deg, #6366f1, #9f7aea);
            padding: 22px 30px;
            border-radius: 20px;
            color: white;
            box-shadow: 0 8px 20px rgba(99,102,241,0.35);
        }

        .dashboard-header h3 {
            font-weight: 600;
        }

        /* Stats Cards */
        .stat-card {
            border-radius: 20px;
            padding: 25px;
            background: white;
            min-height: 130px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            transition: 0.25s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.12);
        }

        .stat-title {
            color: #666;
            font-size: 15px;
        }

        .stat-value {
            font-size: 30px;
            font-weight: 700;
            color: #333;
        }

        .footer-note {
            color: #777;
            font-size: 14px;
            margin-top: 30px;
        }
    </style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h4>⚙️ Quản Trị Admin</h4>

    <a class="menu-link" href="${pageContext.request.contextPath}/admin/home">🏠 Trang chủ</a>

    <!-- Category -->
    <a class="menu-link" href="${pageContext.request.contextPath}/admin/category/list">📂 Quản lý danh mục</a>
    <a class="menu-link" href="${pageContext.request.contextPath}/admin/category/add">➕ Thêm danh mục</a>

    <!-- Product -->
    <a class="menu-link" href="${pageContext.request.contextPath}/admin/product/list">🛒 Quản lý sản phẩm</a>
    <a class="menu-link" href="${pageContext.request.contextPath}/admin/product/add">✨ Thêm sản phẩm</a>

    <!-- Logout -->
    <a class="menu-link logout" href="${pageContext.request.contextPath}/logout">🚪 Đăng xuất</a>
</div>


<!-- Main Content -->
<div class="main-content">

    <!-- Header -->
    <div class="dashboard-header mb-4">
        <h3>📊 Dashboard Admin</h3>
        <p>Chào mừng bạn trở lại! Dưới đây là thống kê hệ thống hôm nay.</p>
    </div>

    <!-- Stats Cards -->
    <div class="row g-4 mt-2">

        <!-- TOTAL CATEGORY -->
        <div class="col-md-3">
            <div class="stat-card">
                <p class="stat-title">Tổng danh mục</p>
                <p class="stat-value">${totalCategory}</p>
            </div>
        </div>

        <!-- TOTAL PRODUCTS -->
        <div class="col-md-3">
            <div class="stat-card">
                <p class="stat-title">Tổng sản phẩm</p>
                <p class="stat-value">${totalProduct}</p>
            </div>
        </div>

        <!-- NEW USERS -->
        <div class="col-md-3">
            <div class="stat-card">
                <p class="stat-title">Người dùng mới</p>
                <p class="stat-value">12</p>
            </div>
        </div>

        <!-- WEBSITE VISIT -->
        <div class="col-md-3">
            <div class="stat-card">
                <p class="stat-title">Lượt truy cập</p>
                <p class="stat-value">1,294</p>
            </div>
        </div>

    </div>

    <p class="footer-note">
        👆 Chọn một mục trong menu bên trái để bắt đầu quản lý hệ thống.
    </p>
</div>

</body>
</html>
