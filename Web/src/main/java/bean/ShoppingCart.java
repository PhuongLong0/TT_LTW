package bean;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {
	List<Product> shoppingCart;

	public ShoppingCart() {
		super();
		this.shoppingCart = new ArrayList<Product>();
	}

	public List<Product> getShoppingCart() {
		return shoppingCart;
	}

	public void setShoppingCart(List<Product> shoppingCart) {
		this.shoppingCart = shoppingCart;
	}
	public int getsize() {
		return shoppingCart.size();
	}
	public void add(Product product) {
		shoppingCart.add(product);
	}
	public void delete(Product product) {
		shoppingCart.remove(product);
	}
	public double getPrice() {
		double res=0;
		for (Product product : shoppingCart) {
			res+=product.cost;
		}
		return res;
	}
}
