<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        background: #F2F2F7;
        font-family: -apple-system, BlinkMacSystemFont, "SF Pro Display", sans-serif;
    }

    .apple-card {
        max-width: 500px;
        margin: 40px auto;
        padding: 32px;
        background: #FFFFFF;
        border-radius: 20px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.08);
    }

    .apple-title {
        text-align: center;
        font-size: 26px;
        font-weight: 600;
        color: #1C1C1E;
        margin-bottom: 25px;
    }

    .apple-label {
        font-size: 15px;
        color: #3A3A3C;
        font-weight: 500;
        margin-bottom: 6px;
        display: block;
    }

    .apple-input-group {
        margin-bottom: 22px;
    }

    .apple-input {
        width: 100%;
        padding: 12px 15px;
        border-radius: 12px;
        background: #F9F9FB;
        border: 1px solid #D1D1D6;
        font-size: 16px;
        transition: 0.2s;
    }

    .apple-input:focus {
        border-color: #007AFF;
        background: #fff;
        box-shadow: 0 0 0 4px rgba(0,122,255,0.12);
        outline: none;
    }

    /* Preview image */
    .apple-preview {
        width: 180px;
        height: 130px;
        object-fit: cover;
        border-radius: 14px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.15);
        margin-top: 10px;
    }

    /* File upload */
    .apple-file-box input[type="file"] {
        display: none;
    }

    .apple-file-btn {
        background: #E5E5EA;
        padding: 10px 20px;
        border-radius: 10px;
        cursor: pointer;
        color: #1C1C1E;
        font-weight: 500;
        transition: 0.2s;
        display: inline-block;
    }

    .apple-file-btn:hover {
        background: #D8D8DD;
    }

    /* Buttons */
    .apple-btn-group {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
    }

    .apple-btn {
        padding: 12px 26px;
        border-radius: 12px;
        border: none;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: 0.25s;
    }

    .apple-btn.light {
        background: #E5E5EA;
        color: #1C1C1E;
    }

    .apple-btn.light:hover {
        background: #D0D0D5;
    }

    .apple-btn.blue {
        background: #007AFF;
        color: white;
        box-shadow: 0 4px 12px rgba(0,122,255,0.25);
    }

    .apple-btn.blue:hover {
        background: #0063CC;
    }
</style>
</head>
<body>
	<c:url value="/admin/category/edit" var="edit"></c:url>

<form action="${edit}" method="post" enctype="multipart/form-data" class="apple-card">

    <h2 class="apple-title">Chỉnh sửa danh mục</h2>

    <input type="hidden" name="id" value="${category.cateid}">

    <!-- Name -->
    <div class="apple-input-group">
        <label class="apple-label">Tên danh mục</label>
        <input type="text" class="apple-input" name="catename" value="${category.catename}" required>
    </div>

    <!-- Old image -->
    <div class="apple-input-group">
        <label class="apple-label">Ảnh hiện tại</label>

        <img id="previewImg" src="${pageContext.request.contextPath}/upload/category/${category.icon}" 
        		class="apple-preview">
    </div>

    <!-- Upload new -->
    <div class="apple-input-group">
        <label class="apple-label">Thay đổi ảnh đại diện</label>

        <div class="apple-file-box">
            <input type="file" id="iconInput" name="icon" accept="image/*">
            <label for="iconInput" class="apple-file-btn">Chọn ảnh mới</label>
        </div>
    </div>

    <div class="apple-btn-group">
        <button type="reset" class="apple-btn light">Hủy</button>
        <button type="submit" class="apple-btn blue">Cập nhật</button>
    </div>

</form>


<script>
    // Preview ảnh mới khi user chọn file
    document.getElementById("iconInput").onchange = function(evt) {
        const file = evt.target.files[0];
        if (file) {
            let img = document.getElementById("previewImg");
            img.src = URL.createObjectURL(file);
        }
    };
</script>
	
</body>
</html>