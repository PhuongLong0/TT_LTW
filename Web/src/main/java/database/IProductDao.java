package database;

import java.util.List;

import bean.Product;
import bean.User;

public interface IProductDao {
	public List<Product> all();

	public int insert(Product product);

	public int update(Product product);

	public int delete(Product product);

	public Product findById(String id);
	
	public int count(String txtSearch);

	public List<Product> searchResult(String txtSearch);
}
