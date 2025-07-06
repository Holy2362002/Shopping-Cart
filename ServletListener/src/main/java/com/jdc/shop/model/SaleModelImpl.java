package com.jdc.shop.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.jdc.shop.model.entity.SaleItem;
import com.jdc.shop.model.entity.Voucher;

public class SaleModelImpl implements SaleModel {
	
	private List<Voucher> list;
	
	public SaleModelImpl() {
		list = new ArrayList<Voucher>();
	}

	@Override
	public List<Voucher> getSaleHistory() {
		// TODO Auto-generated method stub
		return new ArrayList<Voucher>(list);
	}

	@Override
	public Voucher findById(int id) {
		for(Voucher v : list) {
			if(v.getId() == id) {
				return v;
			}
		}
		return null;
	}

	@Override
	public int createVoucher(String customer, List<SaleItem> item) {
		Voucher voucher = new Voucher();
		voucher.setCustomer(customer);
		voucher.setSaleTime(LocalDateTime.now());
		voucher.setSales(item);
		voucher.setId(list.size() + 1);
		list.add(voucher);
		
		
		return voucher.getId();
	}

}
