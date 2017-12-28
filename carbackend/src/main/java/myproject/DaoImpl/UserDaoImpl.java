package myproject.DaoImpl;


import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproject.Dao.UserDao;
import myproject.model.Authorities;
import myproject.model.User;



@Repository("userDao")
@Transactional

public class UserDaoImpl implements UserDao {

	public User userById(int id) {
		try {
			return (User) sessionFactory.getCurrentSession().get(User.class, id);
		} catch (HibernateException e) {
			
			e.printStackTrace();
			throw e;
			
		}
	}
	public User usersById(int id) {
		try {
			@SuppressWarnings("rawtypes")
			Query query = sessionFactory.getCurrentSession().createQuery("FROM User where userID=" + id);
			return (User) query.uniqueResult();
		} catch (HibernateException e) {
			
			e.printStackTrace();
			throw e;
		}

	}
	
	
	
	public User userByuserName(String username) {
		try {
			@SuppressWarnings("rawtypes")
			Query query = sessionFactory.getCurrentSession().createQuery("from User where userName= '" + username + "'");
			User user = (User) query.uniqueResult();

			return user;
		} catch (HibernateException e) {
			
			e.printStackTrace();
			throw e;
		}
	}
	
	
	
	
	public boolean getStatus(int id) {
		User users = usersById(id);
		return users.isActive();
		}
	
	
	
	
	public int changeStatus(int id) {
		try {
			User users = usersById(id);
			boolean isEnable = users.isActive();

			if (isEnable) {
				@SuppressWarnings("rawtypes")
				Query query = sessionFactory.getCurrentSession()
						.createQuery("UPDATE User SET enabled = " + false + " WHERE userID = " + id);
				return query.executeUpdate();
			} else {
				@SuppressWarnings("rawtypes")
				Query query = sessionFactory.getCurrentSession()
						.createQuery("UPDATE User SET enabled = " + true + " WHERE userID = " + id);
				return query.executeUpdate();
			}
		} catch (HibernateException e) {
			
			e.printStackTrace();
			throw e;
			
		}
	}
	public boolean update(User u) {
		// TODO Auto-generated method stub
		return false;
	}
	@Autowired
	SessionFactory sessionFactory;
	User user = new User();
	@Autowired
	UserDao userDao;
		public boolean addUser(User u) {
		/*	Session s1=sessionFactory.getCurrentSession();
			s1.persist(u);
			return true;*/
			return false;
		}
		public boolean save(User u) {
			Session session=sessionFactory.getCurrentSession();
			u.getBill().setUser(u);
			u.getShip().setUser(u);
			u.setActive(true);
			session.persist(u); 
			session.persist(u.getBill());
			session.persist(u.getShip());
			
			Authorities auth = new Authorities();
			auth.setAuthority("ROLE_USER");
			auth.setUsername(u.getUserName());
			session.persist(auth);
			return true;
		}

	/*	public boolean deleteUser(User u) {
			Session s1 =sessionFactory.getCurrentSession();
			Query<User> query=s1.createQuery("delete from User where userID= "+u.getUserID());    
			query.executeUpdate();  
			return true;
		}
		public boolean updateUser(User u) {
		Session s1 =sessionFactory.getCurrentSession();
		String hql = "update User set userName ='"+u.getUserName()+"',userPass='"+u.getUserPass()+"'+userEmail='"+u.getUserEmail()+"' where userID='"+u.getUserID();
		Query<User> q = s1.createQuery(hql);
		int a=q.executeUpdate();
		System.out.println("Deleted: " +a+ " user(s)");
			return true;
		}
		public List<User> getAllUser() {
			
			Session s=sessionFactory.getCurrentSession();
			Query query=s.createQuery("from User");
			List<User> list=query.getResultList(); 
			return list;
		}
		public User getUserByID(Integer userID) {
			Session s1 =sessionFactory.getCurrentSession();
			Query<User> q = s1.createQuery("from User where userID="+userID);
		User	user = (User)q.getSingleResult();
		return user;
		}*/

	}
	
	
	

