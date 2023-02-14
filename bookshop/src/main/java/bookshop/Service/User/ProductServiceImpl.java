package bookshop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookshop.Dao.ProductsDao;
import bookshop.Dto.ProductsDto;
@Service
public class ProductServiceImpl implements IProductService{
	@Autowired
	ProductsDao productDao = new ProductsDao();
	
	public ProductsDto GetProductByID(long id) {
		List<ProductsDto> listProducts = productDao.GetProductByID(id);
		return listProducts.get(0);
	}

	@Override
	public List<ProductsDto> GetProductByIDCategory(int id) {	
		return productDao.GetAllProductsByID(id);
	}
}
