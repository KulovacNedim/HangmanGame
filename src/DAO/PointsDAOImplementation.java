package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import model.Points;

public class PointsDAOImplementation implements PointsDAOInterface {
	
	Connection connection = DBConnection.getConnectionToDatabase();

	@Override
	public void saveScore(int userID, int score) throws SQLException {
		
		String query = "INSERT INTO points(UserID, Points) VALUES (?, ?)";

		try (PreparedStatement statement = connection.prepareStatement(query);) {

			statement.setInt(1, userID);
			statement.setInt(2, score);

			statement.executeUpdate();
		}

	}
	
	@Override
	public ArrayList<Points> getTopTen() throws SQLException {
		
		UserDAOImplementation userDAO = new UserDAOImplementation();
		
		ArrayList<Points> topTen = new ArrayList<>();
		
		String query = "SELECT * FROM points ORDER BY Points DESC LIMIT 10;";

		ResultSet rs = null;

		try (Statement statement = connection.createStatement();) {

			rs = statement.executeQuery(query);

			while (rs.next()) {
				String userName = userDAO.getUser(rs.getInt("UserID")).getUsername();
				Points points = new Points(rs.getInt("UserID"), userName, rs.getInt("Points"));
				topTen.add(points);
			}
		}
		
		return topTen;

	}

}
