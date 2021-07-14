package home.user.dao;

import java.util.List;

import home.common.domain.Page;
import home.user.domain.User;
public interface UserDao {
	List<User> getUsers(Page page);
	User getUser(String userId);
	User loginUser(User user);
	
	void addUser(User user);
	void updateUser(User user);
	void deleteUser(User user);
	
	int getUsersCnt();
}
