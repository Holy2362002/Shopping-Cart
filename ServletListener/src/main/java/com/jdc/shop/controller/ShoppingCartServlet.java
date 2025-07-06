package com.jdc.shop.controller;

import java.io.IOException;

import com.jdc.shop.model.ProductModel;
import com.jdc.shop.model.ShoppingCart;
import com.jdc.shop.model.entity.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/cart-add", "/cart-show", "/cart-clear","/cart-plus","/cart-minus" })
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		switch (req.getServletPath()) {
		case "/cart-add": addToCart(req, resp);
			break;
		case "/cart-show": getServletContext().getRequestDispatcher("/my-cart.jsp").forward(req, resp);
			break;
		case "/cart-clear": cartClear(req, resp);
			break;
		case "/cart-plus" :
		case "/cart-minus" :
			changeCartItem(req,resp);
			break;
		}

	}
	
	private void changeCartItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//get parameter from jsp
		var product = req.getParameter("product");
		
		var plus = "/cart-plus".equals(req.getServletPath());
		//getSession 
		var session = req.getSession(true);
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
		
		cart.cartChangeItem(plus,Integer.parseInt(product));
		
		//forward to jsp
		getServletContext().getRequestDispatcher("/my-cart.jsp").forward(req, resp);
		
	}

	private void cartClear(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		var session = req.getSession(true);
		
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
		
		if(cart != null) {
			cart.clear();
		}
		
		getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
	}

	private void addToCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// get product Id
		String strId = req.getParameter("product");

		// get Product Model from application scope
		ProductModel model = (ProductModel) getServletContext().getAttribute("products");

		// find product by id
		Product product = model.findById(Integer.parseInt(strId));

		// set shopping cart to session scope
		var session = req.getSession(true);
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
		if(cart == null) {
			cart = ShoppingCart.generate();
			session.setAttribute("cart", cart);
		}

		// add product to shopping cart
		cart.add(product);

		// forward to jsp
		getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
	}
}
