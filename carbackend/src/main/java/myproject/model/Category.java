	package myproject.model;

	import java.util.HashSet;
	import java.util.Set;

	import javax.persistence.CascadeType;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
	import javax.persistence.Table;

	import org.springframework.stereotype.Component;

	@Entity
	@Component
	@Table(name="Category")
	public class Category {
	@Id
	private String catId;
	private String catName;
	private String catType;
    private String brnds;
    public String getCatId() {
		return catId;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public String getCatType() {
		return catType;
	}
	public void setCatType(String catType) {
		this.catType = catType;
	}
	public void setCatId(String catId) {
		this.catId = catId;
	}
	
	@ManyToOne
	@JoinColumn(name="brnds" , insertable=false, nullable=false, updatable=false)
	private Brand brand; 
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
    
	public String getBrnds() {
		return brnds;
	}
	public void setBrnds(String brnds) {
		this.brnds = brnds;
	}
    
	@OneToMany(mappedBy="category" ,fetch=FetchType.EAGER, cascade=CascadeType.REMOVE)
	private Set<Product> product=new HashSet<Product>();
	public Set<Product> getProduct() {
		return product;
	}
	public void setProduct(Set<Product> product) {
		this.product = product;
	}
	
	
	}