package myproject.Dao;

import myproject.model.User;

public interface UserDao {

	
	public boolean addUser(User u);
	/*public boolean updateUser(User u);
	public boolean deleteUser(String userid);
	List<User> getAllUser();
	User getUserById(String userid);
	*/
	public boolean save(User u);
	public User userById(int id);
	public User usersById(int id);
	public User userByuserName(String username);
	public boolean getStatus(int id);
	public int changeStatus(int id);
	public boolean update(User u);
	
	
}
