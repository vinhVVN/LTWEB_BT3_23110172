<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Thêm sản phẩm</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(145deg, #eef1f7, #dfe4eb);
        font-family: "Poppins", sans-serif;
        min-height: 100vh;
        padding: 30px;
    }

    /* Apple-style Card */
    .apple-card {
        max-width: 720px;
        background: rgba(255, 255, 255, 0.75);
        backdrop-filter: blur(18px);
        margin: auto;
        padding: 40px;
        border-radius: 28px;
        box-shadow: 0 15px 45px rgba(0,0,0,0.12);
        animation: fadeUp 0.55s ease;
    }

    @keyframes fadeUp {
        from {opacity: 0; transform: translateY(30px);}
        to {opacity: 1; transform: translateY(0);}
    }

    .form-label {
        font-weight: 600;
        color: #333;
    }

    .apple-title {
        font-size: 30px;
        font-weight: 700;
        text-align: center;
        margin-bottom: 25px;
        color: #333;
    }

    .form-control, .form-select {
        border-radius: 14px;
        padding: 12px 15px;
        border: 1px solid #d1d5db;
        transition: 0.25s;
    }

    .form-control:focus, .form-select:focus {
        border-color: #4f46e5;
        box-shadow: 0 0 0 4px rgba(99,102,241,0.25);
    }

    /* Preview image */
    .img-preview {
        width: 140px;
        height: 140px;
        border-radius: 18px;
        object-fit: cover;
        display: none;
        margin-top: 10px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    }

    /* Button */
    .btn-apple {
        background: linear-gradient(135deg, #6366f1, #8b5cf6);
        border: none;
        font-weight: 600;
        padding: 12px 18px;
        border-radius: 14px;
        color: white;
        width: 100%;
        margin-top: 10px;
        transition: 0.25s;
    }

    .btn-apple:hover {
        background: linear-gradient(135deg, #4f46e5, #7c3aed);
        box-shadow: 0 10px 22px rgba(99, 102, 241, 0.35);
    }

</style>
</head>

<body>

<div class="apple-card">

    <h2 class="apple-title">➕ Thêm sản phẩm mới</h2>

    <c:if test="${not empty message}">
        <div class="alert alert-danger">${message}</div>
    </c:if>

    <form action="<c:url value='/admin/product/add'/>" 
          method="post" enctype="multipart/form-data">

        <div class="mb-3">
            <label class="form-label">Tên sản phẩm</label>
            <input type="text" name="productname" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Giá</label>
            <input type="number" name="price" class="form-control" step="0.01" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Danh mục</label>
            <select name="cateid" class="form-select">
                <c:forEach items="${cateList}" var="cate">
                    <option value="${cate.cateid}">
                        ${cate.catename}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Mô tả sản phẩm</label>
            <textarea name="description" class="form-control" rows="3"></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Ảnh sản phẩm</label>
            <input type="file" name="image" class="form-control" accept="image/*" onchange="previewImage(event)">
            <img id="preview" class="img-preview">
        </div>

        <button type="submit" class="btn-apple">Thêm sản phẩm</button>
    </form>
</div>


<script>
    // Preview ảnh trực tiếp
    function previewImage(event){
        const img = document.getElementById("preview");
        img.src = URL.createObjectURL(event.target.files[0]);
        img.style.display = "block";
    }
</script>

</body>
</html>
