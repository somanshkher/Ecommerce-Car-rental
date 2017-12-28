package myproject.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name="Brand")
public class Brand {
    
	@Id
	private String brandId;
	private String brandType;
	private String brandName;
	
	public String getBrandId() {
		return brandId;
	}
	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}
	public String getBrandType() {
		return brandType;
	}
	public void setBrandType(String brandType) {
		this.brandType = brandType;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	
	@OneToMany(mappedBy="brand" ,fetch=FetchType.EAGER, cascade=CascadeType.REMOVE)
	private Set<Category> p=new HashSet<Category>();
	
	public Set<Category> getP() {
		return p;
	}
	public void setP(Set<Category> p) {
		this.p = p;
	}
	
	
	

	
}