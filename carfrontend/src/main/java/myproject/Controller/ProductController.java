package myproject.Controller;


import java.io.FileOutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import myproject.Dao.BrandDao;
import myproject.Dao.CategoryDao;
import myproject.Dao.ProductDao;

import myproject.model.Product;

@Controller
public class ProductController {
	@Autowired
	ProductDao productDao;
	@Autowired
	BrandDao brandDao;
	@Autowired
	CategoryDao categoryDao;
	
	@RequestMapping(value="/addProduct",method=RequestMethod.POST )
	
	public String addproduct(@ModelAttribute("product")Product p, HttpSession session)
	{
		if(p.getProRn()==0)
		{
		productDao.addProduct(p);
		MultipartFile mp=p.getImage();
		System.out.println(mp.getOriginalFilename());
		ServletContext context=session.getServletContext();
		String filelocation=context.getRealPath("/resources/carrental");
		System.out.println(filelocation);
		String filename=filelocation+"\\"+p.getProRn()+".jpg";
		System.out.println(filename);
		try{
			byte b[]=mp.getBytes();
		FileOutputStream fos=new FileOutputStream(filename);
		fos.write(b);
		fos.close();
		}
		catch(Exception e){}
		
		}
		
		else
		{
			productDao.updateProduct(p);
		}
		return "redirect:/Product";
	}	
   @RequestMapping(value="/updateProduct/{productId}")
	public String updateproduct(@PathVariable("productId")int prorn,Model model)
	{
		model.addAttribute("product",productDao.getProductById(prorn));
		model.addAttribute("categoryList",categoryDao.getAllCategory());
		model.addAttribute("productList",productDao.getAllProduct());
		return "Product";
		}
   
   @RequestMapping(value="/deleteProduct/{productId}")
  	public String deleteproduct(@PathVariable("productId")int prorn,Model model)
  	{
  		model.addAttribute("product",productDao.getProductById(prorn));
  		productDao.deleteProduct(prorn);
  		model.addAttribute("productList",productDao.getAllProduct());
  		return "redirect:/Product";
  		}

}
