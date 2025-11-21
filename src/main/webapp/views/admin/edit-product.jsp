<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa sản phẩm</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(145deg, #eef1f7, #dfe4eb);
        font-family: "Poppins", sans-serif;
        min-height: 100vh;
        padding: 35px;
    }

    /* Apple-style Card */
    .apple-card {
        max-width: 760px;
        background: rgba(255, 255, 255, 0.8);
        backdrop-filter: blur(20px);
        margin: auto;
        padding: 42px;
        border-radius: 28px;
        box-shadow: 0 15px 50px rgba(0,0,0,0.12);
        animation: fadeUp 0.55s ease;
    }

    @keyframes fadeUp {
        from {opacity: 0; transform: translateY(30px);}
        to {opacity: 1; transform: translateY(0);}
    }

    .apple-title {
        font-size: 32px;
        font-weight: 700;
        text-align: center;
        margin-bottom: 30px;
        color: #333;
    }

    .form-control, .form-select {
        border-radius: 14px;
        padding: 12px 15px;
        border: 1px solid #d1d5db;
        transition: 0.25s;
        font-size: 15px;
    }

    .form-control:focus, .form-select:focus {
        border-color: #4f46e5;
        box-shadow: 0 0 0 4px rgba(99,102,241,0.25);
    }

    /* Current Image */
    .current-img {
        width: 150px;
        height: 150px;
        border-radius: 16px;
        object-fit: cover;
        margin-bottom: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.18);
    }

    /* Preview Image */
    .img-preview {
        width: 150px;
        height: 150px;
        display: none;
        border-radius: 16px;
        object-fit: cover;
        margin-top: 10px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.18);
    }

    /* Button */
    .btn-apple {
        background: linear-gradient(135deg, #6366f1, #8b5cf6);
        border: none;
        font-weight: 600;
        padding: 13px 18px;
        font-size: 16px;
        border-radius: 14px;
        color: white;
        width: 100%;
        transition: 0.25s;
        margin-top: 10px;
    }

    .btn-apple:hover {
        background: linear-gradient(135deg, #4f46e5, #7c3aed);
        box-shadow: 0 10px 25px rgba(99, 102, 241, 0.35);
    }
</style>
</head>

<body>

<div class="apple-card">

    <h2 class="apple-title">✏ Chỉnh sửa sản phẩm</h2>

    <c:if test="${not empty message}">
        <div class="alert alert-danger">${message}</div>
    </c:if>

    <form action="<c:url value='/admin/product/edit'/>" 
          method="post" enctype="multipart/form-data">

        <input type="hidden" name="id" value="${product.productid}">

        <div class="mb-3">
            <label class="form-label">Tên sản phẩm</label>
            <input type="text" name="productname" class="form-control"
                   value="${product.productname}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Giá</label>
            <input type="number" name="price" class="form-control"
                   value="${product.price}" step="0.01" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Danh mục</label>
            <select name="cateid" class="form-select">
                <c:forEach items="${cateList}" var="cate">
                    <option value="${cate.cateid}"
                        <c:if test="${cate.cateid == product.cateid}">selected</c:if>>
                        ${cate.catename}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Mô tả</label>
            <textarea name="description" class="form-control"
                      rows="3">${product.description}</textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Ảnh hiện tại</label><br>
            <img src="${pageContext.request.contextPath}/upload/product/${product.image}" class="current-img">

            <label class="form-label mt-3">Đổi ảnh mới</label>
            <input type="file" name="image" class="form-control" accept="image/*"
                   onchange="previewImage(event)">
            

            <img id="preview" class="img-preview">
            <small class="text-muted">Để trống nếu không muốn đổi ảnh.</small>
        </div>

        <button type="submit" class="btn-apple">💾 Cập nhật</button>
    </form>
</div>


<script>
    // Preview ảnh mới
    function previewImage(event){
        const img = document.getElementById("preview");
        img.src = URL.createObjectURL(event.target.files[0]);
        img.style.display = "block";
    }
</script>

</body>
</html>
