package validation;

import java.sql.SQLException;

import DAO.UserDAOImplementation;
import model.User;


public class RegisterValidation {

	UserDAOImplementation userDAO = new UserDAOImplementation();

	public boolean isUserNameAvailable(String userName) throws SQLException {

		User user = userDAO.getContactByUserName(userName);
		
		return user == null ? true : false;
	}

	

	public boolean isValidPassword(String password) throws SQLException {
//koristim
		return password.trim().length() >= 8 ? true : false;

	}

//	private static boolean isSpecialCharacter(Character c) {
//		return !Character.isLetterOrDigit(c) && 
//				!Character.isSpaceChar(c);
//	}

}
