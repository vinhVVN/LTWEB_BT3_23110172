<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri = "jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang đăng nhập</title>
</head>
<body>
	<form action="login" method="post" class="container mt-4"
		style="max-width: 400px;">
		<h2 class="text-center mb-3">LOGIN</h2>

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


		<!-- Mật khẩu -->
		<div class="mb-3 input-group">
			<span class="input-group-text"><i class="fa fa-lock"></i></span> <input
				type="password" class="form-control" name="password"
				placeholder="Mật khẩu" required>
		</div>

		<div class="d-grid">
			<button type="submit" class="btn btn-primary">Đăng nhập</button>
		</div>

		<p class="text-center mt-3">
			Nếu bạn chưa có tài khoản? <a href="register.jsp">Đăng ký</a>
		</p>
	</form>

	<!-- Thêm link Bootstrap và Font Awesome -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</body>
</html>