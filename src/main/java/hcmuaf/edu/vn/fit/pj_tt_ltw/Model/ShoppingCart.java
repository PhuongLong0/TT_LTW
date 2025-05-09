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
    public void add(Products products) {
        shoppingCart.add(products);
    }
    public void delete(Products products) {
        shoppingCart.remove(products);
    }
    public double getPrice() {
        double res=0;
        for (Products products : shoppingCart) {
            res+= products.getPriceSell();
        }
        return res;
    }
}

