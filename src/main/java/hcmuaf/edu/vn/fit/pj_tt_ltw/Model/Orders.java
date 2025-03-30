package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.List;

public class Orders {
   private int  orderId ;
   private Date orderDate;
   private StatusOrder statusOrder;
   private Timestamp updateAt ;
   private int totalAmount;
   private PaymentMethod paymentMethod ;
   private int userId;

   public Orders(int orderId, Date orderDate, StatusOrder statusOrder, Timestamp updateAt, int totalAmount, PaymentMethod paymentMethod, int userId) {
       this.orderId = orderId;
       this.orderDate = orderDate;
       this.statusOrder = statusOrder;
       this.updateAt = updateAt;
       this.totalAmount = totalAmount;
       this.paymentMethod = paymentMethod;
       this.userId = userId;
   }

    public Orders(List<Products> shoppingCart) {
    }

    public boolean isPheduyet() {
       return false;
    }

    public ResultSet getNgaylaphoadon() {
       return null;
    }

    public Products[] getListproduct() {
       return null;
    }
}
