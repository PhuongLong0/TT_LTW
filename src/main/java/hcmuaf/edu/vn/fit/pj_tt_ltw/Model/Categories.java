package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

public class Categories {
    private int categoryId;
    private String categoryName ;

    public Categories(int categoryId, String categoryName) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
    }

    public Categories(String categoryName) {
        this.categoryName = categoryName;
    }
}
