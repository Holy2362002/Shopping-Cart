package com.jdc.shop.controller;

import java.io.IOException;
import java.util.List;

import com.jdc.shop.model.SaleModel;
import com.jdc.shop.model.ShoppingCart;
import com.jdc.shop.model.entity.Voucher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({"/sale-history","/sale-details","/checkout"})
public class SaleServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private SaleModel model;
	
	@Override
	public void init() throws ServletException {
		model = (SaleModel) getServletContext().getAttribute("sale.history");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		switch(req.getServletPath()) {
		case "/sale-history" :
			showSaleHistory(req,resp);
			break;
		case "/sale-details" :
			showDetail(req,resp);
			break;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//get customer name
		var customer = req.getParameter("customer");
		
		//sale item from shopping cart
		var cart = (ShoppingCart)req.getSession().getAttribute("cart");
		var item = cart.items();
		
		//create voucher
		var voucherId = model.createVoucher(customer,item);
		
		
		//reset shopping cart
		req.getSession().removeAttribute("cart");
		
		//redirect 
		resp.sendRedirect(getServletContext().getContextPath().concat("/sale-details.jsp?id=") + voucherId);

	}

	private void showDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var voucherId = req.getParameter("id");
		var id = Integer.parseInt(voucherId);
		
		var voucher = model.findById(id);
		
		req.setAttribute("data", voucher);
		
		getServletContext().getRequestDispatcher("/sale-details.jsp").forward(req, resp);
		
	}

	private void showSaleHistory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Voucher> list = model.getSaleHistory();
		
		req.setAttribute("data", list);
		
		getServletContext().getRequestDispatcher("/sale-list.jsp").forward(req, resp);
		
	}

}
