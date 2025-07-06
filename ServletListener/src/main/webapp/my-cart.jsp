<%@page import="java.text.DecimalFormat"%>
<%@page import="com.jdc.shop.model.entity.SaleItem"%>
<%@page import="com.jdc.shop.model.ShoppingCart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Show</title>
<style>
	body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 20px;
    color: #333;
    background-color: #f9f9f9;
    max-width: 1200px;
    margin: 0 auto;
}

h1 {
    color: #2c3e50;
    text-align: center;
    margin-bottom: 15px;
}

h3 {
    color: #2c3e50;
    margin-top: 30px;
    border-bottom: 1px solid #eee;
    padding-bottom: 10px;
}

p {
    text-align: center;
    color: #666;
    margin-bottom: 25px;
}

a {
    color: #3498db;
    text-decoration: none;
    transition: all 0.3s ease;
}

a:hover {
    color: #2980b9;
    text-decoration: underline;
}

table {
    width: 60%;
    margin: 20px auto;
    border-collapse: collapse;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    background-color: white;
}

table th {
    background-color: #3498db;
    color: white;
    padding: 12px;
    text-align: left;
}

table td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
    vertical-align: middle;
}

table tr:nth-child(even) {
    background-color: #f8f8f8;
}

table tr:hover {
    background-color: #f1f1f1;
}

/* Quantity controls */
td a[href*="cart-plus"], 
td a[href*="cart-minus"] {
    display: inline-block;
    padding: 2px 8px;
    margin: 0 5px;
    background-color: #f0f0f0;
    border-radius: 3px;
    color: #333;
    font-weight: bold;
}

td a[href*="cart-plus"]:hover, 
td a[href*="cart-minus"]:hover {
    background-color: #3498db;
    color: white;
    text-decoration: none;
}

/* Total row styling */
table tr:last-child {
    font-weight: bold;
    background-color: #e8f4fc;
}

/* Home link styling */
p > a[href="index.jsp"] {
    display: inline-block;
    padding: 8px 15px;
    background-color: #95a5a6;
    color: white;
    border-radius: 4px;
}

p > a[href="index.jsp"]:hover {
    background-color: #7f8c8d;
    text-decoration: none;
}

/* Checkout form styling */
form {
    max-width: 500px;
    margin: 30px auto;
    padding: 20px;
    background: white;
    border-radius: 5px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
    color: #2c3e50;
}

input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
}

button[type="submit"] {
    background-color: #2ecc71;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
}

button[type="submit"]:hover {
    background-color: #27ae60;
}

hr {
    border: 0;
    height: 1px;
    background: #ddd;
    margin: 30px 0;
}
</style>
</head>
<body>
	<h1>Shopping Cart Show</h1>
	<p>Items details in shopping cart</p>

	<%
	ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
	%>
	
	<p>
		<a href="index.jsp">Home</a>
	</p>

	<table style="width: 60%">
		<tr>
			<td>Product Name</td>
			<td>Category</td>
			<td>Unit Price</td>
			<td>Count</td>
			<td>Total</td>
		</tr>

		<%
		for (SaleItem item : cart.items()) {
		%>

		<tr>
			<td><%=item.getProduct().getName()%></td>
			<td><%=item.getProduct().getCategory()%></td>
			<td><%=item.getUnitPrice()%></td>
			<td>
			<a href="cart-plus?product=<%=item.getProduct().getId()%>">+</a>
			<%=item.getCount()%>
			<a href="cart-minus?product=<%=item.getProduct().getId()%>">-</a>
			</td>
			<td><%=item.getTotalPrice()%></td>
		</tr>

		<%
		}
		%>
		
		<%!String format(int data) {
			
			return new DecimalFormat("#,##0").format(data);
		}
		
		
		%>

		<tr>
			<td colspan="3">Total</td>
			<td><%=cart.itemCount() %></td>
			<td><%=format(cart.total())%></td>
		</tr>
	</table>
	
	<hr />
	
	<h3>Check Out</h3>
	
	<form action="checkout" method="post">
		<label>Customer Name</label>
		<input type="text" placeholder="Enter customer name" name="customer"/>
		<button type="submit">Check Out</button>
		
	</form>

	
</body>
</html>