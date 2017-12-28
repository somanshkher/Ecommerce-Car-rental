package myproject.Dao;

import java.util.List;

import myproject.model.UserOrder;

public interface UserOrderDao {

	public boolean addCustomerOrder(UserOrder userOrder);
	public List<UserOrder> getAllOrders();
	public UserOrder getUserOrderById(int id);
	public int changeOrderStatus(int id, String status);

}
