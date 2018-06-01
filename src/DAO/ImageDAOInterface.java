package DAO;

import java.sql.SQLException;

public interface ImageDAOInterface {

	public String getImagePath(int misses) throws SQLException;
	
}
