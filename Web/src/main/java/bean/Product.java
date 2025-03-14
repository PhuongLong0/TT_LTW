package bean;

import java.util.ArrayList;
import java.util.List;

public class Product {
	public int id;
	String name;
	List<String> listimg;
	String detail;
	double cost;
	String category;
	int quantity;

	public Product(int id, String name, String detail, double cost) {
		super();
		this.id = id;
		this.name = name;
		this.detail = detail;
		this.cost = cost;
		listimg = new ArrayList();
	}

	public Product(int id, String name, List<String> listimg, String detail, double cost, String category,
			int quantity) {
		super();
		this.id = id;
		this.name = name;
		this.listimg = listimg;
		this.detail = detail;
		this.cost = cost;
		this.category = category;
		this.quantity = quantity;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Product(String name, List<String> image, String detail, double cost, String category, int quantity) {
		this.name=name;
		this.listimg= image;
		this.detail=detail;
		this.cost=cost;
		this.category=category;
		this.quantity=quantity;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getFirstImage() {
		return listimg.get(0);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<String> getListimg() {
		return listimg;
	}

	public void setListimg(ArrayList<String> listimg) {
		this.listimg = listimg;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

}
