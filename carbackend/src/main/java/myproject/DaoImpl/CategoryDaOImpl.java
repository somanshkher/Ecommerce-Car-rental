package myproject.DaoImpl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import myproject.Dao.CategoryDao;
import myproject.model.Category;

@Repository("categoryDao")
@Transactional
public class CategoryDaOImpl implements CategoryDao {
	public boolean deleteCategory(Category c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Autowired
 	SessionFactory sessionFactory;

	public boolean addCategory(Category c) {

 		Session s=sessionFactory.getCurrentSession();
 		c.setCatId(c.getCatName());
 		s.persist(c);
 		return true;
		
	}

	public boolean deleteCategory(String catid) {
		
	Session s=sessionFactory.getCurrentSession();
	Category c =(Category)s.load(Category.class, catid);
	s.delete(c);
	return true;
	}

	
	public boolean updateCategory(Category c) {
		Session s= sessionFactory.getCurrentSession();
		//Category c =(Category)s.load(Category.class, c);
		s.update(c);
	return true;
	}

	public List<Category> getAllCategory() {
		 Session s=sessionFactory.getCurrentSession();
		Query q= s.createQuery(" from Category");
		List<Category> l= q.list();
		return l;
	}

	public Category getCategoryById(String catid) {
		Session s=sessionFactory.getCurrentSession();
		Query<Category> g=s.createQuery("from Category where catId=?");
		g.setParameter(0,catid);
		Category mq=(Category)g.getSingleResult();
		return  mq;
		
	}

	
	
 	}
