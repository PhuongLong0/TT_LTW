package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

import java.sql.Date;

public class ProductViews {
   private int productViewId;
   private int viewProduct;
   private Date dayView;
   private int productId;

   public ProductViews(int productViewId, int viewProduct, Date dayView, int productId) {
       this.productViewId = productViewId;
       this.viewProduct = viewProduct;
       this.dayView = dayView;
       this.productId = productId;
   }
}
