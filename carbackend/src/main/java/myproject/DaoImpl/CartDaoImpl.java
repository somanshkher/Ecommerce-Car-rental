package myproject.DaoImpl;



import java.io.IOException;
import java.util.List;
import javax.transaction.Transactional;
//import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import myproject.Dao.CartDao;
import myproject.model.Cart;

@Repository("cartDao")
@Transactional

public class CartDaoImpl implements CartDao{
	
	@Autowired(required=true)
	SessionFactory sessionFactory;
	

	

	public List<Cart> getCartList(String username) {
		
			Query query = sessionFactory.getCurrentSession()
					.createQuery("from Cart where username = '" + username + "' and status='NEW'");
			return query.list();
		
	}

	public boolean save(Cart cart) {
		// TODO Auto-generated method stub
		
			sessionFactory.getCurrentSession().save(cart);
			return true;
	}

	
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		
			sessionFactory.getCurrentSession().delete(getCartById(id));
			return true;
		
	}

	
	public boolean update(Cart cart) {
		
			sessionFactory.getCurrentSession().update(cart);
			return true;
		
	}

	
	public long getTotalAmount(String username) {
					Query query = sessionFactory.getCurrentSession().createQuery(
					"SELECT SUM(price*quantity) FROM Cart where username='" + username + "' and status = 'NEW'");
			if (query.uniqueResult() == null) {
				return 0;
			} else {
				long result =  (Long) query.uniqueResult();
				return result;
			}

			}

	
	public Cart getCartByUsername(String username, String productname) {
					Query query = sessionFactory.getCurrentSession().createQuery("from Cart WHERE username='" + username
					+ "' and product_name='" + productname + "' and status = 'NEW'");
						return (Cart) query.uniqueResult();
		
	}

	public int getQuantity(String username, String productname) {
					Query query = sessionFactory.getCurrentSession().createQuery("SELECT quantity from Cart WHERE username='"
					+ username + "' and product_name='" + productname + "' and status = 'NEW'");
						return  (Integer) query.uniqueResult();
		
		
	}

	
	public long getNumberOfProducts(String username) {
		
			Query query = sessionFactory.getCurrentSession()
					.createQuery("SELECT SUM(quantity) FROM Cart where username='" + username + "' and status = 'NEW'");
			if (query.uniqueResult() == null) {
				return 0;
			} else {
				long result =  (Long) query.uniqueResult();
				return result;
			}
			}

	
	public Cart getCartById(int id) {
		
			return sessionFactory.getCurrentSession().get(Cart.class, id);
			}

	
	public int clearCart(String username) {
		
			/*
			 * Query query = sessionFactory.getCurrentSession()
			 * .createQuery("UPDATE Cart SET status='OLD' where username = '" +
			 * username + "'");
			 */
			Query query = sessionFactory.getCurrentSession()
					.createQuery("DELETE from Cart where username = '" + username + "'");
			return query.executeUpdate();

			}

	public Cart validate(int cartId) throws IOException {
		
		Cart cart = getCartById(cartId);
		if (cart == null) {
			throw new IOException(cartId + "");
		}
		update(cart);
		return cart;
	}

}