package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.WordCategoryDAOImplementation;


//@WebServlet("/categoryOptionsServlet")
public class CategoryOptionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		WordCategoryDAOImplementation categoryDAO = new WordCategoryDAOImplementation();
		
		try {
			req.getSession().setAttribute("categories", categoryDAO.getWordCategories());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher success = req.getRequestDispatcher("jsp/categoryOptions.jsp");
		success.forward(req, resp);
	}

}
