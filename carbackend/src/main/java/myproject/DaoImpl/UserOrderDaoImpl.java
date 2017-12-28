package myproject.DaoImpl;

import myproject.Dao.UserOrderDao;
import myproject.model.User;
import myproject.model.UserOrder;

import org.hibernate.HibernateException;
import java.util.List;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Transactional
@Repository("userOrderDao")
public class UserOrderDaoImpl implements UserOrderDao{

	//private final Logger logger = LoggerFactory.getLogger(CustomerOrderDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	
	public boolean addUserOrder(UserOrder userOrder) {
		
			Session session = sessionFactory.getCurrentSession();
			User user= userOrder.getUser();
			userOrder.setBill(user.getBill());
			userOrder.setShip(user.getShip());
			userOrder.setOrderStatus("Placed");
			session.saveOrUpdate(userOrder);
			session.saveOrUpdate(user);
			session.saveOrUpdate(user.getBill());
			session.saveOrUpdate(user.getShip());

			return true;
		
	}

	public List<UserOrder> getAllOrders() {
		                                            //HQL
			return sessionFactory.getCurrentSession().createQuery("FROM UserOrder").list();

		
	}

	public UserOrder getUserOrderById(int id) {
		
				return sessionFactory.getCurrentSession().get(UserOrder.class, id);
	}

	
	public int changeOrderStatus(int id, String status) {
		
			Query query = sessionFactory.getCurrentSession()
					.createQuery("UPDATE UserOrder SET orderStatus = '" + status + "' where id = " + id);
			return query.executeUpdate();
		
}

	public boolean addCustomerOrder(UserOrder userOrder) {
		// TODO Auto-generated method stub
		return false;
	}
}


