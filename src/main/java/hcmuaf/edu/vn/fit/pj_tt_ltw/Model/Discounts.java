package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

import java.sql.Date;
import java.sql.Timestamp;

public class Discounts {
    private int discountId;
    private String discountDetail;
    private String discountCode;
    private int discountValue;
    private Date statusDate;
    private Date endDate;
    private Timestamp createAt ;

   public Discounts(int discountId, String discountCode, String discountDetail, int discountValue, Date statusDate, Date endDate, Timestamp createAt) {
       this.discountId = discountId;
       this.discountCode = discountCode;
       this.discountDetail = discountDetail;
       this.discountValue = discountValue;
       this.statusDate = statusDate;
       this.endDate = endDate;
       this.createAt = createAt;
   }
}
