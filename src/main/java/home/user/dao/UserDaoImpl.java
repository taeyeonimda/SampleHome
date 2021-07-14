package home.user.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import home.common.domain.Page;
import home.user.dao.map.UserMap;
import home.user.domain.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private UserMap userMap;

	public void addUser(User user) {
		userMap.addUser(user);
	}
	public User loginUser(User user) {
		return userMap.loginUser(user);
	}

	@Override
	public User getUser(String userId) {
		return userMap.getUser(userId);
	}

	@Override
	public void updateUser(User user) {
		userMap.updateUser(user);
	}

	@Override
	public void deleteUser(User user) {
		userMap.deleteUser(user);
	}

	@Override
	public List<User> getUsers(Page page) {
		// TODO Auto-generated method stub
		return userMap.getUsers(page);
	}

	@Override
	public int getUsersCnt() {
		// TODO Auto-generated method stub
		return userMap.getUsersCnt();
	}
}
