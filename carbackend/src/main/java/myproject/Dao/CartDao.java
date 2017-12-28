package myproject.Dao;



import java.io.IOException;
import java.util.List;

import myproject.model.Cart;





public interface CartDao {

	public List<Cart> getCartList(String username);

	public boolean save(Cart cart);

	public boolean delete(int id);

	public boolean update(Cart cart);

	public int getQuantity(String username, String productname);

	public long getTotalAmount(String username);

	public Cart getCartByUsername(String username, String productname);

	public long getNumberOfProducts(String username);

	public Cart getCartById(int id);

	public int clearCart(String username);

	public Cart validate(int cartId) throws IOException;
	
}

