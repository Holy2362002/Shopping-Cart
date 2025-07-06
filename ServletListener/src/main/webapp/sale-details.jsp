<%@page import="com.jdc.shop.model.entity.SaleItem"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.jdc.shop.model.entity.Voucher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sale Details</title>
<style>
	/* Base Styles */
body {
    font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 2rem;
    color: #1a1a1a;
    background-color: #f8fafc;
    max-width: 1200px;
    margin: 0 auto;
}

/* Header Styles */
h1 {
    color: #1e293b;
    margin-bottom: 1.5rem;
    font-size: 2rem;
    font-weight: 600;
    border-bottom: 2px solid #e2e8f0;
    padding-bottom: 0.5rem;
}

h3 {
    color: #1e293b;
    margin: 2rem 0 1rem;
    font-size: 1.5rem;
    font-weight: 500;
}

/* Table Styles */
table {
    width: 100%;
    margin: 1rem 0 2rem;
    border-collapse: collapse;
    background-color: white;
    border-radius: 0.5rem;
    overflow: hidden;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

/* Voucher Info Table */
table:first-of-type {
    width: 50%;
    min-width: 400px;
    margin-bottom: 2.5rem;
}

/* Table Header Styles */
thead {
    background-color: #3b82f6;
    color: white;
}

thead td {
    font-weight: 500;
    text-transform: uppercase;
    font-size: 0.875rem;
    letter-spacing: 0.05em;
    padding: 1rem;
}

/* Table Cell Styles */
td {
    padding: 1rem;
    border-bottom: 1px solid #e2e8f0;
}

/* Alternate Row Coloring */
tbody tr:nth-child(even) {
    background-color: #f8fafc;
}

/* Hover Effect */
tbody tr:hover {
    background-color: #f1f5f9;
}

/* Last Row Border Removal */
tr:last-child td {
    border-bottom: none;
}

/* Highlight Important Data */
td:nth-child(2) {
    font-weight: 500;
    color: #1e293b;
}

/* Responsive Adjustments */
@media (max-width: 768px) {
    body {
        padding: 1rem;
    }
    
    table:first-of-type {
        width: 100%;
        min-width: auto;
    }
    
    td {
        padding: 0.75rem;
    }
}
</style>
</head>
<body>

	<%Voucher voucher = (Voucher)request.getAttribute("data"); %>
	
	<%!String formatDateTime(LocalDateTime date) {
		return date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}%>

	<h1>Sale Details</h1>
	
	<table>
		<tr>
			<td>VoucherId</td>
			<td><%=voucher.getId() %></td>
		</tr>
		
		<tr>
			<td>Customer Name</td>
			<td><%=voucher.getCustomer() %></td>
		</tr>
		
		<tr>
			<td>Sale Date Time</td>
			<td><%=formatDateTime(voucher.getSaleTime()) %></td>
		</tr>
	</table>
	
	<h3>Sale Items</h3>
	
	<table>
		<thead>
			<tr>
				<td>Product</td>
				<td>Category</td>
				<td>UnitPrice</td>
				<td>Quantity</td>
				<td>Total</td>
			</tr>
		</thead>
		
		<tbody>
		
			<%for(SaleItem item : voucher.getSales()) { %>
			
				<tr>
					<td><%=item.getProduct().getName() %></td>
					<td><%=item.getProduct().getCategory() %></td>
					<td><%=item.getUnitPrice() %></td>
					<td><%=item.getCount() %></td>
					<td><%=item.getTotalPrice() %></td>
				</tr>
			
			<%} %>
		</tbody>
	</table>
	
	
</body>
</html>