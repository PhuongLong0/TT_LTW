package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

import java.sql.Date;
import java.sql.Timestamp;

public class Discounts {
    private int discountId;
<<<<<<< HEAD
    private String discountCode;
    private String discountDetail;
    private int discountValue;
    private Date statusDate;
    private Date endDate;
    private Timestamp createAt;
    private String discountType;
    private int minOrderValue;
    private Integer targetProductCode; // null nếu không áp dụng cho sản phẩm cụ thể


   public Discounts(int discountId, String discountCode, String discountDetail, int discountValue, Date statusDate, Date endDate, Timestamp createAt, String discountType, int minOrderValue, Integer targetProductCode) {
=======
    private String discountDetail;
    private String discountCode;
    private int discountValue;
    private Date statusDate;
    private Date endDate;
    private Timestamp createAt ;

   public Discounts(int discountId, String discountCode, String discountDetail, int discountValue, Date statusDate, Date endDate, Timestamp createAt) {
>>>>>>> origin/Long-Admin
       this.discountId = discountId;
       this.discountCode = discountCode;
       this.discountDetail = discountDetail;
       this.discountValue = discountValue;
       this.statusDate = statusDate;
       this.endDate = endDate;
       this.createAt = createAt;
<<<<<<< HEAD
       this.discountType = discountType;
       this.minOrderValue = minOrderValue;
       this.targetProductCode = targetProductCode;
   }
   public int getDiscountId() {
       return discountId;
   }
   public void setDiscountId(int discountId) {
       this.discountId = discountId;
   }
   public String getDiscountCode() {
       return discountCode;
   }
   public void setDiscountCode(String discountCode) {
       this.discountCode = discountCode;
   }

   public String getDiscountDetail() {
       return discountDetail;
   }
   public  void setDiscountDetail(String discountDetail) {
       this.discountDetail = discountDetail;
   }
   public int getDiscountValue() {
       return discountValue;
   }
   public void setDiscountValue(int discountValue) {
       this.discountValue = discountValue;
   }
   public Date getStatusDate() {
       return statusDate;
   }
   public void setStatusDate(Date statusDate) {
       this.statusDate = statusDate;
   }
   public Date getEndDate() {
       return endDate;
   }
   public void setEndDate(Date endDate) {
       this.endDate = endDate;
   }
   public Timestamp getCreateAt() {
       return createAt;
   }
   public void setCreateAt(Timestamp createAt) {
       this.createAt = createAt;
   }
   public String getDiscountType() {
       return discountType;
   }
   public void setDiscountType(String discountType) {
       this.discountType = discountType;
   }
   public int getMinOrderValue() {
       return minOrderValue;
   }
   public void setMinOrderValue(int minOrderValue) {
       this.minOrderValue = minOrderValue;
   }
   public Integer getTargetProductCode() {
       return targetProductCode;
   }
   public void setTargetProductCode(Integer targetProductCode) {
       this.targetProductCode = targetProductCode;
   }

=======
   }
>>>>>>> origin/Long-Admin
}
