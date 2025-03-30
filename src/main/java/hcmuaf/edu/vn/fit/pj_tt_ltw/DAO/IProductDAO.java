package hcmuaf.edu.vn.fit.pj_tt_ltw.DAO;

import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;

import java.util.List;

public interface IProductDAO {
    public List<Products> all();

    public int insert(Products product);

    public int update(Products product);

    public int delete(Products product);

    public Products findById(String id);

    public int count(String txtSearch);

    public List<Products> searchResult(String txtSearch);
}
