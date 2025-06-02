package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Discounts;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.ShoppingCart;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public class ApplyDiscounts {
/*
    public static int applyDiscounts(ShoppingCart cart, List<Discounts> discountList) {
        double total = cart.getPrice();
        int finalDiscount = 0;

        for (Discounts d : discountList) {
            if (d.getStatusDate().before(new Date()) && d.getEndDate().after(new Date())) {
                if ("PERCENT".equalsIgnoreCase(d.getDiscountType()) && total >= d.getMinOrderValue()) {
                    finalDiscount += total * d.getDiscountValue() / 100;
                } else if ("AMOUNT".equalsIgnoreCase(d.getDiscountType())) {
                    for (Map.Entry<Integer, Integer> entry : cart.getCart().entrySet()) {
                        if (d.getTargetProductCode() != null && d.getTargetProductCode().equals(entry.getKey())) {
                            finalDiscount += d.getDiscountValue();
                            break;
                        }
                    }
                }
            }
        }
        return finalDiscount;
    }*/
}
