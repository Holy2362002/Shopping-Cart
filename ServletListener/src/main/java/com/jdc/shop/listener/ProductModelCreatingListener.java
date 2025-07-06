package com.jdc.shop.listener;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.jdc.shop.model.ProductModel;

import jakarta.servlet.ServletContextAttributeEvent;
import jakarta.servlet.ServletContextAttributeListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class ProductModelCreatingListener implements ServletContextAttributeListener{

	@Override
	public void attributeAdded(ServletContextAttributeEvent scae) {
		
		var value = scae.getValue();
		
		scae.getServletContext().log(String.format("Attrivute value is %s", value));

		if(value instanceof ProductModel) {
			var name = scae.getName();
			scae.getServletContext().log(String.format("Product Model creating at %s",
					LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))));
			scae.getServletContext().log(String.format("Attribute name is %s", name));
			ProductModel model = (ProductModel) value;
			scae.getServletContext().log(String.format("Product count is %s", model.getList().size()));
		}
	}
}
