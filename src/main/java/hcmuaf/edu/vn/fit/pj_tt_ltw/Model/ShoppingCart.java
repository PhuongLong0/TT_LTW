package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {
    List<Products> shoppingCart;

    public ShoppingCart() {
        super();
        this.shoppingCart = new ArrayList<Products>();
    }

    public List<Products> getShoppingCart() {
        return shoppingCart;
    }

    public void setShoppingCart(List<Products> shoppingCart) {
        this.shoppingCart = shoppingCart;
    }
    public int getsize() {
        return shoppingCart.size();
    }
    public void add(Products product) {
        shoppingCart.add(product);
    }
    public void delete(Products product) {
        shoppingCart.remove(product);
    }
    public double getPrice() {
        double res=0;
        for (Products product : shoppingCart) {
            res+=product.getPriceSell();
        }
        return res;
    }
}

