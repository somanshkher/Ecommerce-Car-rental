package myproject.Controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import myproject.Dao.BrandDao;
import myproject.Dao.CategoryDao;
import myproject.model.Category;

@Controller
public class CategoryController 
{

	
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	BrandDao brandDao;
	
	@RequestMapping(value="/addCategory",method=RequestMethod.POST  )
	
	public String addcategory(@ModelAttribute("category")Category c)
	{
		if(c.getCatId()==null)
		{
		categoryDao.addCategory(c);
		}
		else
		{
			categoryDao.updateCategory(c);
		}
		return "redirect:/Category";
		
	}
	
   @RequestMapping(value="/updateCategory/{catid}")
   public String updatecategory(@PathVariable("catid")String catid,Model model)
	{
	   
		model.addAttribute("category",categoryDao.getCategoryById(catid));
		model.addAttribute("categoryList",categoryDao.getAllCategory());
		model.addAttribute("brandList",brandDao.getAllBrands());
		return "Category";

		
		}
   
   @RequestMapping(value="/deleteCategory/{catid}")
  	public String deletecategory(@PathVariable("catid")String catid,Model model)
  	{

  		model.addAttribute("category",categoryDao.getCategoryById(catid));
  		categoryDao.deleteCategory(catid);
   		model.addAttribute("categoryList",categoryDao.getAllCategory());
   		return "redirect:/Category";

  		
  		}

   
}
