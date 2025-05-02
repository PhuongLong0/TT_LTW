package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

public class Categories {
    private int categoryId;
    private String categoryName ;
    private int num; // thêm số lượng sản phẩm k có trong databse
    public Categories(int categoryId, String categoryName) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
    }

    public int getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    public String getCategoryName() {
        return categoryName;
    }
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
    public Categories(String categoryName) {
        this.categoryName = categoryName;
    }
}
