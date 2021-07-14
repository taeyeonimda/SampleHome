package home.user.dao.map;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import home.common.domain.Page;
import home.user.domain.User;

public interface UserMap {
	List<User> getUsers(Page page);
	User getUser(String userId);
	User loginUser(User user);
	
	void addUser(User user);
	void updateUser(User user);
	void deleteUser(User user);
	
	int getUsersCnt();
}
