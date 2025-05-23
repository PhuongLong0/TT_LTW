package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

import java.sql.Timestamp;

public class Stocks {
    private int stockId;
    private String stockName ;
    private int quatityStock;
    private int minQuatity;
    private Timestamp updateStockAt ;
    private int productId;

    public Stocks(int stockId, String stockName, int quatityStock, int minQuantity, Timestamp updateStockAt, int productId) {
        this.stockId = stockId;
        this.stockName = stockName;
        this.quatityStock= quatityStock;
        this.minQuatity = minQuantity;
        this.updateStockAt = updateStockAt;
        this.productId = productId;
    }
}
