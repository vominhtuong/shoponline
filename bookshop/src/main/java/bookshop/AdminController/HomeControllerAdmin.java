package bookshop.AdminController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bookshop.Dao.CategorysDao;
import bookshop.Dao.ProductsDao;
import bookshop.Dto.ProductsDto;
import bookshop.Entity.Users;
import bookshop.Service.User.AccountServiceImpl;
import bookshop.UserController.BaseController;

@Controller
public class HomeControllerAdmin extends BaseController{
	
	@Autowired
	ProductsDao productDao;
	@Autowired
	CategorysDao categoryDao;
	@Autowired
	AccountServiceImpl accountService = new AccountServiceImpl();
	
	@RequestMapping(value = {"/admin/", "/admin/login", "/quan-tri/dang-nhap"}, method = RequestMethod.GET)
	public String Admin_login() {
		return "admin/login";
	}
	@RequestMapping(value= "/admin", method = RequestMethod.GET)
	public ModelAndView DangNhap() {
		_mvShare.setViewName("admin/transfer");
		_mvShare.addObject("user");
		return _mvShare;
	}
	
	@RequestMapping(value= "/admin", method = RequestMethod.POST)
	public ModelAndView Login(HttpSession session, @ModelAttribute("user") Users user) {
		user = accountService.CheckAccount(user);
		if(user != null){
			if(user.getRules().equals("admin")) {
				_mvShare.setViewName("admin/transfer");
				session.setAttribute("LoginInfo", user);
			}else {			
			_mvShare.setViewName("redirect:home");
			session.setAttribute("LoginInfo", user);
			}
		}
		return _mvShare;
	}

	@RequestMapping(value = {"/admin/form", "quan-tri/cap-nhat-kh"}, method = RequestMethod.GET)
	public String Admin_form() {
		return "admin/form";
	}
	
	@RequestMapping(value = {"/admin/products", "quan-tri/cn-khoahoc"}, method = RequestMethod.GET)
	public ModelAndView Admin_products() {
		ModelAndView  mv = new ModelAndView("admin/products");
		mv.addObject("showProducts", productDao.GetDataProducts());
		return mv;
	}
	
	@RequestMapping(value = "/deleteContact", method = RequestMethod.GET)
	public ModelAndView deleteContact(HttpServletRequest request) {
	    int contactId = Integer.parseInt(request.getParameter("id"));
	    productDao.delete(contactId);
	    return new ModelAndView("redirect:admin/products");
	}
	@RequestMapping(value = "/add-product", method = RequestMethod.GET)
	public ModelAndView newContact(ModelAndView model) {
		ProductsDto newContact = new ProductsDto();
	    model.addObject("products", newContact);
	    model.setViewName("admin/addproduct");
	    return model;
	}
	
	@RequestMapping(value = "/saveproduct", method = RequestMethod.POST)
	public ModelAndView saveContact(@ModelAttribute ProductsDto contact) {
		productDao.saveOrUpdate(contact);
	    return new ModelAndView("redirect:admin/products");
	}
	@RequestMapping(value = "/editProduct", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) {
	    int contactId = Integer.parseInt(request.getParameter("id"));
	    ProductsDto contact = productDao.get(contactId);
	    ModelAndView model = new ModelAndView("admin/addproduct");
	    model.addObject("products", contact);
	 
	    return model;
	}
}
