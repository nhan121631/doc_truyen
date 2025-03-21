<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng ký</title>
</head>
<body>
    <div class="container">
        <div class="register-form">
            <div class="main-div">
                <!-- Thông báo lỗi nếu tên đăng nhập đã tồn tại -->
                <c:if test="${errorMessage != null}">
                    <div class="alert alert-danger">
                        <!-- Tên đăng nhập đã tồn tại! -->
                        ${errorMessage }
                    </div>
                </c:if>
                <form action="${pageContext.request.contextPath}/register" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Họ và tên" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="username" name="userName" placeholder="Tên đăng nhập" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Đăng ký</button>
                </form>
                <div class="login-link">
                    <p>Đã có tài khoản? <a href="${pageContext.request.contextPath}/dang-nhap">Đăng nhập ngay</a></p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
