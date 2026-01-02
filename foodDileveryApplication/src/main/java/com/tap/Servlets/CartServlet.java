package com.tap.Servlets;

import com.tap.model.Cart;
import com.tap.model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        if (action == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        switch (action) {

            case "add":
                addItem(request, cart);
                break;

            case "update":
                updateItem(request, cart);
                break;

            case "remove":
                removeItem(request, cart);
                break;
        }

        response.sendRedirect("cart.jsp");
        
    }

    private void addItem(HttpServletRequest request, Cart cart) {
//        int itemId = Integer.parseInt(request.getParameter("itemId"));
//        String name = request.getParameter("name");
//        double price = Double.parseDouble(request.getParameter("price"));
//        int quantity = Integer.parseInt(request.getParameter("quantity"));
//
//        CartItem item = new CartItem(itemId, name, price, quantity);
//        cart.addCartItem(item);
    	 System.out.println("itemId = " + request.getParameter("itemId"));
    	    System.out.println("name = " + request.getParameter("name"));
    	    System.out.println("price = " + request.getParameter("price"));
    	    System.out.println("quantity = " + request.getParameter("quantity"));

    	    // Stop crashing:
    	    if (request.getParameter("itemId") == null ||
    	        request.getParameter("name") == null ||
    	        request.getParameter("price") == null ||
    	        request.getParameter("quantity") == null) {

    	        System.out.println("❌ ERROR: One or more parameters are NULL");
    	        return;
    	    }

    	    int itemId = Integer.parseInt(request.getParameter("itemId"));
    	    String name = request.getParameter("name");
    	    double price = Double.parseDouble(request.getParameter("price"));
    	    int quantity = Integer.parseInt(request.getParameter("quantity"));

    	    cart.addCartItem(new CartItem(itemId, name, price, quantity));
    	    
    }

    private void updateItem(HttpServletRequest request, Cart cart) {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        cart.updateCartItem(itemId, quantity);
    }

    private void removeItem(HttpServletRequest request, Cart cart) {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        cart.removeCartItem(itemId);
        
    }
    
    
}
