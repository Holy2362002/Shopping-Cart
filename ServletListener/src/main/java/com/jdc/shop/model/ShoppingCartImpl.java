package com.jdc.shop.model;

import java.util.ArrayList;
import java.util.List;

import com.jdc.shop.model.entity.Product;
import com.jdc.shop.model.entity.SaleItem;

class ShoppingCartImpl implements ShoppingCart {

	private static final long serialVersionUID = 1L;

	private List<SaleItem> items;

	public ShoppingCartImpl() {
		items = new ArrayList<SaleItem>();
	}

	@Override
	public void add(Product p) {
		var item = findByProduct(p.getId());
		if(item == null) {
			item = new SaleItem();
			item.setProduct(p);
			items.add(item);
		}
		
		item.addOne();
	}

	@Override
	public void clear() {
		items.clear();
	}

	@Override
	public int itemCount() {
		int count = 0;
		for(SaleItem item : items) {
			count += item.getCount();
		}
		return count;
	}

	@Override
	public int total() {
		int total = 0;
		for(SaleItem item : items) {
			total += item.getTotalPrice();
		}
		return total;
	}
	
	private SaleItem findByProduct(int product) {
		for(SaleItem item : items) {
			if(item.getProduct().getId() == product) {
				return item;
			}
		}
		return null;
	}

	@Override
	public List<SaleItem> items() {
		
		return new ArrayList<SaleItem>(items);
	}

	@Override
	public void cartChangeItem(boolean plus, int productId) {
		var item = findByProduct(productId);
		
		if(item != null) {
			item.chageCart(plus);
			
			if(item.getCount() == 0) {
				items.remove(item);
			}
		}
		
	}

}
