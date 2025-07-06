package com.jdc.shop.model;

import java.io.Serializable;
import java.util.List;

import com.jdc.shop.model.entity.Product;
import com.jdc.shop.model.entity.SaleItem;

public interface ShoppingCart extends Serializable{
	
	void add(Product p);
	
	void clear();
	
	void cartChangeItem(boolean plus,int productId);
	
	int itemCount();
	
	int total();
	
	List<SaleItem> items();
	
	public static ShoppingCart generate() {
		return new ShoppingCartImpl();
	}

}
