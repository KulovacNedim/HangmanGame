package DAO;

import java.sql.SQLException;
import java.util.ArrayList;

import model.Category;

public interface WordCategoryDAOInterface {

	public ArrayList<Category> getWordCategories() throws SQLException;
	
	public ArrayList<Category> getAllWordCategories() throws SQLException;
	
	public Category getCategoryByName(String categoryString) throws SQLException;

}
