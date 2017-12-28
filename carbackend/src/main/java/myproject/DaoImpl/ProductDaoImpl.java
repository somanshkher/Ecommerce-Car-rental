package myproject.DaoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import myproject.Dao.ProductDao;
import myproject.model.Product;


@Repository("productDao")
@Transactional

public class ProductDaoImpl implements ProductDao {

	@Autowired
 	SessionFactory sessionFactory;
	
	public boolean addProduct(Product p) {

 		Session s=sessionFactory.getCurrentSession();
 		s.persist(p);
		return true;
	}

	public boolean deleteProduct(int prorn) {
		Session s=sessionFactory.getCurrentSession();
		Product p =(Product)s.load(Product.class, prorn);
		s.delete(p);
		return true;
	}

	public boolean updateProduct(Product p) {
		Session s=sessionFactory.getCurrentSession();
		//p.setProRn(p.getProNm());
		s.update(p);
		return true;
	}

	public List<Product> getAllProduct() {
		 Session s=sessionFactory.getCurrentSession();
			Query q= s.createQuery("from Product");
			List<Product> l= q.list();
		return l;
	}

	
	public Product getProductById(int prorn) {
		Session s=sessionFactory.getCurrentSession();
		Query<Product> h=s.createQuery("from Product where proRn=?");
		h.setParameter(0,prorn);
		Product p=(Product)h.getSingleResult();
		return  p;
	}

	public List<Product> getProductByCategory(String catId) {
		Session s1 =sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query q = s1.createQuery("from Product where categoryId=?");
		q.setString(0,catId);
		@SuppressWarnings("unchecked")
	    List<Product> pro = (List<Product>)q.getResultList();
	    return pro;
	}
	

}

	
	

