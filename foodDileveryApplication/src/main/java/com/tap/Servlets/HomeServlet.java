package com.tap.Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.DAO.RestaurantDAO;
import com.tap.DAOImplement.RestaurantDAOImpl;
import com.tap.model.Restaurant;

@WebServlet("/HomePage")
public class HomeServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RestaurantDAOImpl impl = new RestaurantDAOImpl();
		List<Restaurant> allRestaurants = impl.getAllRestaurants();
		
		for(Restaurant restaurant : allRestaurants) {
			System.out.println(restaurant);
		}
		req.setAttribute("allRestaurants", allRestaurants);
		
		RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
		rd.forward(req, resp);
	}
	
	
}
