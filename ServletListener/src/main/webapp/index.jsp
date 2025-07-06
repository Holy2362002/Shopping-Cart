<%@page import="com.jdc.shop.model.ShoppingCart"%>
<%@page import="com.jdc.shop.model.entity.Product"%>
<%@page import="com.jdc.shop.model.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Listener Demo</title>
<style>
	body {
    font-family: 'Arial', sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 20px;
    color: #333;
    background-color: #f5f5f5;
}

h1 {
    color: #2c3e50;
    text-align: center;
    margin-bottom: 30px;
    padding-bottom: 10px;
    border-bottom: 2px solid #3498db;
}

p {
    text-align: center;
    margin: 15px 0;
}

a {
    color: #3498db;
    text-decoration: none;
    transition: color 0.3s;
}

a:hover {
    color: #2980b9;
    text-decoration: underline;
}

table {
    width: 60%;
    margin: 20px auto;
    border-collapse: collapse;
    box-shadow: 0 2px 3px rgba(0,0,0,0.1);
    background-color: white;
}

table tr:nth-child(even) {
    background-color: #f2f2f2;
}

table tr:hover {
    background-color: #e9e9e9;
}

table th, table td {
    padding: 12px 15px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

table th {
    background-color: #3498db;
    color: white;
    font-weight: bold;
}

table td {
    vertical-align: middle;
}

/* Style for the shopping cart link */
p > a[href="cart-show"] {
    font-weight: bold;
    color: #e74c3c;
}

/* Style for the clear cart link */
p > a[href="cart-clear"] {
    color: #e74c3c;
    font-weight: bold;
}

/* Style for the Add to Cart links */
td > a[href^="cart-add"] {
    display: inline-block;
    padding: 5px 10px;
    background-color: #2ecc71;
    color: white;
    border-radius: 3px;
    font-size: 0.9em;
}

td > a[href^="cart-add"]:hover {
    background-color: #27ae60;
    text-decoration: none;
}

/* Style for the Sale History link */
p > a[href="sale-history"] {
    display: inline-block;
    margin-top: 20px;
    padding: 8px 15px;
    background-color: #9b59b6;
    color: white;
    border-radius: 4px;
}

p > a[href="sale-history"]:hover {
    background-color: #8e44ad;
    text-decoration: none;
}
</style>
</head>
<body>
	<h1>Listener</h1>
	<p>
		Shopping Cart : <a href="cart-show">
			<%ShoppingCart cart = (ShoppingCart)session.getAttribute("cart"); %>
			<%=null == cart ? 0 : cart.itemCount() %>
		</a>
	</p>
	
	<p>
		<%if(cart != null && cart.itemCount() > 0) { %>
		
			<a href="cart-clear">Clear cart</a>
		<%} %>
	</p>
	
		<%
			ProductModel model = (ProductModel)application.getAttribute("products");
		%>
	<table style="width: 60%">
		<tr>
			<td>Id</td>
			<td>Name</td>
			<td>Category</td>
			<td>Price</td>
			<td>Add</td>
		</tr>
		
		<%
		 	for(int i = 0; i < model.getList().size();i++) {
		 		Product p = model.getList().get(i);
		 	
		%>
		
		<tr>
			<td>
				<%=p.getId() %>
			</td>
			<td>
				<%=p.getName() %>
			</td>
			<td>
				<%=p.getCategory() %>
			</td>
			<td>
				<%=p.getPrice() %>
			</td>
			<td>
				<a href="cart-add?product=<%=p.getId()%>">Add To Cart</a>
			</td>
		</tr>
		
		<%
		 	}
		%>
		
	</table>
	
	<p>
		<a href="sale-history">Sale-History</a>
	</p>
</body>
</html>