package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

public class OrderDetails {
    private int orderDetailId;
    private int unitPrice;
    private int quantity;
    private int statusDetail;
    private int productId;
    private int orderId;

    public OrderDetails(int orderDetailId, int unitPrice, int quantity, int statusDetail, int productId, int orderId) {
        this.orderDetailId = orderDetailId;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
        this.statusDetail = statusDetail;
        this.productId = productId;
        this.orderId = orderId;
    }

}
