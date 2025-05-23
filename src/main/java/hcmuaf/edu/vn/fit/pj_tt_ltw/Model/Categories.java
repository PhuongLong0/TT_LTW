package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

public class Categories {
    private int categoryId;
    private String categoryName ;

    public Categories(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

}
