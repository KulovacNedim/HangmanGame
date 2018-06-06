package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ImageDAOImplementation implements ImageDAOInterface {

	Connection connection = DBConnection.getConnectionToDatabase();

	@Override
	public String getImagePath(int misses) throws SQLException {

		String path = "";

		String query = "SELECT * FROM images WHERE RecordID = " + misses;

		ResultSet rs = null;

		try (Statement statement = connection.createStatement();) {

			rs = statement.executeQuery(query);

			rs.next();
			
			path = rs.getString("ImagePath");
		}
		return path;
	}

}
