package myproject.Dao;

import java.util.List;

import myproject.model.Product;

public interface ProductDao {

	
	boolean addProduct(Product p);
	boolean deleteProduct(int productId);
	boolean updateProduct(Product p);
	List<Product> getAllProduct();
	Product getProductById(int productId);
	List<Product> getProductByCategory(String categoryId);
}
