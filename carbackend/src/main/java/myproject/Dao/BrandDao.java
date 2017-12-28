package myproject.Dao;


import java.util.List;

import myproject.model.Brand;

public interface BrandDao {

	public boolean addBrand(Brand b);
	public boolean deleteBrand(String brandId);
	public boolean updateBrand(Brand b);
	List<Brand> getAllBrands();
	Brand getBrandByID(String brID);
	List<Brand> getBrandByCategoryID(String catId);
}
