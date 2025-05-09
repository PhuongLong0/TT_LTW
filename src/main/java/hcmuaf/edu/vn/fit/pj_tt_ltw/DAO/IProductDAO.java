package hcmuaf.edu.vn.fit.pj_tt_ltw.DAO;

import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;

import java.util.List;

public interface IProductDAO {
    public List<Products> all();

    public int insert(Products products);

    public int update(Products products);

    public int delete(Products products);

    public Products findById(String id);

    public int count(String txtSearch);

    public List<Products> searchResult(String txtSearch);

}
