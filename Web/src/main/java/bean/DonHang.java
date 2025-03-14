package bean;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

public class DonHang {
	List<Product> listproduct;
	Date ngaylaphoadon;
	boolean pheduyet;
	int id;

	public DonHang(int id, List<Product> listproduct, Date ngaylaphoadon, boolean pheduyet) {
		super();
		this.listproduct = listproduct;
		this.ngaylaphoadon = ngaylaphoadon;
		this.pheduyet = pheduyet;
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public DonHang(List<Product> listproduct) {
		super();
		this.listproduct = listproduct;
		this.pheduyet = false;
		LocalDate localDate = LocalDate.now();
		ngaylaphoadon = Date.valueOf(localDate);
	}

	public List<Product> getListproduct() {
		return listproduct;
	}

	public void setListproduct(List<Product> listproduct) {
		this.listproduct = listproduct;
	}

	public Date getNgaylaphoadon() {
		return ngaylaphoadon;
	}

	public void setNgaylaphoadon(Date ngaylaphoadon) {
		this.ngaylaphoadon = ngaylaphoadon;
	}

	public boolean isPheduyet() {
		return pheduyet;
	}

	public void setPheduyet(boolean pheduyet) {
		this.pheduyet = pheduyet;
	}
	public double price() {
		double res=0;
		for (Product product : listproduct) {
			res+= product.cost;
		}
		return res;
	}
}
