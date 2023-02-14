package bookshop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookshop.Dao.CategorysDao;
import bookshop.Dao.MenusDao;
import bookshop.Dao.ProductsDao;
import bookshop.Dao.SlidesDao;
import bookshop.Dto.ProductsDto;
import bookshop.Entity.Slides;
import bookshop.Entity.Categorys;
import bookshop.Entity.Menus;
@Service
public class HomeServiceImpl implements IHomeService{
	@Autowired
	private SlidesDao slidesDao;
	@Autowired
	private CategorysDao categorysDao;
	@Autowired
	private MenusDao menusDao;
	@Autowired
	private ProductsDao productsDao;

	
	public List<Slides> GetDataSlide() {
		return slidesDao.GetDataSlide();
	}

	
	public List<Categorys> GetDataCategorys() {
		return categorysDao.GetDataCategorys();
	}
	
	public List<Menus> GetDataMenus() {
		return menusDao.GetDataMenus();
	}


	@Override
	public List<ProductsDto> GetDataProducts() {
		List<ProductsDto> listProducts = productsDao.GetDataProducts();
		return listProducts;
	}
	

}
