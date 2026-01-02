package com.tap.DAO;

import java.util.List;

import com.tap.model.Restaurant;


public interface RestaurantDAO {

	boolean addRestaurant(Restaurant r);
    Restaurant getRestaurantById(int id);
    List<Restaurant> getAllRestaurants();
    boolean updateRestaurant(Restaurant r);
    boolean deleteRestaurant(int id);
}
