package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import model.Category;

public interface CategoryDAOInterface {

	public void insertCategory(String categoryName) throws SQLException ;
	public ArrayList<Category> getCategoryArray() throws SQLException ;
}
