<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Danh sách danh mục</title>
<style>
body {
	background: #f4f6fa;
	font-family: "Poppins", sans-serif;
}

.table-card {
	background: white;
	border-radius: 18px;
	padding: 25px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
	animation: fadeIn 0.6s ease;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(15px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.table thead {
	background: linear-gradient(135deg, #4c6ef5, #5c7cfa);
	color: white;
}

.table tbody tr:hover {
	background: rgba(76, 110, 245, 0.08);
	transition: 0.25s;
}

.img-thumb {
	border-radius: 12px;
	object-fit: cover;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
}

.btn-action {
	padding: 5px 12px;
	border-radius: 8px;
	font-weight: 600;
	text-decoration: none;
}

.btn-edit {
	color: white;
	background: linear-gradient(135deg, #51cf66, #40c057);
}

.btn-edit:hover {
	box-shadow: 0 4px 12px rgba(64, 192, 87, 0.5);
}

.btn-delete {
	color: white;
	background: linear-gradient(135deg, #ff6b6b, #f03e3e);
}

.btn-delete:hover {
	box-shadow: 0 4px 12px rgba(240, 62, 62, 0.5);
}

.page-title {
	font-weight: 700;
	font-size: 26px;
	margin-bottom: 20px;
	color: #343a40;
}
</style>
</head>
<body>
	<h2 class="page-title">📂 Danh sách danh mục</h2>

	<div class="table-card">
		<table class="table table-hover align-middle">
			<thead>
				<tr>
					<th>#</th>
					<th>Icon</th>
					<th>Tên danh mục</th>
					<th class="text-center">Thao tác</th>
				</tr>
			</thead>

			<tbody>
				
				<c:forEach items="${cateList}" var="cate" varStatus="STT">
					<tr>
						<td>${STT.index + 1}</td>

						<!-- Ảnh -->
						<td><img src="${pageContext.request.contextPath}/upload/category/${cate.icon}" width="130" height="90"
							class="img-thumb"></td>

						<td>${cate.catename}</td>

						<td class="text-center"><a
							href="<c:url value='/admin/category/edit?id=${cate.cateid}'/>"
							class="btn-action btn-edit">Sửa</a> &nbsp; <a
							href="<c:url value='/admin/category/delete?id=${cate.cateid}'/>"
							class="btn-action btn-delete">Xóa</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>