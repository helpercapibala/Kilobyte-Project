<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        response.sendRedirect("index.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/includes/head.jsp"%>
    <title>User Login - E-Commerce</title>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>

    <div class="container">
        <div class="card w-50 mx-auto my-5">
            <div class="card-header bg-primary text-white text-center">
                <h4>User Login</h4>
            </div>
            <div class="card-body">
                <form action="user-login" method="post">
                    <div class="form-group mb-3">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="login-email" class="form-control" placeholder="Enter your email" required>
                    </div>
                    <div class="form-group mb-4">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="login-password" class="form-control" placeholder="Enter your password" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary w-100">Login</button>
                    </div>
                </form>
            </div>
            <div class="card-footer text-center">
                <small>Don't have an account? <a href="register.jsp">Register here</a></small>
            </div>
        </div>
    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>
