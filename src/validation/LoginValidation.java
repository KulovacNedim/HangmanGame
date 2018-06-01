package validation;

import java.sql.SQLException;

import DAO.UserDAOImplementation;

public class LoginValidation {

	UserDAOImplementation userDAO = new UserDAOImplementation();

	public boolean validationLogin(String nickName, String password) throws SQLException {

		if (userDAO.getUserByUserNameAndPass(nickName, password) != null) {
			return true;
		} else {
			return false;
		}

	}
}
