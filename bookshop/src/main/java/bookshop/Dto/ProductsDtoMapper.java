package bookshop.Dto;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProductsDtoMapper implements RowMapper<ProductsDto>{

	@Override
	public ProductsDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		//coi chổ này nè đang bị map sai á
		ProductsDto products = new ProductsDto();
		products.setId_pr(rs.getLong("id_pr"));
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

}
