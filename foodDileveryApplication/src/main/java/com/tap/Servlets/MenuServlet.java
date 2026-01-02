package com.tap.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.DAO.MenuDAO;
import com.tap.DAOImplement.MenuDAOImpl;
import com.tap.model.Menu;

@WebServlet("/Menu")
public class MenuServlet extends HttpServlet {



	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MenuDAOImpl impl = new MenuDAOImpl();
		impl.getMenuByRestaurantId(0);
		
		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		List<Menu> allMenu = impl.getAllMenu();
		for(Menu menu : allMenu) {
			System.out.println(menu);
		}
		req.setAttribute("allMenu", allMenu);
		RequestDispatcher rd = req.getRequestDispatcher("Menu.jsp");
		rd.forward(req, resp);
		

	}
	
	

}