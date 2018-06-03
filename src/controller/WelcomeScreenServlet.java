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

/**
 * Servlet implementation class WelcomeScreenServlet
 */
@WebServlet("/welcome")
public class WelcomeScreenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PointsDAOImplementation pointsDAO = new PointsDAOImplementation();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Game game = (Game) request.getSession().getAttribute("game");

		try {//staviti if - da ne snima ako je nula
			System.out.println("get: jjj " +game.getGeneralScore());
			if (game.getGeneralScore() != 0) {
				pointsDAO.saveScore(game.getUser().getUserID(), Game.getGeneralScore());
				Game.setGeneralScore(0);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		RequestDispatcher success = request.getRequestDispatcher("jsp/welcome.jsp");
		success.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
	}

}
