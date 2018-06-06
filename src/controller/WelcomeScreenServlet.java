package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.PointsDAOImplementation;
import model.Game;

@WebServlet("/welcome")
public class WelcomeScreenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PointsDAOImplementation pointsDAO = new PointsDAOImplementation();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Game game = (Game) request.getSession().getAttribute("game");

		try {
			if (Game.getGeneralScore() != 0) {
				pointsDAO.saveScore(game.getUser().getUserID(), Game.getGeneralScore());
				Game.setGeneralScore(0);
			}
			game.setMisses(7);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("game", game);

		RequestDispatcher success = request.getRequestDispatcher("jsp/welcome.jsp");
		success.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
