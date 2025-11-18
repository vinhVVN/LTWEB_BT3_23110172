<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Danh sách sản phẩm</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<style>
    body {
        background: #f4f6fa;
        font-family: "Poppins", sans-serif;
    }

    /* Header title */
    .page-title {
        font-size: 28px;
        font-weight: 600;
        color: #333;
    }

    /* Smart Card Table */
    .smart-card {
        background: #ffffff;
        border-radius: 22px;
        padding: 28px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        animation: fadeIn 0.45s ease;
    }

    @keyframes fadeIn {
        from {opacity: 0; transform: translateY(20px);}
        to {opacity: 1; transform: translateY(0);}
    }

    table thead {
        background: linear-gradient(135deg, #6366f1, #8b5cf6);
        color: white;
    }

    table thead th {
        padding: 14px;
        font-size: 15px;
        font-weight: 500;
        border: none;
    }

    table tbody tr {
        transition: 0.25s;
    }

    table tbody tr:hover {
        background: #f1f3fa;
        transform: scale(1.01);
    }

    /* Image styles */
    .product-img {
        width: 90px;
        height: 90px;
        object-fit: cover;
        border-radius: 14px;
        box-shadow: 0 6px 16px rgba(0,0,0,0.15);
    }

    /* Tags */
    .price-tag {
        background: #e0f4ff;
        color: #0077cc;
        padding: 6px 12px;
        border-radius: 8px;
        font-weight: 600;
        font-size: 14px;
    }

    .cate-tag {
        background: #f3e8ff;
        padding: 6px 12px;
        border-radius: 8px;
        color: #8b5cf6;
        font-weight: 600;
        font-size: 14px;
    }

    /* Buttons */
    .btn-smart {
        border-radius: 10px;
        padding: 6px 14px;
        font-weight: 500;
    }

    .btn-edit {
        background: #ffbf00;
        color: white;
    }

    .btn-edit:hover {
        background: #e0a800;
    }

    .btn-delete {
        background: #ef4444;
        color: white;
    }

    .btn-delete:hover {
        background: #d62828;
    }

    .btn-add {
        background: #6366f1;
        color: white;
        border-radius: 12px;
        padding: 10px 18px;
        font-weight: 600;
        box-shadow: 0 8px 20px rgba(99, 102, 241, 0.3);
    }

    .btn-add:hover {
        background: #4f46e5;
        box-shadow: 0 10px 25px rgba(99, 102, 241, 0.4);
    }
</style>
</head>

<body>

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="page-title">📦 Danh sách sản phẩm</h2>

        <a href="<c:url value='/admin/product/add'/>" class="btn btn-add">
            ➕ Thêm sản phẩm
        </a>
    </div>

    <div class="smart-card">
        <table class="table align-middle table-borderless">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Hình</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Danh mục</th>
                    <th class="text-center">Thao tác</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${productList}" var="product" varStatus="STT">
                    <tr>
                        <td>${STT.index + 1}</td>

                        <td>
                            <img src="${pageContext.request.contextPath}/upload/product/${product.image}"
                                 class="product-img" alt="Product">
                        </td>

                        <td>
                            <strong>${product.productname}</strong>
                        </td>

                        <td>
                            <span class="price-tag">${product.price} đ</span>
                        </td>

                        <td>
                            <c:forEach items="${cateList}" var="cate">
								<c:if test="${product.cateid == cate.cateid}">
                       				<span class="cate-tag">${cate.catename}</span>
                   				</c:if>
							</c:forEach>
						</td>

                        <td class="text-center">
                            <a href="<c:url value='/admin/product/edit?id=${product.productid}'/>"
                               class="btn btn-edit btn-smart">✏ Sửa</a>
                            &nbsp;
                            <a href="<c:url value='/admin/product/delete?id=${product.productid}'/>"
                               onclick="return confirm('Bạn chắc chắn muốn xóa?')"
                               class="btn btn-delete btn-smart">🗑 Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>
    </div>
</div>

</body>
</html>
