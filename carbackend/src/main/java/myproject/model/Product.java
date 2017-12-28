package myproject.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Component
@Table(name="Product")

public class Product {

	//private static final String DegenarationType = null;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int proRn;
	public void setProRn(int proRn) {
		this.proRn = proRn;
	}
	@Column(name="Product_name")
	private String proNm;
	
	private String proType;
	private float price;
	private int qty;
	private String categoryId;
	@Transient
	MultipartFile image;
	public String getProNm() {
		return proNm;
	}
	public void setProNm(String proNm) {
		this.proNm = proNm;
	}

	public String getProType() {
		return proType;
	}
	public void setProType(String proType) {
		this.proType = proType;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public int getProRn() {
		return proRn;
	}
	@ManyToOne
	@JoinColumn(name="categoryId" , insertable=false, nullable=false, updatable=false)
	private Category category;
	
	
	
	
	
	
	
	}

