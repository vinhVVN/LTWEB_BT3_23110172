<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
            font-family: "Poppins", sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        /* Hiệu ứng bong bóng mềm */
        .bubble {
            position: absolute;
            width: 180px;
            height: 180px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            filter: blur(20px);
            animation: float 6s infinite ease-in-out;
        }
        .bubble:nth-child(1) { top: 10%; left: 15%; animation-delay: 0s; }
        .bubble:nth-child(2) { top: 60%; left: 70%; animation-delay: 1.5s; }
        .bubble:nth-child(3) { top: 40%; left: 10%; animation-delay: 3s; }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-30px); }
            100% { transform: translateY(0px); }
        }

        /* Card Glassmorphism */
        .card-glass {
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border-radius: 25px;
            padding: 35px;
            border: 1px solid rgba(255, 255, 255, 0.35);
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.15);
            animation: fadeIn 0.8s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(25px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .title {
            font-weight: 700;
            background: linear-gradient(45deg, #ff0844, #ffb199);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .input-group-text {
            background: rgba(255, 255, 255, 0.5);
            border: none;
            border-radius: 12px 0 0 12px;
        }

        .form-control {
            border-radius: 12px;
            border: none;
            background: rgba(255, 255, 255, 0.6);
        }

        .btn-gradient {
            background: linear-gradient(135deg, #ff0844, #ffb199);
            border: none;
            font-weight: bold;
            color: white;
            border-radius: 12px;
            padding: 10px;
            transition: 0.3s;
            box-shadow: 0 4px 12px rgba(255, 104, 104, 0.4);
        }

        .btn-gradient:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 18px rgba(255, 104, 104, 0.6);
        }

        a.custom-link {
            color: #ff4d6d;
            font-weight: 600;
            text-decoration: none;
        }
        a.custom-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<!-- Bong bóng decor -->
<div class="bubble"></div>
<div class="bubble"></div>
<div class="bubble"></div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5">

            <div class="card-glass">
                <h2 class="text-center mb-3 title">🔑 Đặt lại mật khẩu</h2>

                <c:if test="${message != null}">
                    <div class="alert alert-info text-center">${message}</div>
                </c:if>

                <form action="${pageContext.request.contextPath}/forgot-password" method="post">

                    <!-- Email -->
                    <div class="mb-3 input-group">
                        <span class="input-group-text">
                            <i class="fa fa-envelope"></i>
                        </span>
                        <input type="email" name="email"
                               placeholder="Nhập email của bạn"
                               class="form-control" required>
                    </div>

                    <!-- Password -->
                    <div class="mb-3 input-group">
                        <span class="input-group-text">
                            <i class="fa fa-lock"></i>
                        </span>
                        <input type="password" name="new-pass"
                               placeholder="Mật khẩu mới"
                               class="form-control" required>
                    </div>

                    <button type="submit" class="btn btn-gradient w-100">
                        Xác nhận đặt lại
                    </button>
                </form>

                <p class="text-center mt-3">
                    <a href="${pageContext.request.contextPath}/login" class="custom-link">⬅ Quay lại đăng nhập</a>
                </p>

            </div>
        </div>
    </div>
</div>

</body>
</html>
