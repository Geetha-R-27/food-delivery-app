package com.tap.DAOImplement;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.DBconnection.DBconnection;
import com.tap.DAO.MenuDAO;
import com.tap.model.Menu;


public class MenuDAOImpl implements MenuDAO {

 

    // DB Connection
	Connection getConnection() throws SQLException {
        return DBconnection.getConnection();
    }

    @Override
    public boolean addMenu(Menu menu) {
        String sql = "INSERT INTO menu (restaurant_id, item_name, description, price, image_url) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getItemName());
            ps.setString(3, menu.getDescription());
            ps.setDouble(4, menu.getPrice());
            ps.setString(5, menu.getImageUrl());
            

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Menu> getAllMenu() {
        List<Menu> list = new ArrayList<>();

        String sql = "SELECT * FROM menu";

        try (Connection conn = DBconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Menu menu = new Menu(
                        rs.getInt("menu_id"),
                        rs.getInt("restaurant_id"),
                        rs.getString("item_name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getString("image_url")
                        
                );
                list.add(menu);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Menu getMenuById(int menuId) {
        String sql = "SELECT * FROM menu WHERE menu_id = ?";
        Menu menu = null;

        try (Connection conn = DBconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, menuId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                menu = new Menu(
                        rs.getInt("menu_id"),
                        rs.getInt("restaurant_id"),
                        rs.getString("item_name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getString("image_url")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menu;
    }

    @Override
    public List<Menu> getMenuByRestaurantId(int restaurantId) {
        List<Menu> list = new ArrayList<>();

        String sql = "SELECT * FROM menu WHERE restaurant_id = ?";

        try (Connection conn = DBconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Menu menu = new Menu(
                        rs.getInt("menu_id"),
                        rs.getInt("restaurant_id"),
                        rs.getString("item_name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getString("image_url")
                );
                list.add(menu);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean updateMenu(Menu menu) {
        String sql = "UPDATE menu SET item_name=?, description=?, price=?, image_url=? WHERE menu_id=?";

        try (Connection conn = DBconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, menu.getItemName());
            ps.setString(2, menu.getDescription());
            ps.setDouble(3, menu.getPrice());
            ps.setString(4, menu.getImageUrl());
            ps.setInt(5, menu.getMenuId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteMenu(int menuId) {
        String sql = "DELETE FROM menu WHERE menu_id = ?";

        try (Connection conn = DBconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, menuId);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
