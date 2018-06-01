package DAO;

import java.sql.SQLException;
import java.util.ArrayList;

import model.Points;

public interface PointsDAOInterface {

	public void saveScore(int userID, int score) throws SQLException;
	
	public ArrayList<Points> getTopTen() throws SQLException;

}
