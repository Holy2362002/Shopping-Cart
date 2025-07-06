package com.jdc.shop.listener;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import com.jdc.shop.model.ProductModel;
import com.jdc.shop.model.entity.Product;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class ProductLoader implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		//create ProductModel
		ProductModel model = new ProductModel();
		
		//readfile and add Product
		String filePath = sce.getServletContext().getRealPath("/WEB-INF/product.txt");
		try(BufferedReader input = new BufferedReader(new FileReader(filePath))) {
			String line = null;
			while(null != (line = input.readLine())) {
				var array = line.split("\t");
				model.add(new Product(array[0], array[1], Integer.parseInt(array[2])));
			}
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		

		//add productModel to application scope
		sce.getServletContext().setAttribute("products", model);
	}
}
