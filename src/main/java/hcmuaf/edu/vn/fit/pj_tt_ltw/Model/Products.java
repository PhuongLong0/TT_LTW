package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Products {
    private int productId;
    private String productName;
    private int priceBuy;
    private int priceSell;
    private String productDetail;
    private String brandName;
    private Timestamp createAt;
   // private int imageId;
    private int categoryId;

    private List<String> listimg = new ArrayList<>();


    public Products(int productId, String productName, int priceBuy, int priceSell, String productDetail, String brandName, Timestamp createAt, int categoryId) {
        this.productId = productId;
        this.productName = productName;
        this.priceSell = priceSell;
        this.priceBuy = priceBuy;
        this.productDetail = productDetail;
        this.brandName = brandName;
        this.createAt = createAt;
        this.categoryId = categoryId;
        //this.listimg =  imageNames;
       // this.imageId = imageId;


    }
    public Products(int productId, String productName, String productDetail, int priceSell) {
        this.productId = productId;
        this.productName = productName;
        this.productDetail = productDetail;
        this.priceSell = priceSell;
    }

    public Products(int productId, String name, int priceSell, int priceBuy, String detail, int categoryId, ArrayList<String> imageNames) {
    this.productId = productId;
    this.productName = name;
    this.priceSell = priceSell;
    this.priceBuy = priceBuy;
    this.productDetail = detail;
    this.categoryId = categoryId;
    this.listimg = imageNames;
    }

    public Products() {

    }

    public int getProductId() {
        return productId;
    }
    public void setProductId(int productId) {
        this.productId = productId;
    }
    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public int getPriceBuy() {
        return priceBuy;
    }
    public void setPriceBuy(int priceBuy) {
        this.priceBuy = priceBuy;
    }
    public int getPriceSell() {
        return priceSell;
    }
    public void setPriceSell(int priceSell) {
        this.priceSell = priceSell;
    }
    public String getProductDetail() {
        return productDetail;
    }
    public void setProductDetail(String productDetail) {
        this.productDetail = productDetail;
    }
    public String getBrandName() {
        return brandName;
    }
    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
//    public void setImageId(int imageId) {
//        this.imageId = imageId;
//    }
//    public int getImageId() {
//        return imageId;
//    }
    public Timestamp getCreateAt() {
        return createAt;
    }
    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }
    public int getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Products{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", priceBuy=" + priceBuy +
                ", priceSell=" + priceSell +
                ", productDetail='" + productDetail + '\'' +
                ", brandName='" + brandName + '\'' +
                //", imageId=" + imageId +
                ", createAt=" + createAt +
                ", categoryId=" + categoryId +
                '}';
    }

    public List<String> getListimg() {
        return listimg;
    }
    public void setListimg(List<String> images) {
        this.listimg = images;
    }
    public String getFirstImage() {
        return listimg.get(0);
    }
}

