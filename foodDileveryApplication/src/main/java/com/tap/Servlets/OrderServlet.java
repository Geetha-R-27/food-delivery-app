package com.tap.Servlets;


import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.tap.DAOImplement.OrderDAO;
import com.tap.model.Cart;
import com.tap.model.CartItem;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // ✅ Session check
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getAllItems().isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        double total = cart.getTotalPrice();

        OrderDAO dao = new OrderDAO();
        int orderId = dao.saveOrder(userId, total);

        for (CartItem item : cart.getAllItems().values()) {
            dao.saveOrderItem(
                orderId,
                item.getItemId(),
                item.getQuantity(),
                item.getPrice()
            );
        }

        session.removeAttribute("cart");

        request.setAttribute("orderId", orderId);
        request.getRequestDispatcher("orderSuccess.jsp").forward(request, response);
    }
}
