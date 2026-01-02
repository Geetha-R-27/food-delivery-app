package com.tap.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

//	private Map<Integer, CartItem> items;
//	
//	public Cart() {
//		this.items= new HashMap<>();
//	}
//	
//	
//	public void addItem(CartItem item) {
//		int itemId = item.getItemId();
//		if(items.containsKey(itemId)) {
//			CartItem existingItem = items.get(itemId);
//			int newQua = item.getQuantity();
//			
//			int oldQua = existingItem.getQuantity();
//			
//			int sumQua = existingItem.getQuantity();
//			
//			existingItem.setQuantity(sumQua);
//		
//		}
//		else {
//			items.put(itemId, item);
//		}
//	}
//	


	    private Map<Integer, CartItem> cartItems;

	    public Cart() {
	        cartItems = new HashMap<>();
	    }

	    // ADD ITEM
	    public void addCartItem(CartItem item) {
	        if (cartItems.containsKey(item.getItemId())) {
	            CartItem existing = cartItems.get(item.getItemId());
	            existing.setQuantity(existing.getQuantity() + item.getQuantity());
	        } else {
	            cartItems.put(item.getItemId(), item);
	        }
	    }

	    // UPDATE ITEM QUANTITY
	    public void updateCartItem(int itemId, int newQuantity) {
	        if (cartItems.containsKey(itemId)) {
	            if (newQuantity <= 0) {
	                cartItems.remove(itemId);
	            } else {
	                cartItems.get(itemId).setQuantity(newQuantity);
	            }
	        }
	    }

	    // REMOVE ITEM
	    public void removeCartItem(int itemId) {
	        cartItems.remove(itemId);
	    }

	    // GET ALL ITEMS
	    public Map<Integer, CartItem> getAllItems() {
	        return cartItems;
	    }

	    // GET TOTAL CART PRICE
	    public double getTotalPrice() {
	        double total = 0;
	        for (CartItem item : cartItems.values()) {
	            total += item.getTotalPrice();
	        }
	        return total;
	    }
	}


