package com.tap.model;

public class Menu {

	    private int menuId;
	    private int restaurantId;
	    private String itemName;
	    private String description;
	    private double price;
	    private String imageUrl;
	    private float rating;

	    public float getRating() {
			return rating;
		}

		public void setRating(float rating) {
			this.rating = rating;
		}

		public Menu() {}

	    

	    public Menu(int menuId, int restaurantId, String itemName, String description, double price, String imageUrl) {
			super();
			this.menuId = menuId;
			this.restaurantId = restaurantId;
			this.itemName = itemName;
			this.description = description;
			this.price = price;
			this.imageUrl = imageUrl;
//			this.rating = rating;
		}

		public int getMenuId() {
	        return menuId;
	    }

	    public void setMenuId(int menuId) {
	        this.menuId = menuId;
	    }

	    public int getRestaurantId() {
	        return restaurantId;
	    }

	    public void setRestaurantId(int restaurantId) {
	        this.restaurantId = restaurantId;
	    }

	    public String getItemName() {
	        return itemName;
	    }

	    public void setItemName(String itemName) {
	        this.itemName = itemName;
	    }

	    public String getDescription() {
	        return description;
	    }

	    public void setDescription(String description) {
	        this.description = description;
	    }

	    public double getPrice() {
	        return price;
	    }

	    public void setPrice(double price) {
	        this.price = price;
	    }

	    public String getImageUrl() {
	        return imageUrl;
	    }

	    public void setImageUrl(String imageUrl) {
	        this.imageUrl = imageUrl;
	    }

		@Override
		public String toString() {
			return "Menu [menuId=" + menuId + ", restaurantId=" + restaurantId + ", itemName=" + itemName
					+ ", description=" + description + ", price=" + price + ", imageUrl=" + imageUrl + ", rating="
					+ rating + "]";
		}

		
	

}
