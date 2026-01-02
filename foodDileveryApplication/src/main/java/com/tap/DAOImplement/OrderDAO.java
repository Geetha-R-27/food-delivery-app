package com.tap.DAOImplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.DBconnection.DBconnection;

public class OrderDAO {

    public int saveOrder(int userId, double totalAmount) {

        int orderId = 0;
        String sql = "INSERT INTO orders(user_id, total_amount, status) VALUES (?, ?, ?)";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, userId);
            ps.setDouble(2, totalAmount);
            ps.setString(3, "PLACED");
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderId;
    }

    public void saveOrderItem(int orderId, int itemId, int quantity, double price) {

        String sql = "INSERT INTO order_items(order_id, item_id, quantity, price) VALUES (?, ?, ?, ?)";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ps.setInt(2, itemId);
            ps.setInt(3, quantity);
            ps.setDouble(4, price);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

