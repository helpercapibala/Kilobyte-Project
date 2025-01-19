<%@page import="connection.DbCon"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>E-Commerce Cart</title>
<style type="text/css">
/* Custom Table Style */
.table thead th {
    background-color: #007bff;
    color: #ffffff;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-size: 14px;
}
.table tbody td {
    vertical-align: middle;
    font-size: 16px;
}

/* Button Styling */
.btn-incre, .btn-decre {
    box-shadow: none;
    font-size: 18px;
    padding: 5px 8px;
}
.btn-primary:hover {
    background-color: #0056b3;
}
.btn-danger:hover {
    background-color: #c82333;
}

/* Responsive Design */
@media (max-width: 768px) {
    .cart-header {
        flex-direction: column;
        align-items: flex-start;
    }
    .cart-header h3 {
        margin-bottom: 10px;
    }
    .table-responsive {
        overflow-x: auto;
    }
}
</style>
</head>
<body>
	<%@include file="/includes/navbar.jsp"%>

	<div class="container my-3">
		<!-- Cart Header -->
		<div class="d-flex justify-content-between align-items-center cart-header py-3">
			<h3>Total Price: $ ${(total > 0) ? dcf.format(total) : 0}</h3>
			<h2>Welcome!</h2>
		</div>

		<!-- Cart Table -->
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th scope="col">Name</th>
						<th scope="col">Category</th>
						<th scope="col">Price</th>
						<th scope="col">Quantity</th>
						<th scope="col">Buy Now</th>
						<th scope="col">Cancel</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (cart_list != null && !cart_list.isEmpty()) {
						for (Cart c : cartProduct) {
					%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%= dcf.format(c.getPrice())%></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a> 
								<input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly> 
								<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
							</div>
							<td><button type="submit" class="btn btn-primary btn-sm bg-success">Buy</button></td>
						</form>
					</td>
					<td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>
					<%
						}
					} else {
					%>
					<tr>
						<td colspan="6" class="text-center">Your cart is empty. <a href="index.jsp">Shop Now</a></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>
