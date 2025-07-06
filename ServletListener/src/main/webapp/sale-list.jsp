<%@page import="com.jdc.shop.model.entity.Voucher"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sale History</title>
<style>
	/* Base Styles */
body {
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 2rem;
    color: #1a1a1a;
    background-color: #f9fafb;
    max-width: 1200px;
    margin: 0 auto;
}

/* Header Styles */
h1 {
    color: #111827;
    margin-bottom: 1.5rem;
    font-size: 1.8rem;
    font-weight: 700;
    text-align: center;
    position: relative;
    padding-bottom: 0.5rem;
}

h1:after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 3px;
    background: #3b82f6;
}

/* Table Styles */
table {
    width: 100%;
    max-width: 900px;
    margin: 2rem auto;
    border-collapse: separate;
    border-spacing: 0;
    background-color: white;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
}

/* Table Header */
thead tr {
    background-color: #3b82f6;
    color: white;
}

thead td {
    padding: 1rem 1.25rem;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 0.75rem;
    letter-spacing: 0.05em;
}

/* Table Body */
tbody tr {
    transition: background-color 0.2s ease;
}

tbody tr:nth-child(even) {
    background-color: #f9fafb;
}

tbody tr:hover {
    background-color: #f3f4f6;
}

tbody td {
    padding: 1rem 1.25rem;
    border-bottom: 1px solid #e5e7eb;
    font-size: 0.9rem;
}

/* Link Styles */
a {
    color: #3b82f6;
    text-decoration: none;
    font-weight: 500;
    transition: all 0.2s ease;
    position: relative;
}

a:hover {
    color: #2563eb;
}

a:after {
    content: '';
    position: absolute;
    bottom: -2px;
    left: 0;
    width: 0;
    height: 1px;
    background-color: #2563eb;
    transition: width 0.2s ease;
}

a:hover:after {
    width: 100%;
}

/* Numeric Columns Alignment */
td:nth-child(4),
td:nth-child(5) {
    text-align: right;
    font-family: 'Roboto Mono', monospace;
    color: #374151;
}

/* Responsive Design */
@media (max-width: 768px) {
    body {
        padding: 1rem;
    }
    
    table {
        font-size: 0.85rem;
    }
    
    thead td {
        padding: 0.75rem 0.5rem;
    }
    
    tbody td {
        padding: 0.75rem 0.5rem;
    }
}

/* Empty State (optional) */
tbody:empty:after {
    content: "No sale history found";
    display: block;
    text-align: center;
    padding: 2rem;
    color: #6b7280;
    font-style: italic;
}
</style>
</head>
<body>

	<%!String formatDateTime(LocalDateTime date) {
		return date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}%>

	<%
		@SuppressWarnings("unchecked")
		List<Voucher> list = (List<Voucher>)request.getAttribute("data");
	%>

	<h1>Sale History</h1>

	<table style="width: 70%">
		<thead>
			<tr>
				<td>VoucherID</td>
				<td>Sale Date Time</td>
				<td>Customer Name</td>
				<td>Item Count</td>
				<td>Sale Total</td>
			</tr>
		</thead>

		<tbody>
			<%for(Voucher v : list) { %>
				<tr>
					<td>
					<a href="sale-details?id=<%=v.getId()%>"><%=v.getId() %></a>
					</td>
					<td><%=formatDateTime(v.getSaleTime()) %></td>
					<td><%=v.getCustomer() %></td>
					<td><%=v.count() %></td>
					<td><%=v.total() %></td>
				</tr>
			<%} %>
		</tbody>
	</table>
</body>
</html>