package bookshop.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;


import bookshop.Dto.ProductsDto;
import bookshop.Dto.ProductsDtoMapper;
@Repository
public class ProductsDao extends BaseDao{
	
	
	private final boolean YES = true;
	
	private StringBuffer SqlString() {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT ");
		sql.append("p.id AS id ");
		sql.append(", p.id_category ");
		sql.append(", p.name ");
		sql.append(", p.price ");
		sql.append(", p.img ");
		sql.append(", p.description ");
		sql.append(", p.highlight ");
		sql.append(", p.details ");
		sql.append(", p.created_at ");
		sql.append(", p.updated_at ");
		sql.append("FROM ");
		sql.append("products AS p ");		
		return sql;
	}
	
	private String SqlProducts(boolean highLight) {
		StringBuffer  sql = SqlString();
		if(highLight) {
			sql.append("WHERE p.highlight = true ");
		}
			sql.append("ORDER BY RAND() ");	
		
		if(highLight) {
			sql.append("LIMIT 30 ");
		}
		return sql.toString();
	}
	
	private StringBuffer SqlProductsByID(int id) {
		StringBuffer  sql = SqlString();
		sql.append("WHERE 1 = 1 ");
		sql.append("AND id_category = "+ id + " ");
		return sql;
	}
	
	private String SqlProductsPaginate(int id, int start, int totalPage) {
		StringBuffer  sql = SqlProductsByID(id);
		sql.append("LIMIT "+ start + ", "+ totalPage);
		return sql.toString();
	}
	
	public List<ProductsDto> GetDataProducts() {
		String sql = SqlProducts(YES);
		List<ProductsDto> listProducts = _jdbcTemplate.query(sql, new ProductsDtoMapper());
		return listProducts;
	}
	
	public List<ProductsDto> GetAllProductsByID(int id) {
		String sql = SqlProductsByID(id).toString();
		List<ProductsDto> listProducts = _jdbcTemplate.query(sql, new ProductsDtoMapper());
		return listProducts;
	}
	

	public List<ProductsDto> GetDataProductsPaginate(int id, int start, int totalPage) {
		StringBuffer sqlGetDataByID = SqlProductsByID(id);
		List<ProductsDto> listProductsByID = _jdbcTemplate.query(sqlGetDataByID.toString(), new ProductsDtoMapper());
		List<ProductsDto> listProducts = new ArrayList<ProductsDto>();
		if(listProductsByID.size() > 0) {
			String sql = SqlProductsPaginate(id, start, totalPage);
			listProducts = _jdbcTemplate.query(sql, new ProductsDtoMapper());
		}
		return listProducts;
	}

	private String SqlProductByID(long id) {
		StringBuffer  sql = SqlString();
		sql.append("WHERE 1 = 1 ");
		sql.append("AND p.id = "+ id + " ");
		sql.append("LIMIT 1 ");
		return sql.toString();
	}
	public List<ProductsDto> GetProductByID(long id) {
		String sql = SqlProductByID(id);
		List<ProductsDto> listProduct = _jdbcTemplate.query(sql, new ProductsDtoMapper());
		return listProduct;
	}
	
	public ProductsDto FindProductByID(long id) {
		String sql = SqlProductByID(id);
		ProductsDto product = _jdbcTemplate.queryForObject(sql, new ProductsDtoMapper());
		return product;
	}

	public void delete(int contactId) {
		String sql = "DELETE FROM products WHERE id=?";
		_jdbcTemplate.update(sql, contactId);
	}
	
	public void saveOrUpdate(ProductsDto product) {
		if (product.getid() > 0) {
			// update
			String sql = "UPDATE products SET id_category=?, name=?, price=?,img=? , description=?, highlight=? ,details=?"
					+ " WHERE id=?";
			_jdbcTemplate.update(sql, product.getId_category(), product.getName(), product.getPrice(),
					product.getImg(), product.getDescription(), product.getHighlight(), product.getDetails(), product.getid());
		} else {
			// insert
			String sql = "INSERT INTO products (id, id_category, name, price,img,description,highlight,details)"
					+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			_jdbcTemplate.update(sql, product.getid(), product.getId_category(), product.getName(),
					product.getPrice(), product.getImg(), product.getDescription(), product.getHighlight(), product.getDetails());
		}

	}  
	public ProductsDto get(int contactId) {
		String sql = "SELECT * FROM products WHERE id=" + contactId;
		return _jdbcTemplate.query(sql, new ResultSetExtractor<ProductsDto>() {

			public ProductsDto extractData(ResultSet rs) throws SQLException, DataAccessException {
				if (rs.next()) {
				ProductsDto products = new ProductsDto();
				products.setid(rs.getLong("id"));
				products.setId_category(rs.getInt("id_category"));
				products.setName(rs.getString("name"));
				products.setPrice(rs.getDouble("price"));
				products.setImg(rs.getString("img"));
				products.setDescription(rs.getString("description"));
				products.setHighlight(rs.getBoolean("highlight"));
				products.setDetails(rs.getString("details"));
				products.setCreated_at(rs.getDate("created_at"));
				products.setUpdated_at(rs.getDate("updated_at"));

				return products;
			}

			
				return null;
			}

	
		});
	}
	
}
