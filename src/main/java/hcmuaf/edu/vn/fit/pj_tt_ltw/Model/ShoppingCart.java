package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.ProductDAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ShoppingCart {
//    List<Products> shoppingCart;
//
//    public ShoppingCart() {
//        super();
//        this.shoppingCart = new ArrayList<Products>();
//    }
//
//    public List<Products> getShoppingCart() {
//        return shoppingCart;
//    }
//
//    public void setShoppingCart(List<Products> shoppingCart) {
//        this.shoppingCart = shoppingCart;
//    }
//    public int getsize() {
//        return shoppingCart.size();
//    }
//    public void add(Products products) {
//        shoppingCart.add(products);
//    }
//    public void delete(Products products) {
//        shoppingCart.remove(products);
//    }
//    public double getPrice() {
//        double res=0;
//        for (Products products : shoppingCart) {
//            res+= products.getPriceSell();
//        }
//        return res;
//    }

    private Map<Integer, Integer> cart = new HashMap<>(); // key: productId, value: quantity

    public ShoppingCart() {}

    // Thêm sản phẩm vào giỏ hàng
    public void add(int productId) {
        cart.put(productId, cart.getOrDefault(productId, 0) + 1);
    }

    // Xóa sản phẩm khỏi giỏ hàng
    public void delete(int productId) {
        cart.remove(productId);
    }

    // Lấy toàn bộ sản phẩm trong giỏ
    public Map<Integer, Integer> getCart() {
        return cart;
    }

    // Lấy số lượng sản phẩm
    public int getSize() {
        return cart.size();
    }

    // Lấy tổng số sản phẩm (đếm theo số lượng)
    public int getTotalQuantity() {
        return cart.values().stream().mapToInt(Integer::intValue).sum();
    }

    // Xóa toàn bộ giỏ hàng
    public void clear() {
        cart.clear();
    }

    public Map<Products, Integer> getProductQuantityMap() {
        Map<Products, Integer> result = new HashMap<>();
        ProductDAO dao = new ProductDAO();
        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
            Products product = dao.findById(String.valueOf(entry.getKey()));
            if (product != null) {
                result.put(product, entry.getValue());
            }
        }
        return result;
    }

    // Thêm hàm tính tổng giá
    public double getTotalPrice() {
        ProductDAO dao = new ProductDAO();
        double total = 0;
        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
            Products product = dao.findById(String.valueOf(entry.getKey()));
            if (product != null) {
                total += product.getPriceSell() * entry.getValue();
            }
        }
        return total;
    }
    //Lấy tổng giá
    public double getPrice() {
        return getTotalPrice();
    }

}

