<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang đăng ký</title>
</head>
<body>
	<form action="register" method="post" class="container mt-4"
		style="max-width: 400px;">
		<h2 class="text-center mb-3">Tạo tài khoản mới</h2>

		<!-- Thông báo lỗi -->
		<c:if test="${alert != null}">
			<div class="alert alert-danger text-center">${alert}</div>
		</c:if>

		<!-- Tài khoản -->
		<div class="mb-3 input-group">
			<span class="input-group-text"><i class="fa fa-user"></i></span> <input
				type="text" class="form-control" name="username"
				placeholder="Tài khoản" required>
		</div>

		<!-- Họ tên -->
		<div class="mb-3 input-group">
			<span class="input-group-text"><i class="fa fa-id-card"></i></span> <input
				type="text" class="form-control" name="fullname"
				placeholder="Họ tên" required>
		</div>

		<!-- Email -->
		<div class="mb-3 input-group">
			<span class="input-group-text"><i class="fa fa-envelope"></i></span>
			<input type="email" class="form-control" name="email"
				placeholder="Nhập Email" required>
		</div>

		<!-- Số điện thoại -->
		<div class="mb-3 input-group">
			<span class="input-group-text"><i class="fa fa-phone"></i></span> <input
				type="text" class="form-control" name="phone"
				placeholder="Số điện thoại" required>
		</div>

		<!-- Mật khẩu -->
		<div class="mb-3 input-group">
			<span class="input-group-text"><i class="fa fa-lock"></i></span> <input
				type="password" class="form-control" name="password"
				placeholder="Mật khẩu" required>
		</div>

		<!-- Nhập lại mật khẩu -->
		<div class="mb-3 input-group">
			<span class="input-group-text"><i class="fa fa-lock"></i></span> <input
				type="password" class="form-control" name="repassword"
				placeholder="Nhập lại mật khẩu" required>
		</div>

		<!-- Nút tạo tài khoản -->
		<div class="d-grid">
			<button type="submit" class="btn btn-primary">Tạo tài khoản</button>
		</div>

		<!-- Đăng nhập -->
		<p class="text-center mt-3">
			Nếu bạn đã có tài khoản? <a href="login.jsp">Đăng nhập</a>
		</p>
	</form>

	<!-- Thêm link Bootstrap và Font Awesome -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</body>
</html>