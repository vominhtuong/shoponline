package bookshop.Service.User;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookshop.Dao.UsersDao;
import bookshop.Entity.Users;
@Service
public class AccountServiceImpl implements IAccountService {
	@Autowired
	UsersDao usersDao = new UsersDao();
	
	public int AddAccount(Users user) {
		
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));		
		return usersDao.AddAccount(user);
	}

	@Override
	public Users CheckAccount(Users user) {
		String pass = user.getPassword();
		user = usersDao.GetUserByAccount(user);
		if(user != null) {
			if(BCrypt.checkpw(pass, user.getPassword())) {
				return user;
			}
			else {
				return null;
			}
		}
		return null;
	}

}
