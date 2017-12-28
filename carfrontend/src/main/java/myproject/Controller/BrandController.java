package myproject.Controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import myproject.Dao.BrandDao;
import myproject.Dao.CategoryDao;
import myproject.model.Brand;


@Controller
public class BrandController {

	
	@Autowired
	BrandDao brandDao;
	@Autowired
	CategoryDao categoryDao;
	@RequestMapping(value="/Brandadd",method=RequestMethod.POST)
	
	public String addBrand(@ModelAttribute("brand")Brand b)
	
	{
		System.out.println("brand");
		if(b.getBrandId()==null)
		{
			brandDao.addBrand(b);
		}
		else
		{
			brandDao.updateBrand(b);
		}
		return "redirect:/Brand";
		
		
	}
@RequestMapping(value="/updateBrand/{brandId}")
	
	public String updateBrand(@PathVariable("brandId")String brID,Model model)
	{
	    model.addAttribute("brand",brandDao.getBrandByID(brID));
	   	model.addAttribute("brandList", brandDao.getAllBrands());
		return "Brand";
	}
@RequestMapping(value="/deleteBrand/{brandId}")

public String deleteProduct(@PathVariable("brandId")String brID,Model model)
{
    
	model.addAttribute("brand",brandDao.getBrandByID(brID));
	brandDao.deleteBrand(brID);
	model.addAttribute("brandList",brandDao.getAllBrands());
	return "redirect:/Brand";
}
	
}
