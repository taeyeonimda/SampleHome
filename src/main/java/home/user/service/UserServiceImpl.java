package home.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import home.common.domain.Page;
import home.user.dao.UserDao;
import home.user.domain.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	public void addUser(User user) {
		userDao.addUser(user);
	}

	public User loginUser(User user) {
		return userDao.loginUser(user);
	}

	@Override
	public User getUser(String userId) {
		// TODO Auto-generated method stub
		return userDao.getUser(userId);
	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public void deleteUser(User user) {
		userDao.deleteUser(user);
	}

	
	public List<User> getUsers(Page page) {
		// TODO Auto-generated method stub
		return userDao.getUsers(page);
	}

	@Override
	public int getUsersCnt() {
		// TODO Auto-generated method stub
		return userDao.getUsersCnt();
	}
}
