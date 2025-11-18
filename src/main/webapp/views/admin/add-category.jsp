<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        background: #F2F2F7; /* Apple background */
        font-family: -apple-system, BlinkMacSystemFont, "SF Pro Display", sans-serif;
    }

    .apple-card {
        max-width: 480px;
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
        font-weight: 500;
        color: #3A3A3C;
        margin-bottom: 6px;
        display: block;
    }

    .apple-input-group {
        margin-bottom: 20px;
    }

    .apple-input {
        width: 100%;
        padding: 12px 14px;
        border: 1px solid #D1D1D6;
        border-radius: 12px;
        background: #F9F9FB;
        font-size: 16px;
        transition: 0.25s;
    }

    .apple-input:focus {
        border-color: #007AFF;
        box-shadow: 0 0 0 4px rgba(0,122,255,0.12);
        outline: none;
        background: #fff;
    }

    /* File Upload Button */
    .apple-file-box input[type="file"] {
        display: none;
    }

    .apple-file-btn {
        background: #E5E5EA;
        padding: 10px 20px;
        border-radius: 10px;
        display: inline-block;
        cursor: pointer;
        color: #1C1C1E;
        font-weight: 500;
        transition: 0.2s;
    }

    .apple-file-btn:hover {
        background: #D8D8DD;
    }

    /* Image preview */
    .apple-preview {
        width: 180px;
        height: 130px;
        object-fit: cover;
        border-radius: 14px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.15);
        margin-top: 18px;
    }

    /* Buttons */
    .apple-btn-group {
        display: flex;
        justify-content: space-between;
        margin-top: 25px;
    }

    .apple-btn {
        border: none;
        padding: 12px 25px;
        border-radius: 12px;
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
        background: #D8D8DD;
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
	<form action="add" method="post" enctype="multipart/form-data" class="apple-card">

    <h2 class="apple-title">Thêm danh mục</h2>

    <!-- Name -->
    <div class="apple-input-group">
        <label class="apple-label">Tên danh mục</label>
        <input type="text" name="catename" class="apple-input" placeholder="Nhập tên danh mục…" required>
    </div>

    <!-- Image -->
    <div class="apple-input-group">
        <label class="apple-label">Ảnh đại diện</label>

        <div class="apple-file-box">
            <input type="file" id="iconInput" name="icon" accept="image/*" required>
            <label for="iconInput" class="apple-file-btn">
                Chọn ảnh
            </label>
        </div>
    </div>

    <!-- Image preview -->
    <div class="text-center">
        <img id="previewImg" class="apple-preview" style="display:none;">
    </div>

    <div class="apple-btn-group">
        <button type="reset" class="apple-btn light">Hủy</button>
        <button type="submit" class="apple-btn blue">Thêm</button>
    </div>

</form>





<script>
    document.getElementById('iconInput').onchange = function (event) {
        const file = event.target.files[0];
        if (file) {
            let img = document.getElementById('previewImg');
            img.src = URL.createObjectURL(file);
            img.style.display = "block";
        }
    };
</script>
	
</body>
</html>