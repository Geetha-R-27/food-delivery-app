package com.tap.model;



import java.util.Date;
import java.util.Map;

public class Order {

    private int orderId;
    private int userId;
    private double totalAmount;
    private String status;
    private Date orderDate;
    private Map<Integer, CartItem> orderItems;

    public Order() {}

    public Order(int userId, double totalAmount, String status, Date orderDate) {
        this.userId = userId;
        this.totalAmount = totalAmount;
        this.status = status;
        this.orderDate = orderDate;
    }

    // getters and setters
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Date getOrderDate() { return orderDate; }
    public void setOrderDate(Date orderDate) { this.orderDate = orderDate; }

    public Map<Integer, CartItem> getOrderItems() { return orderItems; }
    public void setOrderItems(Map<Integer, CartItem> orderItems) {
        this.orderItems = orderItems;
    }
}
