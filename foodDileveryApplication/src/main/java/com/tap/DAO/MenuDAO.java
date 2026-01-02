package com.tap.DAO;

import java.util.List;

import com.tap.model.Menu;

public interface MenuDAO {

	boolean addMenu(Menu menu);

    List<Menu> getAllMenu();

    Menu getMenuById(int menuId);

    List<Menu> getMenuByRestaurantId(int restaurantId);

    boolean updateMenu(Menu menu);

    boolean deleteMenu(int menuId);
}
