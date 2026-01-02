package com.tap.Servlets;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tap.DAOImplement.UserDAO;
import com.tap.model.User;

@WebServlet("/login")
	public class LoginServlet extends HttpServlet {

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws IOException {

	        String email = request.getParameter("email");
	        String password = request.getParameter("password");

	        UserDAO dao = new UserDAO();
	        User user = dao.login(email, password);

	        if (user != null) {
	            HttpSession session = request.getSession();
	            session.setAttribute("userId", user.getId());
	            session.setAttribute("userName", user.getName());

	            response.sendRedirect("HomePage"); // or Menu.jsp
	        } else {
	            response.sendRedirect("login.jsp?error=1");
	        }
	    }
	

}
