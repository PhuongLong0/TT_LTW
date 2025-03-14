package bean;

public class Category {
	String category;
	int num;
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public Category(String category, int num) {
		super();
		this.category = category;
		this.num = num;
	}
}
