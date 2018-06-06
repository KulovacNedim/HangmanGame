package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.PointsDAOImplementation;
import model.Points;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PointsDAOImplementation pointsDAO = new PointsDAOImplementation();

		ArrayList<Points> arrPoints = new ArrayList<>();
		try {
			arrPoints = pointsDAO.getTopTen();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.getSession().setAttribute("arrPoints", arrPoints);

		RequestDispatcher forward = request.getRequestDispatcher("jsp/dashboard.jsp");
		forward.forward(request, response);
	}

}
