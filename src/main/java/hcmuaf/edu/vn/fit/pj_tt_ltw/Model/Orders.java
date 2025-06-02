package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public class Orders {
   private int  orderId ;
   private Date orderDate;
   private StatusOrder statusOrder;
   private Timestamp updateAt ;
   private int totalAmount;
   private PaymentMethod paymentMethod ;
   private int userId;
    private Map<Integer, Integer> items;

    public Orders(Map<Integer, Integer> items) {
        this.items = items;
    }

    public Orders() {

    }

    public Map<Integer, Integer> getItems() {
        return items;
    }

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

    public Date getOrderDate(Date orderDate) {
        return orderDate;
    }
    public void setOrderDate(Date date) {
        this.orderDate = date;
    }
    public StatusOrder getStatusOrder() {
        return statusOrder;
    }
    public void setStatusOrder(StatusOrder statusOrder) {
        this.statusOrder = statusOrder;
    }
    public Timestamp getUpdateAt() {
        return updateAt;
    }
    public void setUpdateAt(Timestamp updateAt) {
        this.updateAt = updateAt;
    }
    public int getTotalAmount() {
        return totalAmount;
    }
    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }
    public PaymentMethod getPaymentMethod() {
        return paymentMethod;
    }
    public void setPaymentMethod(PaymentMethod paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public int getOrderId() {
        return orderId;
    }
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
}
