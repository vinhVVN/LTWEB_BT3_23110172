<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">IoTStar</a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Sản phẩm</a>
                </li>
            </ul>
            
            <ul class="navbar-nav ms-auto">
                <c:if test="${sessionScope.account == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/login'/>">Đăng nhập</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-light text-primary px-3 ms-2 rounded-pill" href="<c:url value='/register'/>">Đăng ký</a>
                    </li>
                </c:if>
                
                <c:if test="${sessionScope.account != null}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="webUserDropdown" role="button" data-bs-toggle="dropdown">
                            <c:if test="${not empty sessionScope.account.images}">
                                <img src="<c:url value='/upload/user/${sessionScope.account.images}'/>" class="rounded-circle me-2" style="width: 28px; height: 28px; object-fit: cover;">
                            </c:if>
                            ${sessionScope.account.fullname}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="<c:url value='/user/profile'/>">Hồ sơ của tôi</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item text-danger" href="<c:url value='/logout'/>">Đăng xuất</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>