package com.tap.DAOImplement;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.DBconnection.DBconnection;
import com.tap.DAO.RestaurantDAO;
import com.tap.model.Restaurant;



public class RestaurantDAOImpl implements RestaurantDAO {



    Connection getConnection() throws SQLException {
        return DBconnection.getConnection();
    }

    @Override
    public boolean addRestaurant(Restaurant r) {
        String sql = "INSERT INTO restaurants(name, image_url, rating, address, description, eta) VALUES (?,?,?,?,?,?)";

        try (Connection con = DBconnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, r.getName());
            ps.setString(2, r.getImageUrl());
            ps.setDouble(3, r.getRating());
            ps.setString(4, r.getAddress());
            ps.setString(5, r.getDescription());
            ps.setString(6, r.getEta());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Restaurant getRestaurantById(int id) {
        String sql = "SELECT * FROM restaurants WHERE id=?";
        Restaurant r = null;

        try (Connection con = DBconnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                r = new Restaurant();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                r.setImageUrl(rs.getString("image_url"));
                r.setRating(rs.getDouble("rating"));
                r.setAddress(rs.getString("address"));
                r.setDescription(rs.getString("description"));
                r.setEta(rs.getString("eta"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
    }

    @Override
    public List<Restaurant> getAllRestaurants() {
        String sql = "SELECT * FROM restaurants";
        List<Restaurant> list = new ArrayList<>();

        try (Connection con = DBconnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Restaurant r = new Restaurant();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                r.setImageUrl(rs.getString("image_url"));
                r.setRating(rs.getDouble("rating"));
                r.setAddress(rs.getString("address"));
                r.setDescription(rs.getString("description"));
                r.setEta(rs.getString("eta"));
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean updateRestaurant(Restaurant r) {
        String sql = "UPDATE restaurants SET name=?, image_url=?, rating=?, address=?, description=?, eta=? WHERE id=?";

        try (Connection con = DBconnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, r.getName());
            ps.setString(2, r.getImageUrl());
            ps.setDouble(3, r.getRating());
            ps.setString(4, r.getAddress());
            ps.setString(5, r.getDescription());
            ps.setString(6, r.getEta());
            ps.setInt(7, r.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteRestaurant(int id) {
        String sql = "DELETE FROM restaurants WHERE id=?";

        try (Connection con = DBconnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
