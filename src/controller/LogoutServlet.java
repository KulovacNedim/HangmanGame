package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.PointsDAOImplementation;
import model.Game;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

	PointsDAOImplementation pointsDAO = new PointsDAOImplementation();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Game game = (Game)req.getSession().getAttribute("game");
		
		//ponavlja se
		if (game.getGeneralScore() != 0) {
			try {
				pointsDAO.saveScore(game.getUser().getUserID(), Game.getGeneralScore());
				Game.setGeneralScore(0);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		HttpSession session = req.getSession();
		session.invalidate();
		req.getRequestDispatcher("jsp/login.jsp").forward(req, resp);
	}
}
