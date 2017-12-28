package myproject.model;


import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.springframework.stereotype.Component;

@Entity
@Component
public class UserOrder  implements Serializable {

	
	//private static final long serialVersionUID = -6817737978600394223L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@OneToOne
	@JoinColumn(name = "userId")
	private User user;

	@OneToOne
	@JoinColumn(name = "billingAddressId")
	private Billing bill;

	@OneToOne
	@JoinColumn(name = "shippingAddressId")
	private Shipping ship;

	private String orderStatus;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Billing getBill() {
		return bill;
	}

	public void setBill(Billing bill) {
		this.bill = bill;
	}

	public Shipping getShip() {
		return ship;
	}

	public void setShip(Shipping ship) {
		this.ship = ship;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	/*public static long getSerialversionuid() {
		return serialVersionUID;
	}
*/

}